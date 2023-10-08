using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TALENTS.Common;
using TALENTS.Controller;
using TALENTS.DAO;
using TALENTS.Payment.Paypal;
using TALENTS.Util;

namespace TALENTS
{
    public partial class UserSubscription1 : System.Web.UI.Page
    {
        public int DAYID;
        public int WEEKID;
        public int MONTHID;
        public int DAYCREDIT;
        public int WEEKCREDIT;
        public int MONTHCREDIT;
        public double DAYPRICE = 0;
        public double WEEKPRICE = 0;
        public double MONTHPRICE = 0;
        public string DAYTITLE = "DAY";
        public string WEEKTITLE = "WEEK";
        public string MONTHTITLE = "MONTH";

        public int CurrentCredits;

        Model user;
        UserCredit userCredit;
        LoginController loginSystem = new LoginController();
        SubscriptionUController subscriptionUController = new SubscriptionUController();
        protected void Page_Load(object sender, EventArgs e)
        {
            user = loginSystem.GetCurrentUserAccount();
            if (user == null || !loginSystem.IsUserLoggedIn())
            {
                Response.Redirect("~/Login.aspx");
                return;
            }

            userCredit = new UserCreditDAO().FindByUser(user.Id);
            if (userCredit != null)
            {
                CurrentCredits = userCredit.Credits ?? 0;
            }

            if (!IsPostBack)
            {
                LoadSubscriptions();
            }
        }

        private void LoadSubscriptions()
        {
            List<SubscriptionU> subscriptionUs = new SubscriptionUDAO().FindAll().OrderBy(s => s.Amount).ToList();
            if (subscriptionUs.Count < 3) { return; }
            DAYID = subscriptionUs[0].Id;
            WEEKID = subscriptionUs[1].Id;
            MONTHID = subscriptionUs[2].Id;
            DAYCREDIT = subscriptionUs[0].Credits ?? 0;
            WEEKCREDIT = subscriptionUs[1].Credits ?? 0;
            MONTHCREDIT = subscriptionUs[2].Credits ?? 0;
            DAYPRICE = subscriptionUs[0].Amount ?? 0;
            WEEKPRICE = subscriptionUs[1].Amount ?? 0;
            MONTHPRICE = subscriptionUs[2].Amount ?? 0;
            DAYTITLE = subscriptionUs[0].Title;
            WEEKTITLE = subscriptionUs[1].Title;
            MONTHTITLE = subscriptionUs[2].Title;

            // Allow Get a new Subscription
            string expireDate = subscriptionUController.SubscriptionExpireDate(user.Id);
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
            if (subscriptionID == 0) { return; }

            SubscriptionU subscription = new SubscriptionUDAO().FindAll().Where(s => s.Id == subscriptionID).FirstOrDefault();
            if (subscription == null) { return; }
            
            // Calcuate Total Amount
            double total = 0;
            if (subscription.Credits <= CurrentCredits)
            {
                // Purchase with Credit, no Paypal
                SubscriptionUController subscriptionUController = new SubscriptionUController();
                bool result = subscriptionUController.SaveUserSubscription(user.Id, subscriptionID, true);
                if (userCredit != null)
                {
                    userCredit.Credits -= subscription.Credits;
                    bool result1 = new UserCreditDAO().Update(userCredit);
                }
                LoadSubscriptions();
                return;
            }
            else
            {
                if (subscription.Type == (int)UserSubscriptionType.Day)
                {
                    ExpireDate.InnerText = "You have no enough credits to get DAY subscription. Please try another one.";
                    ExpireDate.Visible = true;
                    return;
                }
                else total = (subscription.Amount / subscription.Credits) * (subscription.Credits - CurrentCredits) ?? 0;
            }

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
            pp.UrlCancel = baseUrl + "/PaymentCancelU.aspx";
            pp.UrlReturn = baseUrl + "/PaymentCompleteU.aspx?subID=" + subscriptionID;

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