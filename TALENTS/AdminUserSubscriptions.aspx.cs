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
    public partial class AdminUserSubscriptions : System.Web.UI.Page
    {
        private Model admin;
        private LoginController loginSystem = new LoginController();
        SubscriptionUController subscriptionUController = new SubscriptionUController();
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
                LoadUsers();
                LoadSubscriptionTypes();
            }
        }
        private void LoadSubscriptionTypes()
        {
            List<SubscriptionU> subUs = new List<SubscriptionU>();
            subUs = new SubscriptionUDAO().FindAll();
            ComboType.Items.Clear();
            ControlUtil.DataBind(ComboType, subUs, "Id", "Title", 0, "[Select Subscription]");
        }
        private void LoadUsers()
        {
            List<Model> users = new List<Model>();
            users = new ModelDAO().FindAllUsers();
            ComboUser.Items.Clear();
            ControlUtil.DataBind(ComboUser, users, "Id", "Username", 0, "[Select User]");
        }

        protected void BtnSaveSubscription_Click(object sender, EventArgs e)
        {
            if (!IsValid) return;

            bool success = true;
            int userId = ControlUtil.GetSelectedValue(ComboUser) ?? 0;
            int subUId = ControlUtil.GetSelectedValue(ComboType) ?? 0;
            if (userId == 0)
            {
                ServerValidator1.IsValid = false;
                return;
            }
            if (subUId == 0)
            {
                ServerValidator2.IsValid = false;
                return;
            }

            int currentCredits = 0;
            UserCredit usercredit = new UserCreditDAO().FindByUser(userId);
            if (usercredit != null) currentCredits = usercredit.Credits ?? 0;
            SubscriptionU subscription = new SubscriptionUDAO().FindAll().Where(s => s.Id == subUId).FirstOrDefault();
            if (currentCredits < subscription.Credits)
            {
                success = subscriptionUController.SaveUserSubscription(userId, subUId, false);
                if (usercredit != null)
                {
                    usercredit.Credits = 0;
                    bool result1 = new UserCreditDAO().Update(usercredit);
                }
            }
            else
            {
                success = subscriptionUController.SaveUserSubscription(userId, subUId, true);
                if (usercredit != null)
                {
                    usercredit.Credits -= subscription.Credits;
                    bool result1 = new UserCreditDAO().Update(usercredit);
                }
            }

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

            bool success = true;
            int userId = ControlUtil.GetSelectedValue(ComboUser) ?? 0;
            int userSubId = ParseUtil.TryParseInt(HfSubID.Value) ?? 0;
            if (userSubId == 0)
            {
                ServerValidator.IsValid = false;
                return;
            }

            int subUId = ControlUtil.GetSelectedValue(ComboType) ?? 0;
            if (subUId == 0)
            {
                ServerValidator2.IsValid = false;
                return;
            }

            int currentCredits = 0;
            UserCredit usercredit = new UserCreditDAO().FindByUser(userId);
            if (usercredit != null) currentCredits = usercredit.Credits ?? 0;
            SubscriptionU subscription = new SubscriptionUDAO().FindAll().Where(s => s.Id == subUId).FirstOrDefault();
            if (currentCredits < subscription.Credits)
            {
                success = subscriptionUController.UpdateUserSubscription(userId, subUId, false, userSubId);
                if (usercredit != null)
                {
                    usercredit.Credits = 0;
                    bool result1 = new UserCreditDAO().Update(usercredit);
                }
            }
            else
            {
                success = subscriptionUController.UpdateUserSubscription(userId, subUId, true, userSubId);
                if (usercredit != null)
                {
                    usercredit.Credits -= subscription.Credits;
                    bool result1 = new UserCreditDAO().Update(usercredit);
                }
            }
            

            if (!success)
            {
                ServerValidator.IsValid = false;
                return;
            }

            Page.Response.Redirect(Page.Request.Url.ToString(), true);
        }
    }
}