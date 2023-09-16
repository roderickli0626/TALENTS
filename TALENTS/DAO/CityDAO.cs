using System;
using System.Collections.Generic;
using System.Data.Linq;
using System.Linq;
using System.Web;

namespace TALENTS.DAO
{
    public class CityDAO : BasicDAO
    {
        public CityDAO() { }

        public List<City> FindAll()
        {
            Table<City> table = GetContext().Cities;
            return table.ToList();
        }
        public bool Insert(City city)
        {
            GetContext().Cities.InsertOnSubmit(city);
            GetContext().SubmitChanges();
            return true;
        }

        public bool Update(City city)
        {
            GetContext().SubmitChanges();
            GetContext().Refresh(RefreshMode.OverwriteCurrentValues, city);
            return true;
        }
        public bool Delete(int id)
        {
            City city = GetContext().Cities.SingleOrDefault(u => u.Id == id);
            GetContext().Cities.DeleteOnSubmit(city);
            GetContext().SubmitChanges();
            return true;
        }
    }
}