using System;
using System.Collections.Generic;
using System.Data.Linq;
using System.Linq;
using System.Web;

namespace TALENTS.DAO
{
    public class ModContactDAO : BasicDAO
    {
        public ModContactDAO() { }

        public List<ModContact> FindByModel(int modelId)
        {
            IEnumerable<ModContact> table = GetContext().ModContacts.Where(m => m.ModelId == modelId);
            return table.ToList();
        }
        public bool Insert(ModContact modCont)
        {
            GetContext().ModContacts.InsertOnSubmit(modCont);
            GetContext().SubmitChanges();
            return true;
        }

        public bool Update(ModContact modCont)
        {
            GetContext().SubmitChanges();
            GetContext().Refresh(RefreshMode.OverwriteCurrentValues, modCont);
            return true;
        }
        public bool Delete(int id)
        {
            ModContact modCont = GetContext().ModContacts.SingleOrDefault(u => u.Id == id);
            GetContext().ModContacts.DeleteOnSubmit(modCont);
            GetContext().SubmitChanges();
            return true;
        }
    }
}