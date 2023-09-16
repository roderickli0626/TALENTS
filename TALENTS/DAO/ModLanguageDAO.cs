using System;
using System.Collections.Generic;
using System.Data.Linq;
using System.Linq;
using System.Web;

namespace TALENTS.DAO
{
    public class ModLanguageDAO : BasicDAO
    {
        public ModLanguageDAO() { }
        public List<ModLanguageAlloc> FindByModel(int modelId)
        {
            IEnumerable<ModLanguageAlloc> table = GetContext().ModLanguageAllocs.Where(m => m.ModelId == modelId);
            return table.ToList();
        }
        public bool Insert(ModLanguageAlloc modlang)
        {
            GetContext().ModLanguageAllocs.InsertOnSubmit(modlang);
            GetContext().SubmitChanges();
            return true;
        }

        public bool Update(ModLanguageAlloc modlang)
        {
            GetContext().SubmitChanges();
            GetContext().Refresh(RefreshMode.OverwriteCurrentValues, modlang);
            return true;
        }
        public bool Delete(int id)
        {
            ModLanguageAlloc modlang = GetContext().ModLanguageAllocs.SingleOrDefault(u => u.Id == id);
            GetContext().ModLanguageAllocs.DeleteOnSubmit(modlang);
            GetContext().SubmitChanges();
            return true;
        }
    }
}