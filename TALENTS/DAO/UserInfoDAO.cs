using System;
using System.Collections.Generic;
using System.Data.Linq;
using System.Linq;
using System.Web;

namespace TALENTS.DAO
{
    public class UserInfoDAO : BasicDAO
    {
        public UserInfoDAO() { }

        public List<UserInfo> FindAll()
        {
            Table<UserInfo> table = GetContext().UserInfos;
            return table.ToList();
        }
        public bool Insert(UserInfo userIn)
        {
            GetContext().UserInfos.InsertOnSubmit(userIn);
            GetContext().SubmitChanges();
            return true;
        }

        public bool Update(UserInfo userIn)
        {
            GetContext().SubmitChanges();
            GetContext().Refresh(RefreshMode.OverwriteCurrentValues, userIn);
            return true;
        }
        public bool Delete(int id)
        {
            UserInfo userIn = GetContext().UserInfos.SingleOrDefault(u => u.Id == id);
            GetContext().UserInfos.DeleteOnSubmit(userIn);
            GetContext().SubmitChanges();
            return true;
        }
    }
}