using System;
using System.Collections.Generic;
using System.Data.Linq;
using System.Linq;
using System.Web;

namespace TALENTS.DAO
{
    public class ModServiceDAO : BasicDAO
    {
        public ModServiceDAO() { }
        public List<ModService> FindByModel(int modelId)
        {
            IEnumerable<ModService> table = GetContext().ModServices.Where(m => m.ModelId == modelId);
            return table.ToList();
        }
        public bool Insert(ModService modService)
        {
            GetContext().ModServices.InsertOnSubmit(modService);
            GetContext().SubmitChanges();
            return true;
        }

        public bool Update(ModService modService)
        {
            GetContext().SubmitChanges();
            GetContext().Refresh(RefreshMode.OverwriteCurrentValues, modService);
            return true;
        }
        public bool Delete(int id)
        {
            ModService modService = GetContext().ModServices.SingleOrDefault(u => u.Id == id);
            GetContext().ModServices.DeleteOnSubmit(modService);
            GetContext().SubmitChanges();
            return true;
        }
    }
}