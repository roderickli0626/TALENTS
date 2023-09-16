using System;
using System.Collections.Generic;
using System.Data.Linq;
using System.Linq;
using System.Web;

namespace TALENTS.DAO
{
    public class LanguageDAO : BasicDAO
    {
        public LanguageDAO() { }

        public List<Language> FindAll()
        {
            Table<Language> table = GetContext().Languages;
            return table.ToList();
        }
        public bool Insert(Language lang)
        {
            GetContext().Languages.InsertOnSubmit(lang);
            GetContext().SubmitChanges();
            return true;
        }

        public bool Update(Language lang)
        {
            GetContext().SubmitChanges();
            GetContext().Refresh(RefreshMode.OverwriteCurrentValues, lang);
            return true;
        }
        public bool Delete(int id)
        {
            Language lang = GetContext().Languages.SingleOrDefault(u => u.Id == id);
            GetContext().Languages.DeleteOnSubmit(lang);
            GetContext().SubmitChanges();
            return true;
        }
    }
}