using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TALENTS.Common;
using TALENTS.Controller;

namespace TALENTS
{
    public partial class Login : System.Web.UI.Page
    {
        LoginController loginSystem = new LoginController();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                SessionController sessionController = new SessionController();
                sessionController.LogoutUser();
            }
        }

        protected void LogInBtn_Click(object sender, EventArgs e)
        {
            string email = TxtEmail.Text;
            string password = TxtPassword.Text;
            EncryptedPass pass = new EncryptedPass() { Encrypted = new CryptoController().EncryptStringAES(password), UnEncrypted = password };

            LoginUser(email, pass);
        }

        private void LoginUser(string email, EncryptedPass pass)
        {
            if (!IsValid) { return; }

            LoginCode loginStatus = loginSystem.LoginAndSaveSession(email, pass);

            if (loginStatus == LoginCode.Success)
            {
                if (loginSystem.IsSuperAdminLoggedIn())
                {
                    Response.Redirect("~/AdminHome.aspx");
                }
                else if (loginSystem.IsAdminLoggedIn())
                {
                    Response.Redirect("~/AdminHome.aspx");
                }
                else if (loginSystem.IsModelLoggedIn())
                {
                    Response.Redirect("~/ModelHome.aspx");
                }
                else if (loginSystem.IsUserLoggedIn())
                {
                    Response.Redirect("~/UserHome.aspx");
                }
            }
            else
            {
                ServerValidator.IsValid = false;
                return;
            }
        }
    }
}