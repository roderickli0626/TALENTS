using System;
using System.Collections.Generic;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TALENTS.Controller;

namespace TALENTS
{
    public partial class AdminUser : System.Web.UI.Page
    {
        LoginController loginSystem = new LoginController();
        protected void Page_Load(object sender, EventArgs e)
        {
            Model model = loginSystem.GetCurrentUserAccount();
            if (!loginSystem.IsSuperAdminLoggedIn() && (model == null || !loginSystem.IsAdminLoggedIn()))
            {
                Response.Redirect("~/Login.aspx");
                return;
            }
        }

        protected void BtnSaveUser_Click(object sender, EventArgs e)
        {
            string name = TxtUsername.Text;
            string password = TxtPassword.Text;
            string email = TxtEmail.Text;
            string repeatPW = TxtPasswordRepeat.Text;

            EncryptedPass pass = new EncryptedPass() { Encrypted = new CryptoController().EncryptStringAES(password), UnEncrypted = password };

            if (password != repeatPW)
            {
                PasswordValidator.IsValid = false;
                return;
            }
            string emailPattern = @"^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$";
            if (!Regex.IsMatch(email, emailPattern))
            {
                EmailValidator.IsValid = false;
                return;
            }

            SaveUser(name, email, pass, false, true);
        }

        public void SaveUser(string name, string email, EncryptedPass pass, bool IsModel, bool IsUser)
        {
            if (!IsValid) { return; }

            bool success = loginSystem.RegisterModel(name, email, pass, IsModel, IsUser);
            if (success)
            {
                Page.Response.Redirect(Page.Request.Url.ToString(), true);
            }
            else
            {
                ServerValidator.IsValid = false;
                return;
            }
        }
    }
}