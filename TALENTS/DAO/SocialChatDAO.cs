using System;
using System.Collections.Generic;
using System.Data.Linq;
using System.Linq;
using System.Web;

namespace TALENTS.DAO
{
    public class SocialChatDAO : BasicDAO
    {
        public SocialChatDAO() { }
        public List<SocialChat> FindAll()
        {
            Table<SocialChat> table = GetContext().SocialChats;
            return table.ToList();
        }
        public bool Insert(SocialChat socChat)
        {
            GetContext().SocialChats.InsertOnSubmit(socChat);
            GetContext().SubmitChanges();
            return true;
        }

        public bool Update(SocialChat socChat)
        {
            GetContext().SubmitChanges();
            GetContext().Refresh(RefreshMode.OverwriteCurrentValues, socChat);
            return true;
        }
        public bool Delete(int id)
        {
            SocialChat socChat = GetContext().SocialChats.SingleOrDefault(u => u.Id == id);
            GetContext().SocialChats.DeleteOnSubmit(socChat);
            GetContext().SubmitChanges();
            return true;
        }
    }
}