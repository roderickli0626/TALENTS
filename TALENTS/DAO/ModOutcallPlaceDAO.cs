using System;
using System.Collections.Generic;
using System.Data.Linq;
using System.Linq;
using System.Web;

namespace TALENTS.DAO
{
    public class ModOutcallPlaceDAO : BasicDAO
    {
        public ModOutcallPlaceDAO() { }
        public List<ModOutcallPlace> FindByModel(int modelId)
        {
            IEnumerable<ModOutcallPlace> table = GetContext().ModOutcallPlaces.Where(m => m.ModelId == modelId);
            return table.ToList();
        }
        public bool Insert(ModOutcallPlace modOut)
        {
            GetContext().ModOutcallPlaces.InsertOnSubmit(modOut);
            GetContext().SubmitChanges();
            return true;
        }

        public bool Update(ModOutcallPlace modOut)
        {
            GetContext().SubmitChanges();
            GetContext().Refresh(RefreshMode.OverwriteCurrentValues, modOut);
            return true;
        }
        public bool Delete(int id)
        {
            ModOutcallPlace modOut = GetContext().ModOutcallPlaces.SingleOrDefault(u => u.Id == id);
            GetContext().ModOutcallPlaces.DeleteOnSubmit(modOut);
            GetContext().SubmitChanges();
            return true;
        }
    }
}