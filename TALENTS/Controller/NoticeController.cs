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
    }
}