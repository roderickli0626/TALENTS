using System;
using System.Collections.Generic;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.WebSockets;
using TALENTS.Controller;
using TALENTS.Util;

namespace TALENTS
{
    public partial class AdminAdmin : System.Web.UI.Page
    {
        LoginController loginSystem = new LoginController();

        protected void Page_Load(object sender, EventArgs e)
        {
            Model model = loginSystem.GetCurrentUserAccount();
            if (!loginSystem.IsSuperAdminLoggedIn())
            {
                Response.Redirect("~/Login.aspx");
                return;
            }
        }

        protected void BtnSaveAdmin_Click(object sender, EventArgs e)
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

            SaveAdmin(name, email, pass);
        }

        public void SaveAdmin(string name, string email, EncryptedPass pass)
        {
            if (!IsValid) { return; }

            bool success = new ModelController().SaveAdmin(name, email, pass);
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

        protected void BtnUpdateAdmin_Click(object sender, EventArgs e)
        {
            if (!IsValid) { return; }

            int? adminId = ParseUtil.TryParseInt(HfAdminID.Value);
            if (adminId == null)
            {
                ServerValidator.IsValid = false;
                return;
            }

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

            bool success = new ModelController().UpdateAdmin(adminId, name, email, pass);
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