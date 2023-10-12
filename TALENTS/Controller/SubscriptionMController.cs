using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using System.Web;
using TALENTS.Common;
using TALENTS.DAO;
using TALENTS.Models;

namespace TALENTS.Controller
{
    public class SubscriptionMController
    {
        SubscriptionMDAO subscriptionMDAO;
        ModSubscriptionDAO modSubscriptionDAO;
        public SubscriptionMController() 
        { 
            subscriptionMDAO = new SubscriptionMDAO();
            modSubscriptionDAO = new ModSubscriptionDAO();
        }
        public bool AllowUserNoticeBoard(int modelId)
        {
            List<ModSubscription> subs = modSubscriptionDAO.FindByModel(modelId);
            DateTime dateTime = DateTime.Now;
            bool result = false;

            foreach (ModSubscription sub in subs)
            {
                if (sub.StartDate < dateTime && sub.EndDate > dateTime)
                {
                    if (sub.SubscriptionM.Type != (int)ModSubscriptionType.Week)
                        result = true;
                }
            }
            return result;
        }
        public string SubscriptionExpireDate(int modelId)
        {
            List<ModSubscription> subs = modSubscriptionDAO.FindByModel(modelId);
            DateTime dateTime = DateTime.Now;
            string result = null;

            foreach (ModSubscription sub in subs)
            {
                if (sub.StartDate < dateTime && sub.EndDate > dateTime)
                {
                    result = sub.EndDate?.ToString("dd/MM/yyyy");
                }
            }
            return result;
        }

        public bool SaveModSubscription(int modelID, int subscriptionID)
        {
            SubscriptionM subscription = new SubscriptionMDAO().FindAll().Where(s => s.Id == subscriptionID).FirstOrDefault();
            if (subscription == null)
            {
                return false;
            }
            ModSubscription modSubscription = new ModSubscription();
            modSubscription.ModelId = modelID;
            modSubscription.SubscriptionMId = subscriptionID;
            modSubscription.StartDate = DateTime.Now;

            DateTime endDate = DateTime.Now;
            if (subscription.Type == (int)ModSubscriptionType.Week) endDate = endDate.AddDays(7);
            else if (subscription.Type == (int)ModSubscriptionType.Month) endDate = endDate.AddMonths(1);
            else if (subscription.Type == (int)ModSubscriptionType.Quarter) endDate = endDate.AddMonths(3);

            modSubscription.EndDate = endDate;

            return modSubscriptionDAO.Insert(modSubscription);
        }

        public bool UpdateModSubscription(int subscriptionID, int modelSubId)
        {
            SubscriptionM subscription = new SubscriptionMDAO().FindAll().Where(s => s.Id == subscriptionID).FirstOrDefault();
            if (subscription == null)
            {
                return false;
            }
            ModSubscription modSubscription = modSubscriptionDAO.FindAll().Where(s => s.Id == modelSubId).FirstOrDefault();
            if (modSubscription == null ) { return false; }
            modSubscription.SubscriptionMId = subscriptionID;
            modSubscription.StartDate = DateTime.Now;

            DateTime endDate = DateTime.Now;
            if (subscription.Type == (int)ModSubscriptionType.Week) endDate = endDate.AddDays(7);
            else if (subscription.Type == (int)ModSubscriptionType.Month) endDate = endDate.AddMonths(1);
            else if (subscription.Type == (int)ModSubscriptionType.Quarter) endDate = endDate.AddMonths(3);

            modSubscription.EndDate = endDate;

            return modSubscriptionDAO.Update(modSubscription);
        }

        public SearchResult SearchAdminModelSubscriptions(int start, int length, string search)
        {
            SearchResult result = new SearchResult();
            IEnumerable<ModSubscription> list = modSubscriptionDAO.FindAll().Where(n => n.Model.Username.Contains(search));
            result.TotalCount = list.Count();
            list = list.Skip(start).Take(length);

            List<object> checks = new List<object>();
            foreach (ModSubscription md in list)
            {
                ModSubscriptionCheck subMCheck = new ModSubscriptionCheck(md);
                checks.Add(subMCheck);
            }
            result.ResultList = checks;

            return result;
        }

    }
}