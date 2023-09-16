using System;
using System.Collections.Generic;
using System.Data.Linq;
using System.Linq;
using System.Web;

namespace TALENTS.DAO
{
    public class WorkDayDAO : BasicDAO
    {
        public WorkDayDAO() { }
        public List<WorkDay> FindAll()
        {
            Table<WorkDay> table = GetContext().WorkDays;
            return table.ToList();
        }
        public bool Insert(WorkDay woDay)
        {
            GetContext().WorkDays.InsertOnSubmit(woDay);
            GetContext().SubmitChanges();
            return true;
        }

        public bool Update(WorkDay woDay)
        {
            GetContext().SubmitChanges();
            GetContext().Refresh(RefreshMode.OverwriteCurrentValues, woDay);
            return true;
        }
        public bool Delete(int id)
        {
            WorkDay woDay = GetContext().WorkDays.SingleOrDefault(u => u.Id == id);
            GetContext().WorkDays.DeleteOnSubmit(woDay);
            GetContext().SubmitChanges();
            return true;
        }
    }
}