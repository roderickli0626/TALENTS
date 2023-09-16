using System;
using System.Collections.Generic;
using System.Data.Linq;
using System.Linq;
using System.Web;

namespace TALENTS.DAO
{
    public class ModNaturalPhotoDAO : BasicDAO
    {
        public ModNaturalPhotoDAO() { }
        public List<ModNaturalPhoto> FindByModel(int modelId)
        {
            IEnumerable<ModNaturalPhoto> table = GetContext().ModNaturalPhotos.Where(m => m.ModelId == modelId);
            return table.ToList();
        }
        public bool Insert(ModNaturalPhoto modNaPhoto)
        {
            GetContext().ModNaturalPhotos.InsertOnSubmit(modNaPhoto);
            GetContext().SubmitChanges();
            return true;
        }

        public bool Update(ModNaturalPhoto modNaPhoto)
        {
            GetContext().SubmitChanges();
            GetContext().Refresh(RefreshMode.OverwriteCurrentValues, modNaPhoto);
            return true;
        }
        public bool Delete(int id)
        {
            ModNaturalPhoto modNaPhoto = GetContext().ModNaturalPhotos.SingleOrDefault(u => u.Id == id);
            GetContext().ModNaturalPhotos.DeleteOnSubmit(modNaPhoto);
            GetContext().SubmitChanges();
            return true;
        }
    }
}