using System;
using System.Collections.Generic;
using System.Data.Linq;
using System.Linq;
using System.Web;

namespace TALENTS.DAO
{
    public class ModVideoDAO : BasicDAO
    {
        public ModVideoDAO() { }
        public List<ModVideo> FindByModel(int modelId)
        {
            IEnumerable<ModVideo> table = GetContext().ModVideos.Where(m => m.ModelId == modelId);
            return table.ToList();
        }
        public bool Insert(ModVideo modVideo)
        {
            GetContext().ModVideos.InsertOnSubmit(modVideo);
            GetContext().SubmitChanges();
            return true;
        }

        public bool Update(ModVideo modVideo)
        {
            GetContext().SubmitChanges();
            GetContext().Refresh(RefreshMode.OverwriteCurrentValues, modVideo);
            return true;
        }
        public bool Delete(int id)
        {
            ModVideo modVideo = GetContext().ModVideos.SingleOrDefault(u => u.Id == id);
            GetContext().ModVideos.DeleteOnSubmit(modVideo);
            GetContext().SubmitChanges();
            return true;
        }
    }
}