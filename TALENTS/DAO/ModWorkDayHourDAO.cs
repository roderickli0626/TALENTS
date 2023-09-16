using System;
using System.Collections.Generic;
using System.Data.Linq;
using System.Linq;
using System.Web;

namespace TALENTS.DAO
{
    public class ModWorkDayHourDAO : BasicDAO
    {
        public ModWorkDayHourDAO() { }
        public List<ModWorkDayHour> FindByModel(int modelId)
        {
            IEnumerable<ModWorkDayHour> table = GetContext().ModWorkDayHours.Where(m => m.ModelId == modelId);
            return table.ToList();
        }
        public bool Insert(ModWorkDayHour modWorkDayHour)
        {
            GetContext().ModWorkDayHours.InsertOnSubmit(modWorkDayHour);
            GetContext().SubmitChanges();
            return true;
        }

        public bool Update(ModWorkDayHour modWorkDayHour)
        {
            GetContext().SubmitChanges();
            GetContext().Refresh(RefreshMode.OverwriteCurrentValues, modWorkDayHour);
            return true;
        }
        public bool Delete(int id)
        {
            ModWorkDayHour modWorkDayHour = GetContext().ModWorkDayHours.SingleOrDefault(u => u.Id == id);
            GetContext().ModWorkDayHours.DeleteOnSubmit(modWorkDayHour);
            GetContext().SubmitChanges();
            return true;
        }
    }
}