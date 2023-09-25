using System;
using System.Collections.Generic;
using System.Data.Linq;
using System.Linq;
using System.Web;

namespace TALENTS.DAO
{
    public class ModOutcallRateDAO : BasicDAO
    {
        public ModOutcallRateDAO() { }
        public List<ModOutcallRate> FindByModOutPlace(int outcallPlaceId)
        {
            IEnumerable<ModOutcallRate> table = GetContext().ModOutcallRates.Where(m => m.ModOutcallPlaceId == outcallPlaceId);
            return table.ToList();
        }
        public List<ModOutcallRate> FindByModel(int modelId)
        {
            IEnumerable<ModOutcallRate> table = GetContext().ModOutcallRates.Where(m => m.ModOutcallPlace.ModelId == modelId);
            return table.ToList();
        }
        public bool Insert(ModOutcallRate modOut)
        {
            GetContext().ModOutcallRates.InsertOnSubmit(modOut);
            GetContext().SubmitChanges();
            return true;
        }

        public bool Update(ModOutcallRate modOut)
        {
            GetContext().SubmitChanges();
            GetContext().Refresh(RefreshMode.OverwriteCurrentValues, modOut);
            return true;
        }
        public bool Delete(int id)
        {
            ModOutcallRate modOut = GetContext().ModOutcallRates.SingleOrDefault(u => u.Id == id);
            GetContext().ModOutcallRates.DeleteOnSubmit(modOut);
            GetContext().SubmitChanges();
            return true;
        }
    }
}