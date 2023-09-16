using System;
using System.Collections.Generic;
using System.Data.Linq;
using System.Linq;
using System.Web;

namespace TALENTS.DAO
{
    public class IncallPlaceDAO : BasicDAO
    {
        public IncallPlaceDAO() { }

        public List<IncallPlace> FindAll()
        {
            Table<IncallPlace> table = GetContext().IncallPlaces;
            return table.ToList();
        }
        public bool Insert(IncallPlace InP)
        {
            GetContext().IncallPlaces.InsertOnSubmit(InP);
            GetContext().SubmitChanges();
            return true;
        }

        public bool Update(IncallPlace InP)
        {
            GetContext().SubmitChanges();
            GetContext().Refresh(RefreshMode.OverwriteCurrentValues, InP);
            return true;
        }
        public bool Delete(int id)
        {
            IncallPlace InP = GetContext().IncallPlaces.SingleOrDefault(u => u.Id == id);
            GetContext().IncallPlaces.DeleteOnSubmit(InP);
            GetContext().SubmitChanges();
            return true;
        }
    }
}