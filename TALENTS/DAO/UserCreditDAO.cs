using System;
using System.Collections.Generic;
using System.Data.Linq;
using System.Linq;
using System.Web;

namespace TALENTS.DAO
{
    public class UserCreditDAO : BasicDAO
    {
        public UserCreditDAO() { }
        public List<UserCredit> FindAll()
        {
            Table<UserCredit> table = GetContext().UserCredits;
            return table.ToList();
        }
        public UserCredit FindByUser(int userId)
        {
            IEnumerable<UserCredit> table = GetContext().UserCredits.Where(m => m.UserId == userId);
            return table.FirstOrDefault();
        }
        public bool Insert(UserCredit userCredit)
        {
            GetContext().UserCredits.InsertOnSubmit(userCredit);
            GetContext().SubmitChanges();
            return true;
        }

        public bool Update(UserCredit userCredit)
        {
            GetContext().SubmitChanges();
            GetContext().Refresh(RefreshMode.OverwriteCurrentValues, userCredit);
            return true;
        }
        public bool Delete(int id)
        {
            UserCredit userCredit = GetContext().UserCredits.SingleOrDefault(u => u.Id == id);
            GetContext().UserCredits.DeleteOnSubmit(userCredit);
            return true;
        }
    }
}