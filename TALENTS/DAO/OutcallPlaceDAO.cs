using System;
using System.Collections.Generic;
using System.Data.Linq;
using System.Linq;
using System.Web;

namespace TALENTS.DAO
{
    public class OutcallPlaceDAO : BasicDAO
    {
        public OutcallPlaceDAO() { }

        public List<OutcallPlace> FindAll()
        {
            Table<OutcallPlace> table = GetContext().OutcallPlaces;
            return table.ToList();
        }
        public bool Insert(OutcallPlace outP)
        {
            GetContext().OutcallPlaces.InsertOnSubmit(outP);
            GetContext().SubmitChanges();
            return true;
        }

        public bool Update(OutcallPlace outP)
        {
            GetContext().SubmitChanges();
            GetContext().Refresh(RefreshMode.OverwriteCurrentValues, outP);
            return true;
        }
        public bool Delete(int id)
        {
            OutcallPlace outP = GetContext().OutcallPlaces.SingleOrDefault(u => u.Id == id);
            GetContext().OutcallPlaces.DeleteOnSubmit(outP);
            GetContext().SubmitChanges();
            return true;
        }
    }
}