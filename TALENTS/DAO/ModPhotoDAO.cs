using System;
using System.Collections.Generic;
using System.Data.Linq;
using System.Linq;
using System.Web;

namespace TALENTS.DAO
{
    public class ModPhotoDAO : BasicDAO
    {
        public ModPhotoDAO() { }

        public List<ModPhoto> FindByModel(int modelId)
        {
            IEnumerable<ModPhoto> table = GetContext().ModPhotos.Where(m => m.ModelId == modelId);
            return table.ToList();
        }

        public List<ModPhoto> FindByModelAndGroup(int modelId, int groupId)
        {
            IEnumerable<ModPhoto> table = GetContext().ModPhotos.Where(m => m.ModelId == modelId && m.GroupId == groupId);
            return table.ToList();
        }
        public bool Insert(ModPhoto modPhoto)
        {
            GetContext().ModPhotos.InsertOnSubmit(modPhoto);
            GetContext().SubmitChanges();
            return true;
        }

        public bool Update(ModPhoto modPhoto)
        {
            GetContext().SubmitChanges();
            GetContext().Refresh(RefreshMode.OverwriteCurrentValues, modPhoto);
            return true;
        }
        public bool Delete(int id)
        {
            ModPhoto modPhoto = GetContext().ModPhotos.SingleOrDefault(u => u.Id == id);
            GetContext().ModPhotos.DeleteOnSubmit(modPhoto);
            GetContext().SubmitChanges();
            return true;
        }
    }
}