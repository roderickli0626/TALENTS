using System;
using System.Collections.Generic;
using System.Data.Linq;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;

namespace TALENTS.DAO
{
    public class ModelDAO : BasicDAO
    {
        public ModelDAO() { }

        public List<Model> FindAll()
        {
            Table<Model> table = GetContext().Models;
            return table.ToList();
        }

        public List<Model> FindAllModels()
        {
            return GetContext().Models.Where(m => m.IsModel == true).ToList();
        }

        public List<Model> FindAllUsers()
        {
            return GetContext().Models.Where(u => u.IsUser == true).ToList();
        }

        public List<Model> FindAllAdmins()
        {
            return GetContext().Models.Where(u => u.IsAdmin == true).ToList();
        }

        public Model FindById(int id)
        {
            return GetContext().Models.Where(m => m.Id == id).FirstOrDefault();
        }

        public Model FindByEmail(string email) 
        {
            return GetContext().Models.Where(m => m.Email == email).FirstOrDefault();
        }

        public bool Insert(Model model)
        {
            GetContext().Models.InsertOnSubmit(model);
            GetContext().SubmitChanges();
            return true;
        }

        public bool Update(Model model)
        {
            GetContext().SubmitChanges();
            GetContext().Refresh(RefreshMode.OverwriteCurrentValues, model);
            return true;
        }
        public bool Delete(int id)
        {
            Model model = GetContext().Models.SingleOrDefault(u => u.Id == id);
            GetContext().Models.DeleteOnSubmit(model);
            GetContext().SubmitChanges();
            return true;
        }
    }
}