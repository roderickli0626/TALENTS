using System;
using System.Collections.Generic;
using System.Data.Linq;
using System.Linq;
using System.Web;

namespace TALENTS.DAO
{
    public class ModIncallRateDAO : BasicDAO
    {
        public ModIncallRateDAO() { }

        public List<ModIncallRate> FindByModInPlace(int incallPlaceId)
        {
            IEnumerable<ModIncallRate> table = GetContext().ModIncallRates.Where(m => m.ModIncallPlaceId == incallPlaceId);
            return table.ToList();
        }
        public bool Insert(ModIncallRate modIn)
        {
            GetContext().ModIncallRates.InsertOnSubmit(modIn);
            GetContext().SubmitChanges();
            return true;
        }

        public bool Update(ModIncallRate modIn)
        {
            GetContext().SubmitChanges();
            GetContext().Refresh(RefreshMode.OverwriteCurrentValues, modIn);
            return true;
        }
        public bool Delete(int id)
        {
            ModIncallRate modIn = GetContext().ModIncallRates.SingleOrDefault(u => u.Id == id);
            GetContext().ModIncallRates.DeleteOnSubmit(modIn);
            GetContext().SubmitChanges();
            return true;
        }
    }
}