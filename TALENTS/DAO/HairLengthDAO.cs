using System;
using System.Collections.Generic;
using System.Data.Linq;
using System.Linq;
using System.Web;

namespace TALENTS.DAO
{
    public class HairLengthDAO : BasicDAO
    {
        public HairLengthDAO() { }

        public List<HairLength> FindAll()
        {
            Table<HairLength> table = GetContext().HairLengths;
            return table.ToList();
        }
        public bool Insert(HairLength hl)
        {
            GetContext().HairLengths.InsertOnSubmit(hl);
            GetContext().SubmitChanges();
            return true;
        }

        public bool Update(HairLength hl)
        {
            GetContext().SubmitChanges();
            GetContext().Refresh(RefreshMode.OverwriteCurrentValues, hl);
            return true;
        }
        public bool Delete(int id)
        {
            HairLength hl = GetContext().HairLengths.SingleOrDefault(u => u.Id == id);
            GetContext().HairLengths.DeleteOnSubmit(hl);
            GetContext().SubmitChanges();
            return true;
        }
    }
}