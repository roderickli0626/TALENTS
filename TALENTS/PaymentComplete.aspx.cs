using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TALENTS.Controller;
using TALENTS.DAO;
using TALENTS.Payment.Paypal;
using TALENTS.Util;

namespace TALENTS
{
    public partial class PaymentComplete : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Save Purchase Subscription Info to DB

            Model model = new LoginController().GetCurrentUserAccount();
            if (model == null)
            {
                Response.Redirect("~/ModelSubscription.aspx");
                return;
            }
            int subscriptionID = ParseUtil.TryParseInt(Request.Params["subID"]) ?? 0;
            SubscriptionMController subscriptionMController = new SubscriptionMController();
            bool result = subscriptionMController.SaveModSubscription(model.Id, subscriptionID);

            if (!result) return;

            // SendEmail();

            string paymentId = string.Empty;
            if (!String.IsNullOrEmpty(Request.QueryString["paymentId"]))
                paymentId = Request.QueryString["paymentId"];

            string token = "-";
            if (!String.IsNullOrEmpty(Request.QueryString["token"]))
                token = Request.QueryString["token"];

            string PayerId = "-";
            if (!String.IsNullOrEmpty(Request.QueryString["PayerID"]))
                PayerId = Request.QueryString["PayerID"];

            Label label = new Label();
            label.Text = "Pagamento Id: " + paymentId + "<br />";
            divPaymentDetails.Controls.Add(label);

            label = new Label();
            label.Text = "Cliente Id: " + PayerId + "<br />";
            divPaymentDetails.Controls.Add(label);

            label = new Label();
            label.Text = "Numero Fattura: " + GetPaymentDetails(paymentId, "InvoiceNumber") + "<br />";
            divPaymentDetails.Controls.Add(label);

            label = new Label();
            label.Text = "Item Name: " + GetPaymentDetails(paymentId, "ItemName") + "<br />";
            divPaymentDetails.Controls.Add(label);
        }

        string GetPaymentDetails(string paymentId, string key)
        {
            PaymentDetails pd = (PaymentDetails)Session[paymentId];

            string value = pd.GetString(key);
            if (String.IsNullOrEmpty(value))
                return string.Empty;
            else
                return value;
        }

        private void SendEmail()
        {
            //Send Email
            MailMessage Msg = new MailMessage();
            Msg.From = new MailAddress("Krandall2005@gmail.com", "TALENTS");// Sender details here, replace with valid value
            Msg.Subject = "Pagamento Paypal Confermato!"; // subject of email
            Msg.To.Add(Session["CurrentUserEmail"].ToString()); //Add Email id, to which we will send email
            Msg.Body = "Tu hai pagato";
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