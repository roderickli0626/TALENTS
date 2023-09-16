using System;
using System.Collections.Generic;
using System.Data.Linq;
using System.Linq;
using System.Web;

namespace TALENTS.DAO
{
    public class ModWorkCityDAO : BasicDAO
    {
        public ModWorkCityDAO() { }
        public List<ModWorkingCityAlloc> FindByModel(int modelId)
        {
            IEnumerable<ModWorkingCityAlloc> table = GetContext().ModWorkingCityAllocs.Where(m => m.ModelId == modelId);
            return table.ToList();
        }
        public bool Insert(ModWorkingCityAlloc modWorkingCityAlloc)
        {
            GetContext().ModWorkingCityAllocs.InsertOnSubmit(modWorkingCityAlloc);
            GetContext().SubmitChanges();
            return true;
        }

        public bool Update(ModWorkingCityAlloc modWorkingCityAlloc)
        {
            GetContext().SubmitChanges();
            GetContext().Refresh(RefreshMode.OverwriteCurrentValues, modWorkingCityAlloc);
            return true;
        }
        public bool Delete(int id)
        {
            ModWorkingCityAlloc modWorkingCityAlloc = GetContext().ModWorkingCityAllocs.SingleOrDefault(u => u.Id == id);
            GetContext().ModWorkingCityAllocs.DeleteOnSubmit(modWorkingCityAlloc);
            GetContext().SubmitChanges();
            return true;
        }
    }
}