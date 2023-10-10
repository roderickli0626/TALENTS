using Antlr.Runtime.Tree;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using TALENTS.DAO;
using TALENTS.Models;

namespace TALENTS.Controller
{
    public class ReviewController
    {
        ModReviewDAO modReviewDao; 
        public ReviewController() 
        { 
            modReviewDao = new ModReviewDAO();
        }

        public List<ModReviewCheck> FindByModel(int modelId)
        {
            List<ModReview> modReviews = modReviewDao.FindByModel(modelId).Where(r => r.Allowed ?? false).ToList();
            List<ModReviewCheck> result = new List<ModReviewCheck>();
            foreach (ModReview modReview in modReviews)
            {
                ModReviewCheck modReviewCheck = new ModReviewCheck(modReview);
                modReviewCheck.Content = GetContent(modReview.Rating, modReview.UserId);
                result.Add(modReviewCheck);
            }
            return result;
        }

        private string GetContent(int? rating, int? userId)
        {
            if (rating == null || rating == 0)
            {
                return "<div class=\"container\">\r\n" +
                    "<div class=\"starrating risingstar d-flex justify-content-center flex-row-reverse\">\r\n" +
                    "<input type=\"radio\" class=\"star5\" name=\"rating0" + userId + "\" value=\"5\" disabled /><label title=\"5 star\"></label>\r\n" +
                    "<input type=\"radio\" class=\"star4\" name=\"rating0" + userId + "\" value=\"4\" disabled /><label title=\"4 star\"></label>\r\n" +
                    "<input type=\"radio\" class=\"star3\" name=\"rating0" + userId + "\" value=\"3\" disabled /><label title=\"3 star\"></label>\r\n" +
                    "<input type=\"radio\" class=\"star2\" name=\"rating0" + userId + "\" value=\"2\" disabled /><label title=\"2 star\"></label>\r\n" +
                    "<input type=\"radio\" class=\"star1\" name=\"rating0" + userId + "\" value=\"1\" disabled /><label title=\"1 star\"></label>\r\n</div>\r\n" +
                    "</div>";
            }
            else if (rating == 1)
            {
                return "<div class=\"container\">\r\n" +
                    "<div class=\"starrating risingstar d-flex justify-content-center flex-row-reverse\">\r\n" +
                    "<input type=\"radio\" class=\"star5\" name=\"rating1" + userId + "\" value=\"5\" disabled /><label title=\"5 star\"></label>\r\n" +
                    "<input type=\"radio\" class=\"star4\" name=\"rating1" + userId + "\" value=\"4\" disabled /><label title=\"4 star\"></label>\r\n" +
                    "<input type=\"radio\" class=\"star3\" name=\"rating1" + userId + "\" value=\"3\" disabled /><label title=\"3 star\"></label>\r\n" +
                    "<input type=\"radio\" class=\"star2\" name=\"rating1" + userId + "\" value=\"2\" disabled /><label title=\"2 star\"></label>\r\n" +
                    "<input type=\"radio\" class=\"star1\" name=\"rating1" + userId + "\" value=\"1\" disabled checked /><label title=\"1 star\"></label>\r\n</div>\r\n" +
                    "</div>";
            }
            else if (rating == 2)
            {
                return "<div class=\"container\">\r\n" +
                    "<div class=\"starrating risingstar d-flex justify-content-center flex-row-reverse\">\r\n" +
                    "<input type=\"radio\" class=\"star5\" name=\"rating2" + userId + "\" value=\"5\" disabled /><label title=\"5 star\"></label>\r\n" +
                    "<input type=\"radio\" class=\"star4\" name=\"rating2" + userId + "\" value=\"4\" disabled /><label title=\"4 star\"></label>\r\n" +
                    "<input type=\"radio\" class=\"star3\" name=\"rating2" + userId + "\" value=\"3\" disabled /><label title=\"3 star\"></label>\r\n" +
                    "<input type=\"radio\" class=\"star2\" name=\"rating2" + userId + "\" value=\"2\" disabled checked /><label title=\"2 star\"></label>\r\n" +
                    "<input type=\"radio\" class=\"star1\" name=\"rating2" + userId + "\" value=\"1\" disabled /><label title=\"1 star\"></label>\r\n</div>\r\n" +
                    "</div>";
            }
            else if (rating == 3)
            {
                return "<div class=\"container\">\r\n" +
                    "<div class=\"starrating risingstar d-flex justify-content-center flex-row-reverse\">\r\n" +
                    "<input type=\"radio\" class=\"star5\" name=\"rating3" + userId + "\" value=\"5\" disabled /><label title=\"5 star\"></label>\r\n" +
                    "<input type=\"radio\" class=\"star4\" name=\"rating3" + userId + "\" value=\"4\" disabled /><label title=\"4 star\"></label>\r\n" +
                    "<input type=\"radio\" class=\"star3\" name=\"rating3" + userId + "\" value=\"3\" disabled checked /><label title=\"3 star\"></label>\r\n" +
                    "<input type=\"radio\" class=\"star2\" name=\"rating3" + userId + "\" value=\"2\" disabled /><label title=\"2 star\"></label>\r\n" +
                    "<input type=\"radio\" class=\"star1\" name=\"rating3" + userId + "\" value=\"1\" disabled /><label title=\"1 star\"></label>\r\n</div>\r\n" +
                    "</div>";
            }
            else if (rating == 4)
            {
                return "<div class=\"container\">\r\n" +
                    "<div class=\"starrating risingstar d-flex justify-content-center flex-row-reverse\">\r\n" +
                    "<input type=\"radio\" class=\"star5\" name=\"rating4" + userId + "\" value=\"5\" disabled /><label title=\"5 star\"></label>\r\n" +
                    "<input type=\"radio\" class=\"star4\" name=\"rating4" + userId + "\" value=\"4\" disabled checked /><label title=\"4 star\"></label>\r\n" +
                    "<input type=\"radio\" class=\"star3\" name=\"rating4" + userId + "\" value=\"3\" disabled /><label title=\"3 star\"></label>\r\n" +
                    "<input type=\"radio\" class=\"star2\" name=\"rating4" + userId + "\" value=\"2\" disabled /><label title=\"2 star\"></label>\r\n" +
                    "<input type=\"radio\" class=\"star1\" name=\"rating4" + userId + "\" value=\"1\" disabled /><label title=\"1 star\"></label>\r\n</div>\r\n" +
                    "</div>";
            }
            else
            {
                return "<div class=\"container\">\r\n" +
                    "<div class=\"starrating risingstar d-flex justify-content-center flex-row-reverse\">\r\n" +
                    "<input type=\"radio\" class=\"star5\" name=\"rating5" + userId + "\" value=\"5\" disabled checked /><label title=\"5 star\"></label>\r\n" +
                    "<input type=\"radio\" class=\"star4\" name=\"rating5" + userId + "\" value=\"4\" disabled /><label title=\"4 star\"></label>\r\n" +
                    "<input type=\"radio\" class=\"star3\" name=\"rating5" + userId + "\" value=\"3\" disabled /><label title=\"3 star\"></label>\r\n" +
                    "<input type=\"radio\" class=\"star2\" name=\"rating5" + userId + "\" value=\"2\" disabled /><label title=\"2 star\"></label>\r\n" +
                    "<input type=\"radio\" class=\"star1\" name=\"rating5" + userId + "\" value=\"1\" disabled /><label title=\"1 star\"></label>\r\n</div>\r\n" +
                    "</div>";
            }
        }

        public bool SaveReview(string phone, string comment, int rating, int modelId, int userId)
        {
            ModReview mR = new ModReviewDAO().FindByModel(modelId).Where(r => r.UserId == userId).FirstOrDefault();
            if (mR != null) return false;

            ModReview modReview = new ModReview();
            modReview.PhoneNumber = phone;
            modReview.Comment = comment;
            modReview.Rating = rating;
            modReview.ModelId = modelId;
            modReview.UserId = userId;
            modReview.Allowed = false;
            modReview.DateCreated = DateTime.Now;

            UserCreditDAO userCreditDAO = new UserCreditDAO();
            UserCredit userCredit = userCreditDAO.FindByUser(userId);
            if (userCredit != null) 
            { 
                userCredit.Credits += 50;
                userCreditDAO.Update(userCredit);
            }
            else
            {
                userCredit = new UserCredit();
                userCredit.UserId = userId;
                userCredit.Credits = 50;
                userCreditDAO.Insert(userCredit);
            }

            return modReviewDao.Insert(modReview);
        }
    }
}