using System;
using System.Collections.Generic;
using System.Data.Linq;
using System.Linq;
using System.Web;

namespace TALENTS.DAO
{
    public class DurationDAO : BasicDAO
    {
        public DurationDAO() { }

        public List<Duration> FindAll()
        {
            Table<Duration> table = GetContext().Durations;
            return table.ToList();
        }
        public bool Insert(Duration duration)
        {
            GetContext().Durations.InsertOnSubmit(duration);
            GetContext().SubmitChanges();
            return true;
        }

        public bool Update(Duration duration)
        {
            GetContext().SubmitChanges();
            GetContext().Refresh(RefreshMode.OverwriteCurrentValues, duration);
            return true;
        }
        public bool Delete(int id)
        {
            Duration duration = GetContext().Durations.SingleOrDefault(u => u.Id == id);
            GetContext().Durations.DeleteOnSubmit(duration);
            GetContext().SubmitChanges();
            return true;
        }
    }
}