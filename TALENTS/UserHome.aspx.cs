using Microsoft.AspNet.SignalR;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http.Headers;
using System.Net.Http;
using System.Text;
using System.Web;
using System.Web.Optimization;
using System.Web.UI;
using System.Web.UI.WebControls;
using TALENTS.Controller;
using TALENTS.DAO;
using TALENTS.Models;
using TALENTS.Util;
using System.Threading.Tasks;
using RestSharp;

namespace TALENTS
{
    public partial class UserHome : System.Web.UI.Page
    {
        private Model user;
        private LoginController loginSystem = new LoginController();

        //
        private const string ZoomApiBaseUrl = "https://api.zoom.us/v2";
        private const string ClientId = "YOUR_CLIENT_ID";
        private const string ClientSecret = "YOUR_CLIENT_SECRET";
        //
        protected void Page_Load(object sender, EventArgs e)
        {
            user = loginSystem.GetCurrentUserAccount();
            if (user == null || !loginSystem.IsUserLoggedIn())
            {
                Response.Redirect("~/Login.aspx");
                return;
            }

            string result = new SubscriptionUController().SubscriptionExpireDate(user.Id);
            HfPurchased.Value = (result != null).ToString();

            if (!IsPostBack)
            {
                LoadCity();
                LoadModelPhotos();
            }
        }

        private void LoadCity()
        {
            List<City> cities = new List<City>();
            cities = new CityDAO().FindAll();
            ComboCity.Items.Clear();
            ControlUtil.DataBind(ComboCity, cities, "Id", "Description", 0, "[unassigned]");
        }

        private void LoadModelPhotos()
        {
            int cityId = ControlUtil.GetSelectedValue(ComboCity) ?? 0;
            ModelController modelController = new ModelController();
            List<ModelCheck> modelList = modelController.SearchDashboardModels(cityId);
            ModelPhotoRepeater.DataSource = modelList;
            ModelPhotoRepeater.DataBind();
        }

        protected void BtnSearch_Click(object sender, EventArgs e)
        {
            LoadModelPhotos();
        }

        protected void BtnCreateLink_Click(object sender, EventArgs e)
        {
            int modelID = ParseUtil.TryParseInt(HfModelID.Value) ?? 0;
            if (modelID == 0)
            {
                ServerValidator.IsValid = false;
                return;
            }
            Model model = new ModelDAO().FindById(modelID);


            // Create Zoom Link
            //Task.Run(async () => meetingLink = await CreateMeetingLink()).Wait();
            string accessToken = GetAccessToken();
            string meetingId = CreateMeeting(accessToken);
            string zoomLink = $"https://zoom.us/j/{meetingId}";

            HfMeetingLink.Value = zoomLink;
            // Send Zoom Link to the Model
            ScriptManager.RegisterStartupScript(this, GetType(), "SendMeetingLink", "document.getElementById('" + BtnCreateLinkHidden.ClientID + "').click();", true);
        }

        private string CreateMeeting(string accessToken)
        {
            string userId = GetUserId(accessToken);
            string meetingId = CreateZoomMeeting(accessToken, userId);

            return meetingId;
        }

        private string GetAccessToken()
        {
            var client = new RestClient("https://zoom.us/oauth/token");
            var request = new RestRequest();

            request.AddParameter("grant_type", "client_credentials");
            request.AddParameter("client_id", ClientId);
            request.AddParameter("client_secret", ClientSecret);

            var response = client.Execute(request);
            var content = response.Content;

            // Parse the response to get the access token
            // You can use a JSON parsing library like Newtonsoft.Json
            // Here's a simple example without using a library
            string accessToken = content.Split(':')[1].Split(',')[0].Trim('"');

            return accessToken;
        }

        private string CreateZoomMeeting(string accessToken, string userId)
        {
            var client = new RestClient($"{ZoomApiBaseUrl}/users/{userId}/meetings");
            var request = new RestRequest();

            request.AddHeader("Authorization", $"Bearer {accessToken}");

            // Set the meeting details
            request.AddParameter("topic", "My Zoom Meeting");
            request.AddParameter("type", 2); // Scheduled meeting
            request.AddParameter("start_time", DateTime.UtcNow.AddMinutes(10).ToString("yyyy-MM-ddTHH:mm:ssZ"));
            request.AddParameter("duration", 30); // 30 minutes

            var response = client.Execute(request);
            var content = response.Content;

            // Parse the response to get the meeting ID
            // You can use a JSON parsing library like Newtonsoft.Json
            // Here's a simple example without using a library
            string meetingId = content.Split(':')[1].Split(',')[0].Trim('"');

            return meetingId;
        }

        private string GetUserId(string accessToken)
        {
            var client = new RestClient($"{ZoomApiBaseUrl}/users");
            var request = new RestRequest();

            request.AddHeader("Authorization", $"Bearer {accessToken}");

            var response = client.Execute(request);
            var content = response.Content;

            // Parse the response to get the user ID
            // You can use a JSON parsing library like Newtonsoft.Json
            // Here's a simple example without using a library
            string userId = content.Split(':')[1].Split(',')[0].Trim('"');

            return userId;
        }

    }
}