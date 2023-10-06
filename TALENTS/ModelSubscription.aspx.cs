using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.WebSockets;
using TALENTS.Common;
using TALENTS.Controller;
using TALENTS.DAO;
using TALENTS.Payment.Paypal;
using TALENTS.Util;

namespace TALENTS
{
    public partial class ModelSubscription : System.Web.UI.Page
    {
        public int WEEKID;
        public int MONTHID;
        public int QUARTERID;
        public double WEEKPRICE = 0;
        public double MONTHPRICE = 0;
        public double QUARTERPRICE = 0;
        public string WEEKTITLE = "WEEK";
        public string MONTHTITLE = "MONTH";
        public string QUARTERTITLE = "QUARTER";

        Model model;
        LoginController loginSystem = new LoginController();
        SubscriptionMController subscriptionMController = new SubscriptionMController();
        protected void Page_Load(object sender, EventArgs e)
        {
            model = loginSystem.GetCurrentUserAccount();
            if (model == null || !loginSystem.IsModelLoggedIn())
            {
                Response.Redirect("~/Login.aspx");
                return;
            }

            if (!IsPostBack)
            {
                LoadSubscriptions();
            }
        }

        private void LoadSubscriptions()
        {
            List<SubscriptionM> subscriptionMs = new SubscriptionMDAO().FindAll().OrderBy(s => s.Amount).ToList();
            if (subscriptionMs.Count < 3) { return; }
            WEEKID = subscriptionMs[0].Id;
            MONTHID = subscriptionMs[1].Id;
            QUARTERID = subscriptionMs[2].Id;
            WEEKPRICE = subscriptionMs[0].Amount ?? 0;
            MONTHPRICE = subscriptionMs[1].Amount ?? 0;
            QUARTERPRICE = subscriptionMs[2].Amount ?? 0;
            WEEKTITLE = subscriptionMs[0].Title;
            MONTHTITLE = subscriptionMs[1].Title;
            QUARTERTITLE = subscriptionMs[2].Title;

            // Allow Get a new Subscription
            string expireDate = subscriptionMController.SubscriptionExpireDate(model.Id);
            if (expireDate != null)
            {
                ExpireDate.InnerText = "Subscription expire date is " + expireDate + ". You can get another one after that.";
                HfGetAllow.Value = "true";
                ExpireDate.Visible = true;
            }
        }

        protected void btnPayment_Click(object sender, EventArgs e)
        {
            int subscriptionID = ParseUtil.TryParseInt(HfSubscriptionID.Value) ?? 0;
            if (subscriptionID == 0) {  return; }

            SubscriptionM subscription = new SubscriptionMDAO().FindAll().Where(s => s.Id == subscriptionID).FirstOrDefault();
            if (subscription == null) { return; }
            double total = subscription.Amount ?? 0;

            //Pay with paypal
            PaymentDetails pd = new PaymentDetails();
            pd.Set("ArticleNumber", "Article Number");

            Random zufall = new Random();
            DateTime dt = DateTime.Now;
            string invoiceNumber = dt.Year.ToString() + dt.Month.ToString() + dt.Day.ToString() + dt.Hour.ToString() + dt.Minute.ToString() + dt.Second.ToString() + Convert.ToString(zufall.Next(-100, 100)).PadLeft(2, '0');
            pd.Set("InvoiceNumber", invoiceNumber);
            pd.Set("ItemDescription", "Payment Detail Description");
            pd.Set("ItemName", "Name of Item");
            pd.Set("Quantity", "1");
            pd.Set("Total", total.ToString());
            pd.Set("Execute", "command to execute after payment");

            PaymentPrepare pp = new PaymentPrepare();
            pp.PaymentDetails = pd;
            pp.Description = "Payment description";
            string baseUrl = Request.Url.ToString().Substring(0, Request.Url.ToString().LastIndexOf("/"));
            pp.UrlCancel = baseUrl + "/PaymentCancel.aspx";
            pp.UrlReturn = baseUrl + "/PaymentComplete.aspx?subID=" + subscriptionID;

            var payment = pp.CreatePayment();
            string paymentId = payment.id;
            pd.Set(pd.PaymentId, paymentId);
            Session[paymentId] = pd;
            // Register JavaScript code to open PayPal payment URL in a new tab
            string script = "window.open('" + payment.GetApprovalUrl() + "', '_blank');";
            ScriptManager.RegisterStartupScript(this, GetType(), "OpenPayPalTab", script, true);
            //Response.Redirect(payment.GetApprovalUrl());
        }
    }
}