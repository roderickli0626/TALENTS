using System;
using System.Collections.Generic;
using System.Data.Linq;
using System.Linq;
using System.Web;

namespace TALENTS.DAO
{
    public class NationalityDAO : BasicDAO
    {
        public NationalityDAO() { }

        public List<Nationality> FindAll()
        {
            Table<Nationality> table = GetContext().Nationalities;
            return table.ToList();
        }
        public bool Insert(Nationality nat)
        {
            GetContext().Nationalities.InsertOnSubmit(nat);
            GetContext().SubmitChanges();
            return true;
        }

        public bool Update(Nationality nat)
        {
            GetContext().SubmitChanges();
            GetContext().Refresh(RefreshMode.OverwriteCurrentValues, nat);
            return true;
        }
        public bool Delete(int id)
        {
            Nationality nat = GetContext().Nationalities.SingleOrDefault(u => u.Id == id);
            GetContext().Nationalities.DeleteOnSubmit(nat);
            GetContext().SubmitChanges();
            return true;
        }
    }
}