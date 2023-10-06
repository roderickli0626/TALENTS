using System;
using System.Collections.Generic;
using System.Data.Linq;
using System.Linq;
using System.Web;

namespace TALENTS.DAO
{
    public class SubscriptionMDAO : BasicDAO
    {
        public SubscriptionMDAO() { }

        public List<SubscriptionM> FindAll()
        {
            Table<SubscriptionM> table = GetContext().SubscriptionMs;
            return table.ToList();
        }
        public bool Insert(SubscriptionM subscripM)
        {
            GetContext().SubscriptionMs.InsertOnSubmit(subscripM);
            GetContext().SubmitChanges();
            return true;
        }

        public bool Update(SubscriptionM subscripM)
        {
            GetContext().SubmitChanges();
            GetContext().Refresh(RefreshMode.OverwriteCurrentValues, subscripM);
            return true;
        }
        public bool Delete(int id)
        {
            SubscriptionM subscripM = GetContext().SubscriptionMs.SingleOrDefault(u => u.Id == id);
            GetContext().SubscriptionMs.DeleteOnSubmit(subscripM);
            GetContext().SubmitChanges();
            return true;
        }
    }
}