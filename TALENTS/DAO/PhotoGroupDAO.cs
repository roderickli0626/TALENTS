using System;
using System.Collections.Generic;
using System.Data.Linq;
using System.Linq;
using System.Web;

namespace TALENTS.DAO
{
    public class PhotoGroupDAO : BasicDAO
    {
        public PhotoGroupDAO() { }

        public List<PhotoGroup> FindAll()
        {
            Table<PhotoGroup> table = GetContext().PhotoGroups;
            return table.ToList();
        }
        public bool Insert(PhotoGroup phoGroup)
        {
            GetContext().PhotoGroups.InsertOnSubmit(phoGroup);
            GetContext().SubmitChanges();
            return true;
        }

        public bool Update(PhotoGroup phoGroup)
        {
            GetContext().SubmitChanges();
            GetContext().Refresh(RefreshMode.OverwriteCurrentValues, phoGroup);
            return true;
        }
        public bool Delete(int id)
        {
            PhotoGroup phoGroup = GetContext().PhotoGroups.SingleOrDefault(u => u.Id == id);
            GetContext().PhotoGroups.DeleteOnSubmit(phoGroup);
            GetContext().SubmitChanges();
            return true;
        }
        public IQueryable<PhotoGroup> Search()
        {
            IQueryable<PhotoGroup> table = GetContext().PhotoGroups;

            return table;
        }

    }
}