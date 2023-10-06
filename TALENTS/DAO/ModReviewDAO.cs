using System;
using System.Collections.Generic;
using System.Data.Linq;
using System.Linq;
using System.Web;

namespace TALENTS.DAO
{
    public class ModReviewDAO : BasicDAO
    {
        public ModReviewDAO() { }

        public List<ModReview> FindAll() 
        {
            Table<ModReview> table = GetContext().ModReviews;
            return table.ToList();
        }
        public List<ModReview> FindByModel(int modelId)
        {
            IEnumerable<ModReview> table = GetContext().ModReviews.Where(m => m.ModelId == modelId);
            return table.ToList();
        }
        public bool Insert(ModReview modReview)
        {
            GetContext().ModReviews.InsertOnSubmit(modReview);
            GetContext().SubmitChanges();
            return true;
        }

        public bool Update(ModReview modReview)
        {
            GetContext().SubmitChanges();
            GetContext().Refresh(RefreshMode.OverwriteCurrentValues, modReview);
            return true;
        }
        public bool Delete(int id)
        {
            ModReview modReview = GetContext().ModReviews.SingleOrDefault(u => u.Id == id);
            GetContext().ModReviews.DeleteOnSubmit(modReview);
            GetContext().SubmitChanges();
            return true;
        }

    }
}