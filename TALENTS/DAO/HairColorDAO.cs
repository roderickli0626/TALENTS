using System;
using System.Collections.Generic;
using System.Data.Linq;
using System.Linq;
using System.Web;

namespace TALENTS.DAO
{
    public class HairColorDAO : BasicDAO
    {
        public HairColorDAO() { }
        public List<HairColor> FindAll()
        {
            Table<HairColor> table = GetContext().HairColors;
            return table.ToList();
        }
        public bool Insert(HairColor hc)
        {
            GetContext().HairColors.InsertOnSubmit(hc);
            GetContext().SubmitChanges();
            return true;
        }

        public bool Update(HairColor hc)
        {
            GetContext().SubmitChanges();
            GetContext().Refresh(RefreshMode.OverwriteCurrentValues, hc);
            return true;
        }
        public bool Delete(int id)
        {
            HairColor hc = GetContext().HairColors.SingleOrDefault(u => u.Id == id);
            GetContext().HairColors.DeleteOnSubmit(hc);
            GetContext().SubmitChanges();
            return true;
        }
    }
}