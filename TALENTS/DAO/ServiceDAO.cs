using System;
using System.Collections.Generic;
using System.Data.Linq;
using System.Linq;
using System.Web;

namespace TALENTS.DAO
{
    public class ServiceDAO : BasicDAO
    {
        public ServiceDAO() { }

        public List<Service> FindAll()
        {
            Table<Service> table = GetContext().Services;
            return table.ToList();
        }
        public bool Insert(Service serv)
        {
            GetContext().Services.InsertOnSubmit(serv);
            GetContext().SubmitChanges();
            return true;
        }

        public bool Update(Service serv)
        {
            GetContext().SubmitChanges();
            GetContext().Refresh(RefreshMode.OverwriteCurrentValues, serv);
            return true;
        }
        public bool Delete(int id)
        {
            Service serv = GetContext().Services.SingleOrDefault(u => u.Id == id);
            GetContext().Services.DeleteOnSubmit(serv);
            GetContext().SubmitChanges();
            return true;
        }
    }
}