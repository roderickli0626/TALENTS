using System;
using System.Collections.Generic;
using System.Data.Linq;
using System.Linq;
using System.Web;

namespace TALENTS.DAO
{
    public class UserSubscriptionDAO : BasicDAO
    {
        public UserSubscriptionDAO() { }
        public List<UserSubscription> FindAll()
        {
            Table<UserSubscription> table = GetContext().UserSubscriptions;
            return table.ToList();
        }
        public List<UserSubscription> FindByUser(int modelId)
        {
            IEnumerable<UserSubscription> table = GetContext().UserSubscriptions.Where(m => m.ModelId == modelId);
            return table.ToList();
        }
        public bool Insert(UserSubscription userSubscrip)
        {
            GetContext().UserSubscriptions.InsertOnSubmit(userSubscrip);
            GetContext().SubmitChanges();
            return true;
        }

        public bool Update(UserSubscription userSubscrip)
        {
            GetContext().SubmitChanges();
            GetContext().Refresh(RefreshMode.OverwriteCurrentValues, userSubscrip);
            return true;
        }
        public bool Delete(int id)
        {
            UserSubscription userSubscrip = GetContext().UserSubscriptions.SingleOrDefault(u => u.Id == id);
            GetContext().UserSubscriptions.DeleteOnSubmit(userSubscrip);
            GetContext().SubmitChanges();
            return true;
        }
    }
}