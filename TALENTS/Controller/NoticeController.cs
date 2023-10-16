using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using TALENTS.DAO;
using TALENTS.Models;

namespace TALENTS.Controller
{
    public class NoticeController
    {
        UserNoticeDAO userNoticeDAO;

        public NoticeController() 
        { 
            userNoticeDAO = new UserNoticeDAO();
        }

        public SearchResult SearchNotices(int start, int length, string search)
        {
            SearchResult result = new SearchResult();
            IEnumerable<UserNotice> list = userNoticeDAO.FindAll().Where(n => n.Title.Contains(search) && (n.Allowed ?? false));
            result.TotalCount = list.Count();
            list = list.Skip(start).Take(length);

            List<object> checks = new List<object>();
            foreach (UserNotice md in list)
            {
                UserNoticeCheck modelCheck = new UserNoticeCheck(md);
                checks.Add(modelCheck);
            }
            result.ResultList = checks;

            return result;
        }

        public SearchResult SearchUserNotices(int start, int length, string search, int userId)
        {
            SearchResult result = new SearchResult();
            IEnumerable<UserNotice> list = userNoticeDAO.FindAll().Where(n => n.Title.Contains(search) && (n.UserId == userId));
            result.TotalCount = list.Count();
            list = list.Skip(start).Take(length);

            List<object> checks = new List<object>();
            foreach (UserNotice md in list)
            {
                UserNoticeCheck modelCheck = new UserNoticeCheck(md);
                checks.Add(modelCheck);
            }
            result.ResultList = checks;

            return result;
        }

        public SearchResult SearchAdminNotices(int start, int length, string search)
        {
            SearchResult result = new SearchResult();
            IEnumerable<UserNotice> list = userNoticeDAO.FindAll().Where(n => n.Title.Contains(search));
            result.TotalCount = list.Count();
            list = list.Skip(start).Take(length);

            List<object> checks = new List<object>();
            foreach (UserNotice md in list)
            {
                UserNoticeCheck modelCheck = new UserNoticeCheck(md);
                checks.Add(modelCheck);
            }
            result.ResultList = checks;

            return result;
        }

        public bool SaveNotice(string title, string message, string contact, string city, DateTime? sdate, DateTime? edate, int userId, int? noticeId, bool allowed)
        {
            if (noticeId == null)
            {
                UserNotice userNotice = new UserNotice();
                userNotice.Title = title;
                userNotice.Message = message;
                userNotice.Contact = contact;
                userNotice.City = city;
                userNotice.FromDate = sdate;
                userNotice.ToDate = edate;
                userNotice.UserId = userId;
                userNotice.Allowed = allowed;

                return userNoticeDAO.Insert(userNotice);
            }
            else
            {
                UserNotice userNotice = userNoticeDAO.FindById(noticeId ?? 0);
                if (userNotice == null) { return false; }
                userNotice.Title = title;
                userNotice.Message= message;
                userNotice.Contact = contact;
                userNotice.City = city;
                userNotice.FromDate = sdate;
                userNotice.ToDate = edate;
                //userNotice.UserId = userId;
                userNotice.Allowed = allowed;

                return userNoticeDAO.Update(userNotice);
            }
        }
    }
}