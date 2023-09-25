using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using TALENTS.DAO;

namespace TALENTS.Controller
{
    public class ContactController
    {
        SocialChatDAO socialChatDAO;
        InstructionChatDAO instructionChatDAO;
        ModContactDAO modContactDAO;
        public ContactController() 
        {
            socialChatDAO = new SocialChatDAO();
            instructionChatDAO = new InstructionChatDAO();
            modContactDAO = new ModContactDAO();
        }

        public bool SaveContact(int modelId, int? socialId, int? instructionId, string email, string mobilePhone, string address, string addressCiv)
        {
            ModContact contact = modContactDAO.FindByModel(modelId).FirstOrDefault();
            if (contact == null)
            {
                contact = new ModContact();
                contact.ModelId = modelId;
                contact.SocialChatId = socialId;
                contact.InstructionChatId = instructionId;
                contact.MobilePhone = mobilePhone;
                contact.AddressCiv = addressCiv;
                contact.Address = address;  
                contact.Email = email;
                return modContactDAO.Insert(contact);
            }
            else
            {
                contact.SocialChatId = socialId;
                contact.InstructionChatId = instructionId;
                contact.MobilePhone = mobilePhone;
                contact.AddressCiv = addressCiv;
                contact.Address = address;
                contact.Email = email;
                return modContactDAO.Update(contact);
            }
        }
    }
}