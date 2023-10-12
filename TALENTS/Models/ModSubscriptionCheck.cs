using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace TALENTS.Models
{
    public class ModSubscriptionCheck
    {
        private ModSubscription modSubscription;
        public ModSubscriptionCheck() { }
        public ModSubscriptionCheck(ModSubscription modSubscription) 
        { 
            this.modSubscription = modSubscription;
            if (modSubscription == null ) { return; }
            Id = modSubscription.Id;
            Model = modSubscription.Model.Username;
            ModelId = modSubscription.ModelId ?? 0;
            SubMId = modSubscription.SubscriptionMId ?? 0;
            Type = modSubscription.SubscriptionM.Title;
            Amount = modSubscription.SubscriptionM.Amount ?? 0;
            StartDate = modSubscription.StartDate?.ToString("dd/MM/yyyy");
            EndDate = modSubscription.EndDate?.ToString("dd/MM/yyyy");
        }

        public int Id
        {
            get; set;
        }

        public string Model
        {
            get; set;
        }
        public int ModelId
        {
            get; set;
        }
        public int SubMId
        {
            get; set;
        }
        public string Type
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