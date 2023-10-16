using PayPal.Api;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TALENTS.Controller;
using TALENTS.DAO;

namespace TALENTS
{
    public partial class ResetPassword : System.Web.UI.Page
    {
        private string email;
        private string token;
        private ModelDAO modelDAO = new ModelDAO();
        protected void Page_Load(object sender, EventArgs e)
        {
            email = Request.Params["email"];
            token = Request.Params["token"];
            if (email == null || token == null)
            {
                Response.Redirect("~/Login.aspx");
            }
            Model model = modelDAO.FindByEmail(email);
            if (model == null) Response.Redirect("~/Login.aspx");
            string modelToken = model.ResetToken;
            DateTime? tokenExpire = model.ResetTokenExpiry;
            DateTime currentDateTime = DateTime.Now;
            if (tokenExpire < currentDateTime || modelToken != token) Response.Redirect("~/Login.aspx");
        }

        protected void ResetPassword_Click(object sender, EventArgs e)
        {
            if (!IsValid) return;
            string password = TxtPassword.Text.Trim();
            string repeatPW = TxtRepeatPW.Text.Trim();

            if (password != repeatPW)
            {
                ServerValidator.IsValid = false; return;
            }

            Model model = modelDAO.FindByEmail(email);
            if (model == null) { return; }
            if (!string.IsNullOrEmpty(password)) model.Password = new CryptoController().EncryptStringAES(password);
            modelDAO.Update(model);
            Response.Redirect("~/Login.aspx");
        }
    }
}