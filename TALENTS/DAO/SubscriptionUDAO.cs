using System;
using System.Collections.Generic;
using System.Data.Linq;
using System.Linq;
using System.Web;

namespace TALENTS.DAO
{
    public class SubscriptionUDAO : BasicDAO
    {
        public SubscriptionUDAO() { }
        public List<SubscriptionU> FindAll()
        {
            Table<SubscriptionU> table = GetContext().SubscriptionUs;
            return table.ToList();
        }
        public bool Insert(SubscriptionU subscripU)
        {
            GetContext().SubscriptionUs.InsertOnSubmit(subscripU);
            GetContext().SubmitChanges();
            return true;
        }

        public bool Update(SubscriptionU subscripU)
        {
            GetContext().SubmitChanges();
            GetContext().Refresh(RefreshMode.OverwriteCurrentValues, subscripU);
            return true;
        }
        public bool Delete(int id)
        {
            SubscriptionU subscripU = GetContext().SubscriptionUs.SingleOrDefault(u => u.Id == id);
            GetContext().SubscriptionUs.DeleteOnSubmit(subscripU);
            GetContext().SubmitChanges();
            return true;
        }
    }
}