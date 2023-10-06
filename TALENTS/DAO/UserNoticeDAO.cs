using System;
using System.Collections.Generic;
using System.Data.Linq;
using System.Linq;
using System.Web;

namespace TALENTS.DAO
{
    public class UserNoticeDAO : BasicDAO
    {
        public UserNoticeDAO() { }
        public List<UserNotice> FindAll()
        {
            Table<UserNotice> table = GetContext().UserNotices;
            return table.ToList();
        }
        public List<UserNotice> FindByUser(int userId)
        {
            IEnumerable<UserNotice> table = GetContext().UserNotices.Where(m => m.UserId == userId);
            return table.ToList();
        }
        public bool Insert(UserNotice userNotice)
        {
            GetContext().UserNotices.InsertOnSubmit(userNotice);
            GetContext().SubmitChanges();
            return true;
        }

        public bool Update(UserNotice userNotice)
        {
            GetContext().SubmitChanges();
            GetContext().Refresh(RefreshMode.OverwriteCurrentValues, userNotice);
            return true;
        }
        public bool Delete(int id)
        {
            UserNotice userNotice = GetContext().UserNotices.SingleOrDefault(u => u.Id == id);
            GetContext().UserNotices.DeleteOnSubmit(userNotice);
            GetContext().SubmitChanges();
            return true;
        }
    }
}