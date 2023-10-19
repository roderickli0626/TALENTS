using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TALENTS.Controller;

namespace TALENTS
{
    public partial class ModelNoticeBoard : System.Web.UI.Page
    {
        private Model model;
        private LoginController loginSystem = new LoginController();
        protected void Page_Load(object sender, EventArgs e)
        {
            model = loginSystem.GetCurrentUserAccount();
            if (model == null || !loginSystem.IsModelLoggedIn())
            {
                Response.Redirect("~/Login.aspx");
                return;
            }
            HfSignedModelID.Value = model.Id.ToString();

            bool result = new SubscriptionMController().AllowUserNoticeBoard(model.Id);
            if (!result) 
            {
                Response.Redirect("~/Login.aspx");
                return;
            }
        }
    }
}