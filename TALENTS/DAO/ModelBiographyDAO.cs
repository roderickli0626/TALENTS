using System;
using System.Collections.Generic;
using System.Data.Linq;
using System.Linq;
using System.Web;

namespace TALENTS.DAO
{
    public class ModelBiographyDAO : BasicDAO
    {
        public ModelBiographyDAO() { }

        public List<ModBiography> FindAll()
        {
            Table<ModBiography> table = GetContext().ModBiographies;
            return table.ToList();
        }
        public bool Insert(ModBiography model)
        {
            GetContext().ModBiographies.InsertOnSubmit(model);
            GetContext().SubmitChanges();
            return true;
        }

        public bool Update(ModBiography model)
        {
            GetContext().SubmitChanges();
            GetContext().Refresh(RefreshMode.OverwriteCurrentValues, model);
            return true;
        }
        public bool Delete(int id)
        {
            ModBiography model = GetContext().ModBiographies.SingleOrDefault(u => u.Id == id);
            GetContext().ModBiographies.DeleteOnSubmit(model);
            GetContext().SubmitChanges();
            return true;
        }

        public List<ModBiography> FindByCity (int cityId)
        {
            if (cityId == 0) return GetContext().ModBiographies.ToList();
            return GetContext().ModBiographies.Where(m => m.CityResidenceId == cityId).ToList();
        }

        public ModBiography FindByModelId(int modelId)
        {
            return GetContext().ModBiographies.Where(m => m.ModelId == modelId).FirstOrDefault();
        }
    }
}