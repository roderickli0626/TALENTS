using System;
using System.Collections.Generic;
using System.Data.Linq;
using System.Linq;
using System.Web;

namespace TALENTS.DAO
{
    public class ModSettingDAO : BasicDAO
    {
        public ModSettingDAO() { }
        public ModSetting FindByModel(int modelId)
        {
            IEnumerable<ModSetting> table = GetContext().ModSettings.Where(m => m.ModelId == modelId);
            return table.FirstOrDefault();
        }
        public bool Insert(ModSetting modSetting)
        {
            GetContext().ModSettings.InsertOnSubmit(modSetting);
            GetContext().SubmitChanges();
            return true;
        }

        public bool Update(ModSetting modSetting)
        {
            GetContext().SubmitChanges();
            GetContext().Refresh(RefreshMode.OverwriteCurrentValues, modSetting);
            return true;
        }
        public bool Delete(int id)
        {
            ModSetting modSetting = GetContext().ModSettings.SingleOrDefault(u => u.Id == id);
            GetContext().ModSettings.DeleteOnSubmit(modSetting);
            GetContext().SubmitChanges();
            return true;
        }
    }
}