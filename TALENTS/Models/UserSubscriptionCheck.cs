using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace TALENTS.Models
{
    public class UserSubscriptionCheck
    {
        private UserSubscription userSubscription;
        public UserSubscriptionCheck() { }
        public UserSubscriptionCheck(UserSubscription userSubscription)
        { 
            this.userSubscription = userSubscription;
            if (userSubscription == null) { return; }
            Id = userSubscription.Id;
            User = userSubscription.Model.Username;
            UserId = userSubscription.ModelId ?? 0;
            SubUId = userSubscription.SubscriptionId ?? 0;
            Type = userSubscription.SubscriptionU.Title;
            TotalAmount = userSubscription.SubscriptionU.Amount ?? 0;
            Amount = userSubscription.Amount ?? 0;
            Credits = userSubscription.Credits ?? 0;
            StartDate = userSubscription.StartDate?.ToString("dd/MM/yyyy");
            EndDate = userSubscription.EndDate?.ToString("dd/MM/yyyy");
        }

        public int Id
        {
            get; set;
        }

        public string User
        {
            get; set;
        }
        public int UserId
        {
            get; set;
        }
        public int SubUId
        {
            get; set;
        }
        public string Type
        {
            get; set;
        }
        public double TotalAmount
        {
            get; set;
        }
        public int Credits
        {
            get; set;
        }
        public double Amount
        {
            get; set;
        }
        public string StartDate
        {
            get; set;
        }
        public string EndDate
        {
            get; set;
        }
    }
}