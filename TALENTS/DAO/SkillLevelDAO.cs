using System;
using System.Collections.Generic;
using System.Data.Linq;
using System.Linq;
using System.Web;

namespace TALENTS.DAO
{
    public class SkillLevelDAO : BasicDAO
    {
        public SkillLevelDAO() { }
        public List<SkillLevel> FindAll()
        {
            Table<SkillLevel> table = GetContext().SkillLevels;
            return table.ToList();
        }
        public bool Insert(SkillLevel skL)
        {
            GetContext().SkillLevels.InsertOnSubmit(skL);
            GetContext().SubmitChanges();
            return true;
        }

        public bool Update(SkillLevel skL)
        {
            GetContext().SubmitChanges();
            GetContext().Refresh(RefreshMode.OverwriteCurrentValues, skL);
            return true;
        }
        public bool Delete(int id)
        {
            SkillLevel skL = GetContext().SkillLevels.SingleOrDefault(u => u.Id == id);
            GetContext().SkillLevels.DeleteOnSubmit(skL);
            GetContext().SubmitChanges();
            return true;
        }
    }
}