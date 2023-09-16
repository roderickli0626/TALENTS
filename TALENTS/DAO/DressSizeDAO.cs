using System;
using System.Collections.Generic;
using System.Data.Linq;
using System.Linq;
using System.Web;

namespace TALENTS.DAO
{
    public class DressSizeDAO : BasicDAO
    {
        public DressSizeDAO() { }

        public List<DressSize> FindAll()
        {
            Table<DressSize> table = GetContext().DressSizes;
            return table.ToList();
        }
        public bool Insert(DressSize size)
        {
            GetContext().DressSizes.InsertOnSubmit(size);
            GetContext().SubmitChanges();
            return true;
        }

        public bool Update(DressSize size)
        {
            GetContext().SubmitChanges();
            GetContext().Refresh(RefreshMode.OverwriteCurrentValues, size);
            return true;
        }
        public bool Delete(int id)
        {
            DressSize size = GetContext().DressSizes.SingleOrDefault(u => u.Id == id);
            GetContext().DressSizes.DeleteOnSubmit(size);
            GetContext().SubmitChanges();
            return true;
        }
    }
}