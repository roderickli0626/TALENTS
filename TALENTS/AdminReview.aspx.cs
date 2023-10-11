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
    public partial class AdminReview : System.Web.UI.Page
    {
        private Model admin;
        private LoginController loginSystem = new LoginController();
        ReviewController reviewController = new ReviewController();
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
                LoadModels();
            }
        }

        private void LoadUsers()
        {
            List<Model> users = new List<Model>();
            users = new ModelDAO().FindAllUsers();
            ComboUser.Items.Clear();
            ControlUtil.DataBind(ComboUser, users, "Id", "Username", 0, "[unassigned]");
        }
        private void LoadModels()
        {
            List<Model> models = new List<Model>();
            models = new ModelDAO().FindAllModels();
            ComboModel.Items.Clear();
            ControlUtil.DataBind(ComboModel, models, "Id", "Username", 0, "[unassigned]");
        }

        protected void BtnSaveReview_Click(object sender, EventArgs e)
        {
            if (!IsValid) return;

            int userId = ControlUtil.GetSelectedValue(ComboUser) ?? 0;
            int modelId = ControlUtil.GetSelectedValue(ComboModel) ?? 0;
            if (userId == 0)
            {
                ServerValidator1.IsValid = false;
                return;
            }
            if (modelId == 0)
            {
                ServerValidator2.IsValid = false;
                return;
            }
            bool allowed = switch1.Checked;
            string phone = TxtPhone.Text;
            string comment = TxtComment.Text;
            int reviewRating = ParseUtil.TryParseInt(HfRating.Value) ?? 0;

            bool success = reviewController.SaveReview(phone, comment, reviewRating, modelId, userId, allowed);

            if (!success)
            {
                ServerValidator.IsValid = false;
                return;
            }

            Page.Response.Redirect(Page.Request.Url.ToString(), true);
        }

        protected void BtnUpdateReview_Click(object sender, EventArgs e)
        {
            if (!IsValid) { return; }

            int? reviewId = ParseUtil.TryParseInt(HfReviewID.Value);
            if (reviewId == null)
            {
                ServerValidator.IsValid = false;
                return;
            }

            int userId = ControlUtil.GetSelectedValue(ComboUser) ?? 0;
            bool allowed = switch1.Checked;
            string phone = TxtPhone.Text;
            string comment = TxtComment.Text;

            bool success = reviewController.UpdateReview(phone, comment, allowed, reviewId);

            if (!success)
            {
                ServerValidator.IsValid = false;
                return;
            }

            Page.Response.Redirect(Page.Request.Url.ToString(), true);
        }
    }
}