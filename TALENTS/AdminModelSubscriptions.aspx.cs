using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TALENTS.Controller;
using TALENTS.DAO;
using TALENTS.Util;

namespace TALENTS
{
    public partial class AdminModelSubscriptions : System.Web.UI.Page
    {
        private Model admin;
        private LoginController loginSystem = new LoginController();
        SubscriptionMController subscriptionMController = new SubscriptionMController();
        protected void Page_Load(object sender, EventArgs e)
        {
            admin = loginSystem.GetCurrentUserAccount();
            if (!loginSystem.IsSuperAdminLoggedIn() && (admin == null || !loginSystem.IsAdminLoggedIn()))
            {
                Response.Redirect("~/Login.aspx");
                return;
            }

            if (!IsPostBack)
            {
                LoadModels();
                LoadSubscriptionTypes();
            }
        }
        private void LoadSubscriptionTypes()
        {
            List<SubscriptionM> subMs = new List<SubscriptionM>();
            subMs = new SubscriptionMDAO().FindAll();
            ComboType.Items.Clear();
            ControlUtil.DataBind(ComboType, subMs, "Id", "Title", 0, "[Select Subscription]");
        }
        private void LoadModels()
        {
            List<Model> users = new List<Model>();
            users = new ModelDAO().FindAllModels();
            ComboUser.Items.Clear();
            ControlUtil.DataBind(ComboUser, users, "Id", "Username", 0, "[Select Model]");
        }

        protected void BtnSaveSubscription_Click(object sender, EventArgs e)
        {
            if (!IsValid) return;

            int modelId = ControlUtil.GetSelectedValue(ComboUser) ?? 0;
            int subMId = ControlUtil.GetSelectedValue(ComboType) ?? 0;
            if (modelId == 0)
            {
                ServerValidator1.IsValid = false;
                return;
            }
            if (subMId == 0)
            {
                ServerValidator2.IsValid = false;
                return;
            }

            bool success = subscriptionMController.SaveModSubscription(modelId, subMId);

            if (!success)
            {
                ServerValidator.IsValid = false;
                return;
            }

            Page.Response.Redirect(Page.Request.Url.ToString(), true);
        }

        protected void BtnUpdateSubscription_Click(object sender, EventArgs e)
        {
            if (!IsValid) { return; }

            int modelSubId = ParseUtil.TryParseInt(HfSubID.Value) ?? 0;
            if (modelSubId == 0)
            {
                ServerValidator.IsValid = false;
                return;
            }

            int subMId = ControlUtil.GetSelectedValue(ComboType) ?? 0;
            if (subMId == 0)
            {
                ServerValidator2.IsValid = false;
                return;
            }

            bool success = subscriptionMController.UpdateModSubscription(subMId, modelSubId);

            if (!success)
            {
                ServerValidator.IsValid = false;
                return;
            }

            Page.Response.Redirect(Page.Request.Url.ToString(), true);
        }
    }
}