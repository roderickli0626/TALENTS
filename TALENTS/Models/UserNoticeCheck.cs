using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace TALENTS.Models
{
    public class UserNoticeCheck
    {
        UserNotice userNotice;
        public UserNoticeCheck() { }
        public UserNoticeCheck(UserNotice userNotice) 
        { 
            this.userNotice = userNotice;
            if (userNotice == null) return;
            Id = userNotice.Id;
            Username = userNotice.Model.Username;
            UserId = userNotice.UserId ?? 0;
            Title = userNotice.Title;
            Message = userNotice.Message;
            Contact = userNotice.Contact;
            From = userNotice.FromDate?.ToString("dd/MM/yyyy HH:mm");
            To = userNotice.ToDate?.ToString("dd/MM/yyyy HH:mm");
            if (DateTime.Now < userNotice.FromDate) State = 1;
            else if (userNotice.ToDate < DateTime.Now) State = 2;
            else State = 3;
            Allowed = userNotice.Allowed ?? false;
            City = userNotice.City;
        }
        public int Id
        {
            get; set;
        }
        public int UserId
        {
            get; set;
        }
        public string Username
        {
            get; set;
        }
        public string Title
        {
            get; set;
        }
        public string Message
        {
            get; set;
        }
        public string Contact
        {
            get; set;
        }
        public int State
        {
            get; set;
        }
        public bool Allowed
        {
            get; set;
        }
        public string From { get; set; }
        public string To { get; set; }
        public string City { get; set; }
    }
}