using System;
using System.Collections.Generic;
using System.Data.Linq;
using System.Linq;
using System.Web;

namespace TALENTS.DAO
{
    public class InstructionChatDAO : BasicDAO
    {
        public InstructionChatDAO() { }

        public List<InstructionChat> FindAll()
        {
            Table<InstructionChat> table = GetContext().InstructionChats;
            return table.ToList();
        }
        public bool Insert(InstructionChat InChat)
        {
            GetContext().InstructionChats.InsertOnSubmit(InChat);
            GetContext().SubmitChanges();
            return true;
        }

        public bool Update(InstructionChat InChat)
        {
            GetContext().SubmitChanges();
            GetContext().Refresh(RefreshMode.OverwriteCurrentValues, InChat);
            return true;
        }
        public bool Delete(int id)
        {
            InstructionChat InChat = GetContext().InstructionChats.SingleOrDefault(u => u.Id == id);
            GetContext().InstructionChats.DeleteOnSubmit(InChat);
            GetContext().SubmitChanges();
            return true;
        }
    }
}