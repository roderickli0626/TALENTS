using System;
using System.Collections.Generic;
using System.Data.Linq;
using System.Linq;
using System.Web;

namespace TALENTS.DAO
{
    public class ModTourDAO : BasicDAO
    {
        public ModTourDAO() { }
        public List<ModTour> FindByModel(int modelId)
        {
            IEnumerable<ModTour> table = GetContext().ModTours.Where(m => m.ModelId == modelId);
            return table.ToList();
        }
        public bool Insert(ModTour modTour)
        {
            GetContext().ModTours.InsertOnSubmit(modTour);
            GetContext().SubmitChanges();
            return true;
        }

        public bool Update(ModTour modTour)
        {
            GetContext().SubmitChanges();
            GetContext().Refresh(RefreshMode.OverwriteCurrentValues, modTour);
            return true;
        }
        public bool Delete(int id)
        {
            ModTour modTour = GetContext().ModTours.SingleOrDefault(u => u.Id == id);
            GetContext().ModTours.DeleteOnSubmit(modTour);
            GetContext().SubmitChanges();
            return true;
        }
    }
}