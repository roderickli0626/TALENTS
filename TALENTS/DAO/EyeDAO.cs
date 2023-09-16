using System;
using System.Collections.Generic;
using System.Data.Linq;
using System.Linq;
using System.Web;

namespace TALENTS.DAO
{
    public class EyeDAO : BasicDAO
    {
        public EyeDAO() { }

        public List<Eye> FindAll()
        {
            Table<Eye> table = GetContext().Eyes;
            return table.ToList();
        }
        public bool Insert(Eye eye)
        {
            GetContext().Eyes.InsertOnSubmit(eye);
            GetContext().SubmitChanges();
            return true;
        }

        public bool Update(Eye eye)
        {
            GetContext().SubmitChanges();
            GetContext().Refresh(RefreshMode.OverwriteCurrentValues, eye);
            return true;
        }
        public bool Delete(int id)
        {
            Eye eye = GetContext().Eyes.SingleOrDefault(u => u.Id == id);
            GetContext().Eyes.DeleteOnSubmit(eye);
            GetContext().SubmitChanges();
            return true;
        }
    }
}