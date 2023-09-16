using System;
using System.Collections.Generic;
using System.Data.Linq;
using System.Linq;
using System.Web;

namespace TALENTS.DAO
{
    public class WorkHourDAO : BasicDAO
    {
        public WorkHourDAO() { }

        public List<WorkHour> FindAll()
        {
            Table<WorkHour> table = GetContext().WorkHours;
            return table.ToList();
        }
        public bool Insert(WorkHour woHour)
        {
            GetContext().WorkHours.InsertOnSubmit(woHour);
            GetContext().SubmitChanges();
            return true;
        }

        public bool Update(WorkHour woHour)
        {
            GetContext().SubmitChanges();
            GetContext().Refresh(RefreshMode.OverwriteCurrentValues, woHour);
            return true;
        }
        public bool Delete(int id)
        {
            WorkHour woHour = GetContext().WorkHours.SingleOrDefault(u => u.Id == id);
            GetContext().WorkHours.DeleteOnSubmit(woHour);
            GetContext().SubmitChanges();
            return true;
        }
    }
}