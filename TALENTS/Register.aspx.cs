using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Mail;
using System.Reflection;
using System.Security.Policy;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TALENTS.Controller;

namespace TALENTS
{
    public partial class Register : System.Web.UI.Page
    {
        LoginController loginSystem = new LoginController();
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void BtnRegister_Click(object sender, EventArgs e)
        {
            string name = TxtUsername.Text;
            string password = TxtPassword.Text;
            string email = TxtEmail.Text;
            string repeatPW = TxtPasswordRepeat.Text;
            bool IsModel = false;
            bool IsUser = false;
            if (RadioModel.Checked) IsModel = true;
            if (RadioUser.Checked) IsUser = true;
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

            RegisterUser(name, email, pass, IsModel,IsUser);
        }

        public void RegisterUser(string name, string email, EncryptedPass pass, bool IsModel, bool IsUser)
        {
            if (!IsValid) { return; }

            bool success = loginSystem.RegisterModel(name, email, pass, IsModel, IsUser);
            if (success)
            {
                //Send Email to Admin
                //SendEmail(email);
                Response.Redirect("~/Login.aspx");
            }
            else
            {
                ServerValidator.IsValid = false;
                return;
            }
        }

        private void SendEmail(string email)
        {
            //Send Email
            MailMessage Msg = new MailMessage();
            Msg.From = new MailAddress("Krandall2005@gmail.com", "TALENTS");// Sender details here, replace with valid value
            Msg.Subject = "Un nuovo CLIENTE si è registrato"; // subject of email
            Msg.To.Add("krandall2005@gmail.com"); //Add Email id, to which we will send email
            Msg.Body = email + " è stato aggiunto al gestionale.";
            Msg.IsBodyHtml = true;
            Msg.Priority = MailPriority.High;
            SmtpClient smtp = new SmtpClient();
            smtp.UseDefaultCredentials = false; // to get rid of error "SMTP server requires a secure connection"
            smtp.Host = "smtp.gmail.com";
            smtp.Port = 587;

            smtp.Credentials = new System.Net.NetworkCredential("krandall2005@gmail.com", "fyjlmiowttdaovfi");// replace with valid value
            smtp.EnableSsl = true;

            smtp.Send(Msg);
        }
    }
}