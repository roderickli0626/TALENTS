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


            // Create Zoom Link
            //Task.Run(async () => meetingLink = await CreateMeetingLink()).Wait();
            ScriptManager.RegisterStartupScript(this, GetType(), "JitsiMeetAPI", @"
                        $('#myModal').modal('hide');
                        $('#mettingMoal').modal('show');
                        // Generate a JWT token with the moderator role claim
                        function generateToken(username) {
                          const payload = {
                            username: username,
                            role: 'moderator',
                          };
                          const secretKey = 'your-secret-key'; // Replace with your own secret key

                          // Hash the secret key using SHA256 algorithm
                          const hashedKey = CryptoJS.SHA256(secretKey).toString(CryptoJS.enc.Base64);

                          // Generate the JWT token
                          const token = jwt.sign(payload, hashedKey);
                          return token;
                        }

                        // Example usage
                        const username = 'USER'; // Replace with the authenticated user's username
                        //const token = generateToken(username);
                        const api = new JitsiMeetExternalAPI('meet.jit.si', {
                                    roomName: 'Video-Meeting',
                                    parentNode: document.querySelector('#jitsi-container'),
                                    //jwt: token,
                                    configOverwrite: {
                                        startWithAudioMuted: true,
                                        startWithVideoMuted: true,
                                        enableWelcomePage: false,
                                        disableRemoteMute: true,
                                        disableRemoteControl: true,
                                        disableP2P: true
                                    }
                        });", true);

            // Retrieve the meeting URL from the Jitsi Meet API
            string meetingUrl = ClientScript.GetWebResourceUrl(GetType(), "JitsiMeetAPI") + "&roomName=Video-Meeting";


            HfMeetingLink.Value = "https://meet.jit.si" + meetingUrl;
            // Send Zoom Link to the Model
            ScriptManager.RegisterStartupScript(this, GetType(), "SendMeetingLink", "document.getElementById('" + BtnCreateLinkHidden.ClientID + "').click();", true);
        }
    }
}