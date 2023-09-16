using System;
using System.Collections.Generic;
using System.Data.Linq;
using System.Linq;
using System.Web;

namespace TALENTS.DAO
{
    public class EthnicityDAO : BasicDAO
    {
        public EthnicityDAO() { }

        public List<Ethnicity> FindAll()
        {
            Table<Ethnicity> table = GetContext().Ethnicities;
            return table.ToList();
        }
        public bool Insert(Ethnicity ethnicity)
        {
            GetContext().Ethnicities.InsertOnSubmit(ethnicity);
            GetContext().SubmitChanges();
            return true;
        }

        public bool Update(Ethnicity ethnicity)
        {
            GetContext().SubmitChanges();
            GetContext().Refresh(RefreshMode.OverwriteCurrentValues, ethnicity);
            return true;
        }
        public bool Delete(int id)
        {
            Ethnicity ethnicity = GetContext().Ethnicities.SingleOrDefault(u => u.Id == id);
            GetContext().Ethnicities.DeleteOnSubmit(ethnicity);
            GetContext().SubmitChanges();
            return true;
        }
    }
}