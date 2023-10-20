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
using Newtonsoft.Json.Linq;

namespace TALENTS
{
    public partial class UserHome : System.Web.UI.Page
    {
        private Model user;
        private LoginController loginSystem = new LoginController();

        //
        private const string ZoomApiBaseUrl = "https://api.zoom.us/v2";
        //private const string ClientId = "YOUR_CLIENT_ID";
        private const string ClientId = "2wP9l2ObRvWQHqEVfMdnaA";
        //private const string ClientSecret = "YOUR_CLIENT_SECRET";
        private const string ClientSecret = "QbOj4txGLLX3l54SNasULOvPYsrlmQT3";
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

            //// Create Zoom Link
            ////Task.Run(async () => meetingLink = await CreateMeetingLink()).Wait();

            var client = new RestClient("https://api.daily.co/v1");
            var request = new RestRequest("/rooms", Method.Post);
            request.AddHeader("Authorization", $"Bearer {"baf0f87f25d4a695784a1df4d4ab125e8fc799ebc4ccf9eb5beecd8fe3bee433"}");

            string type = LinkType.SelectedValue;
            if (type == "1") request.AddJsonBody(new { properties = new { enable_screenshare = false } });
            else request.AddJsonBody(new { properties = new { enable_screenshare = true } });
            var response = client.Execute(request);
            var json = JObject.Parse(response.Content);
            var meetingUrl = json["url"].ToString();

            HfMeetingLink.Value = meetingUrl;

            // Send Zoom Link to the Model
            ScriptManager.RegisterStartupScript(this, GetType(), "SendMeetingLink", "document.getElementById('" + BtnCreateLinkHidden.ClientID + "').click();", true);
        }
    }
}