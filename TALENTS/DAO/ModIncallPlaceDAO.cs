using System;
using System.Collections.Generic;
using System.Data.Linq;
using System.Linq;
using System.Web;

namespace TALENTS.DAO
{
    public class ModIncallPlaceDAO : BasicDAO
    {
        public ModIncallPlaceDAO() { }
        public List<ModIncallPlace> FindByModel(int modelId)
        {
            IEnumerable<ModIncallPlace> table = GetContext().ModIncallPlaces.Where(m => m.ModelId == modelId);
            return table.ToList();
        }
        public bool Insert(ModIncallPlace modIn)
        {
            GetContext().ModIncallPlaces.InsertOnSubmit(modIn);
            GetContext().SubmitChanges();
            return true;
        }

        public bool Update(ModIncallPlace modIn)
        {
            GetContext().SubmitChanges();
            GetContext().Refresh(RefreshMode.OverwriteCurrentValues, modIn);
            return true;
        }
        public bool Delete(int id)
        {
            ModIncallPlace modIn = GetContext().ModIncallPlaces.SingleOrDefault(u => u.Id == id);
            GetContext().ModIncallPlaces.DeleteOnSubmit(modIn);
            GetContext().SubmitChanges();
            return true;
        }
    }
}