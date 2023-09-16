using System;
using System.Collections.Generic;
using System.Data.Linq;
using System.Linq;
using System.Web;

namespace TALENTS.DAO
{
    public class BreastSizeDAO : BasicDAO
    {
        public BreastSizeDAO() { }

        public List<BreastSize> FindAll()
        {
            Table<BreastSize> table = GetContext().BreastSizes;
            return table.ToList();
        }
        public bool Insert(BreastSize size)
        {
            GetContext().BreastSizes.InsertOnSubmit(size);
            GetContext().SubmitChanges();
            return true;
        }

        public bool Update(BreastSize size)
        {
            GetContext().SubmitChanges();
            GetContext().Refresh(RefreshMode.OverwriteCurrentValues, size);
            return true;
        }
        public bool Delete(int id)
        {
            BreastSize size = GetContext().BreastSizes.SingleOrDefault(u => u.Id == id);
            GetContext().BreastSizes.DeleteOnSubmit(size);
            GetContext().SubmitChanges();
            return true;
        }
    }
}