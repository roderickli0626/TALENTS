 using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using TALENTS.Common;
using TALENTS.DAO;
using TALENTS.Models;

namespace TALENTS.Controller
{
    public class SubscriptionUController
    {
        public SubscriptionUDAO subscriptionUDAO;
        public UserSubscriptionDAO userSubscriptionDAO;
        public SubscriptionUController() 
        { 
            subscriptionUDAO = new SubscriptionUDAO();
            userSubscriptionDAO = new UserSubscriptionDAO();
        }

        public string SubscriptionExpireDate(int userId)
        {
            List<UserSubscription> subs = userSubscriptionDAO.FindByUser(userId);
            DateTime dateTime = DateTime.Now;
            string result = null;

            foreach (UserSubscription sub in subs)
            {
                if (sub.StartDate < dateTime && sub.EndDate > dateTime)
                {
                    result = sub.EndDate?.ToString("dd/MM/yyyy");
                }
            }
            return result;
        }

        public bool SaveUserSubscription(int userID, int subscriptionID, bool withCredit)
        {
            SubscriptionU subscription = new SubscriptionUDAO().FindAll().Where(s => s.Id == subscriptionID).FirstOrDefault();
            if (subscription == null)
            {
                return false;
            }
            UserSubscription userSubscription = new UserSubscription();
            userSubscription.ModelId = userID;
            if (withCredit)
            {
                userSubscription.Amount = 0;
                userSubscription.Credits = subscription.Credits;
            }
            else
            {
                UserCredit userCredit = new UserCreditDAO().FindByUser(userID);
                userSubscription.Amount = (subscription.Amount / subscription.Credits) * (subscription.Credits - (userCredit?.Credits ?? 0)) ?? 0;
                userSubscription.Credits = (userCredit?.Credits ?? 0);
            }
            userSubscription.SubscriptionId = subscriptionID;
            userSubscription.StartDate = DateTime.Now;

            DateTime endDate = DateTime.Now;
            if (subscription.Type == (int)UserSubscriptionType.Day) endDate = endDate.AddDays(1);
            else if (subscription.Type == (int)UserSubscriptionType.Week) endDate = endDate.AddDays(7);
            else if (subscription.Type == (int)UserSubscriptionType.Month) endDate = endDate.AddMonths(1);

            userSubscription.EndDate = endDate;

            return userSubscriptionDAO.Insert(userSubscription);
        }

        public bool UpdateUserSubscription(int userId, int subscriptionID, bool withCredit, int userSubId)
        {
            SubscriptionU subscription = new SubscriptionUDAO().FindAll().Where(s => s.Id == subscriptionID).FirstOrDefault();
            if (subscription == null)
            {
                return false;
            }
            UserSubscription userSubscription = userSubscriptionDAO.FindAll().Where(u => u.Id == userSubId).FirstOrDefault();
            if (userSubscription == null) { return false; }

            userSubscription.SubscriptionId = subscriptionID;
            if (withCredit)
            {
                userSubscription.Amount = 0;
                userSubscription.Credits = subscription.Credits;
            }
            else
            {
                UserCredit userCredit = new UserCreditDAO().FindByUser(userId);
                userSubscription.Amount = (subscription.Amount / subscription.Credits) * (subscription.Credits - (userCredit?.Credits ?? 0)) ?? 0;
                userSubscription.Credits = (userCredit?.Credits ?? 0);
            }
            userSubscription.StartDate = DateTime.Now;

            DateTime endDate = DateTime.Now;
            if (subscription.Type == (int)UserSubscriptionType.Day) endDate = endDate.AddDays(1);
            else if (subscription.Type == (int)UserSubscriptionType.Week) endDate = endDate.AddDays(7);
            else if (subscription.Type == (int)UserSubscriptionType.Month) endDate = endDate.AddMonths(1);

            userSubscription.EndDate = endDate;

            return userSubscriptionDAO.Update(userSubscription);
        }

        public SearchResult SearchAdminUserSubscriptions(int start, int length, string search)
        {
            SearchResult result = new SearchResult();
            IEnumerable<UserSubscription> list = userSubscriptionDAO.FindAll().Where(n => n.Model.Username.Contains(search));
            result.TotalCount = list.Count();
            list = list.Skip(start).Take(length);

            List<object> checks = new List<object>();
            foreach (UserSubscription md in list)
            {
                UserSubscriptionCheck subMCheck = new UserSubscriptionCheck(md);
                checks.Add(subMCheck);
            }
            result.ResultList = checks;

            return result;
        }
    }
}