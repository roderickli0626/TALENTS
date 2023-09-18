using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TALENTS.Controller;

namespace TALENTS
{
    public partial class ModelPage : System.Web.UI.MasterPage
    {
        private Model model;
        private LoginController loginSystem = new LoginController();
        protected void Page_Init(object sender, EventArgs e)
        {
            model = loginSystem.GetCurrentUserAccount();
            if (model == null || !loginSystem.IsModelLoggedIn())
            {
                Response.Redirect("~/Login.aspx");
                return;
            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            string path = HttpContext.Current.Request.Url.AbsolutePath;

            username.InnerText = model.Username;
        }
    }
}