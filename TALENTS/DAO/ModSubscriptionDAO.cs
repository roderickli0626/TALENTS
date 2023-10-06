using System;
using System.Collections.Generic;
using System.Data.Linq;
using System.Linq;
using System.Web;

namespace TALENTS.DAO
{
    public class ModSubscriptionDAO : BasicDAO
    {
        public ModSubscriptionDAO() { }
        public List<ModSubscription> FindAll()
        {
            Table<ModSubscription> table = GetContext().ModSubscriptions;
            return table.ToList();
        }
        public List<ModSubscription> FindByModel(int modelId)
        {
            IEnumerable<ModSubscription> table = GetContext().ModSubscriptions.Where(m => m.ModelId == modelId);
            return table.ToList();
        }
        public bool Insert(ModSubscription modSubscription)
        {
            GetContext().ModSubscriptions.InsertOnSubmit(modSubscription);
            GetContext().SubmitChanges();
            return true;
        }

        public bool Update(ModSubscription modSubscription)
        {
            GetContext().SubmitChanges();
            GetContext().Refresh(RefreshMode.OverwriteCurrentValues, modSubscription);
            return true;
        }
        public bool Delete(int id)
        {
            ModSubscription modSubscription = GetContext().ModSubscriptions.SingleOrDefault(u => u.Id == id);
            GetContext().ModSubscriptions.DeleteOnSubmit(modSubscription);
            GetContext().SubmitChanges();
            return true;
        }
    }
}