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
    public partial class AdminNotice : System.Web.UI.Page
    {
        private Model admin;
        private LoginController loginSystem = new LoginController();
        NoticeController noticeController = new NoticeController();
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
            }
        }

        private void LoadUsers()
        {
            List<Model> users = new List<Model>();
            users = new ModelDAO().FindAllUsers();
            ComboUser.Items.Clear();
            ControlUtil.DataBind(ComboUser, users, "Id", "Username", 0, "[unassigned]");
        }

        protected void BtnSaveNotice_Click(object sender, EventArgs e)
        {
            if (!IsValid) return;

            int userId = ControlUtil.GetSelectedValue(ComboUser) ?? 0;
            if (userId == 0)
            {
                ServerValidator1.IsValid = false;
                return;
            }
            bool allowed = switch1.Checked;
            string title = TxtTitle.Text;
            string message = TxtMessage.Text;
            string contact = TxtContact.Text;
            string city = TxtCity.Text;
            DateTime? sdate = ParseUtil.TryParseDate(TxtStartDate.Text, "dd/MM/yyyy HH:mm");
            DateTime? edate = ParseUtil.TryParseDate(TxtEndDate.Text, "dd/MM/yyyy HH:mm");

            bool success = noticeController.SaveNotice(title, message, contact, city, sdate, edate, userId, null, allowed);

            if (!success)
            {
                ServerValidator.IsValid = false;
                return;
            }

            Page.Response.Redirect(Page.Request.Url.ToString(), true);
        }

        protected void BtnUpdateNotice_Click(object sender, EventArgs e)
        {
            if (!IsValid) { return; }

            int? noticeId = ParseUtil.TryParseInt(HfNoticeID.Value);
            if (noticeId == null)
            {
                ServerValidator.IsValid = false;
                return;
            }

            int userId = ControlUtil.GetSelectedValue(ComboUser) ?? 0;
            bool allowed = switch1.Checked;
            string title = TxtTitle.Text;
            string message = TxtMessage.Text;
            string contact = TxtContact.Text;
            string city = TxtCity.Text;
            DateTime? sdate = ParseUtil.TryParseDate(TxtStartDate.Text, "dd/MM/yyyy HH:mm");
            DateTime? edate = ParseUtil.TryParseDate(TxtEndDate.Text, "dd/MM/yyyy HH:mm");

            bool success = noticeController.SaveNotice(title, message, contact, city, sdate, edate, userId, noticeId, allowed);

            if (!success)
            {
                ServerValidator.IsValid = false;
                return;
            }

            Page.Response.Redirect(Page.Request.Url.ToString(), true);
        }
    }
}