using System;
using System.Collections.Generic;
using System.Data.Linq;
using System.Linq;
using System.Web;

namespace TALENTS.DAO
{
    public class ServiceGroupDAO : BasicDAO
    {
        public ServiceGroupDAO() { }

        public List<ServiceGroup> FindAll()
        {
            Table<ServiceGroup> table = GetContext().ServiceGroups;
            return table.ToList();
        }
        public bool Insert(ServiceGroup servGroup)
        {
            GetContext().ServiceGroups.InsertOnSubmit(servGroup);
            GetContext().SubmitChanges();
            return true;
        }

        public bool Update(ServiceGroup servGroup)
        {
            GetContext().SubmitChanges();
            GetContext().Refresh(RefreshMode.OverwriteCurrentValues, servGroup);
            return true;
        }
        public bool Delete(int id)
        {
            ServiceGroup servGroup = GetContext().ServiceGroups.SingleOrDefault(u => u.Id == id);
            GetContext().ServiceGroups.DeleteOnSubmit(servGroup);
            GetContext().SubmitChanges();
            return true;
        }
    }
}