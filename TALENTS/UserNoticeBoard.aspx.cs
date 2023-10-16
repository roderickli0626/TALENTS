using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TALENTS.Controller;
using TALENTS.Util;

namespace TALENTS
{
    public partial class UserNoticeBoard : System.Web.UI.Page
    {
        private Model user;
        private LoginController loginSystem = new LoginController();
        NoticeController noticeController = new NoticeController();
        protected void Page_Load(object sender, EventArgs e)
        {
            user = loginSystem.GetCurrentUserAccount();
            if (user == null || !loginSystem.IsUserLoggedIn())
            {
                Response.Redirect("~/Login.aspx");
                return;
            }
            string result = new SubscriptionUController().SubscriptionExpireDate(user.Id);
            if (result == null)
            {
                Response.Redirect("~/Login.aspx");
                return;
            }
        }

        protected void BtnSaveNotice_Click(object sender, EventArgs e)
        {
            if (!IsValid) return;

            string title = TxtTitle.Text;
            string message = TxtMessage.Text;
            string contact = TxtContact.Text;
            string city = TxtCity.Text;
            DateTime? sdate = ParseUtil.TryParseDate(TxtStartDate.Text, "dd/MM/yyyy HH:mm");
            DateTime? edate = ParseUtil.TryParseDate(TxtEndDate.Text, "dd/MM/yyyy HH:mm");

            bool success = noticeController.SaveNotice(title, message, contact, city, sdate, edate, user.Id, null, false);

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

            string title = TxtTitle.Text;
            string message = TxtMessage.Text;
            string contact = TxtContact.Text;
            string city = TxtCity.Text;
            DateTime? sdate = ParseUtil.TryParseDate(TxtStartDate.Text, "dd/MM/yyyy HH:mm");
            DateTime? edate = ParseUtil.TryParseDate(TxtEndDate.Text, "dd/MM/yyyy HH:mm");

            bool success = noticeController.SaveNotice(title, message, contact, city, sdate, edate, user.Id, noticeId,false);

            if (!success)
            {
                ServerValidator.IsValid = false;
                return;
            }

            Page.Response.Redirect(Page.Request.Url.ToString(), true);
        }
    }
}