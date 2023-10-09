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
                modReviewCheck.Content = GetContent(modReview.Rating);
                result.Add(modReviewCheck);
            }
            return result;
        }

        private string GetContent(int? rating)
        {
            if (rating == null || rating == 0)
            {
                return "<div class=\"container\">\r\n" +
                    "<div class=\"starrating risingstar d-flex justify-content-center flex-row-reverse\">\r\n" +
                    "<input type=\"radio\" id=\"star5\" name=\"rating\" value=\"5\" disabled /><label for=\"star5\" title=\"5 star\"></label>\r\n" +
                    "<input type=\"radio\" id=\"star4\" name=\"rating\" value=\"4\" disabled /><label for=\"star4\" title=\"4 star\"></label>\r\n" +
                    "<input type=\"radio\" id=\"star3\" name=\"rating\" value=\"3\" disabled /><label for=\"star3\" title=\"3 star\"></label>\r\n" +
                    "<input type=\"radio\" id=\"star2\" name=\"rating\" value=\"2\" disabled /><label for=\"star2\" title=\"2 star\"></label>\r\n" +
                    "<input type=\"radio\" id=\"star1\" name=\"rating\" value=\"1\" disabled /><label for=\"star1\" title=\"1 star\"></label>\r\n</div>\r\n                                                            " +
                    "</div>";
            }
            else if (rating == 1)
            {
                return "<div class=\"container\">\r\n" +
                    "<div class=\"starrating risingstar d-flex justify-content-center flex-row-reverse\">\r\n" +
                    "<input type=\"radio\" id=\"star5\" name=\"rating\" value=\"5\" disabled /><label for=\"star5\" title=\"5 star\"></label>\r\n" +
                    "<input type=\"radio\" id=\"star4\" name=\"rating\" value=\"4\" disabled /><label for=\"star4\" title=\"4 star\"></label>\r\n" +
                    "<input type=\"radio\" id=\"star3\" name=\"rating\" value=\"3\" disabled /><label for=\"star3\" title=\"3 star\"></label>\r\n" +
                    "<input type=\"radio\" id=\"star2\" name=\"rating\" value=\"2\" disabled /><label for=\"star2\" title=\"2 star\"></label>\r\n" +
                    "<input type=\"radio\" id=\"star1\" name=\"rating\" value=\"1\" disabled checked /><label for=\"star1\" title=\"1 star\"></label>\r\n</div>\r\n                                                            " +
                    "</div>";
            }
            else if (rating == 2)
            {
                return "<div class=\"container\">\r\n" +
                    "<div class=\"starrating risingstar d-flex justify-content-center flex-row-reverse\">\r\n" +
                    "<input type=\"radio\" id=\"star5\" name=\"rating\" value=\"5\" disabled /><label for=\"star5\" title=\"5 star\"></label>\r\n" +
                    "<input type=\"radio\" id=\"star4\" name=\"rating\" value=\"4\" disabled /><label for=\"star4\" title=\"4 star\"></label>\r\n" +
                    "<input type=\"radio\" id=\"star3\" name=\"rating\" value=\"3\" disabled /><label for=\"star3\" title=\"3 star\"></label>\r\n" +
                    "<input type=\"radio\" id=\"star2\" name=\"rating\" value=\"2\" disabled checked /><label for=\"star2\" title=\"2 star\"></label>\r\n" +
                    "<input type=\"radio\" id=\"star1\" name=\"rating\" value=\"1\" disabled /><label for=\"star1\" title=\"1 star\"></label>\r\n</div>\r\n                                                            " +
                    "</div>";
            }
            else if (rating == 3)
            {
                return "<div class=\"container\">\r\n" +
                    "<div class=\"starrating risingstar d-flex justify-content-center flex-row-reverse\">\r\n" +
                    "<input type=\"radio\" id=\"star5\" name=\"rating\" value=\"5\" disabled /><label for=\"star5\" title=\"5 star\"></label>\r\n" +
                    "<input type=\"radio\" id=\"star4\" name=\"rating\" value=\"4\" disabled /><label for=\"star4\" title=\"4 star\"></label>\r\n" +
                    "<input type=\"radio\" id=\"star3\" name=\"rating\" value=\"3\" disabled checked /><label for=\"star3\" title=\"3 star\"></label>\r\n" +
                    "<input type=\"radio\" id=\"star2\" name=\"rating\" value=\"2\" disabled /><label for=\"star2\" title=\"2 star\"></label>\r\n" +
                    "<input type=\"radio\" id=\"star1\" name=\"rating\" value=\"1\" disabled /><label for=\"star1\" title=\"1 star\"></label>\r\n</div>\r\n                                                            " +
                    "</div>";
            }
            else if (rating == 4)
            {
                return "<div class=\"container\">\r\n" +
                    "<div class=\"starrating risingstar d-flex justify-content-center flex-row-reverse\">\r\n" +
                    "<input type=\"radio\" id=\"star5\" name=\"rating\" value=\"5\" disabled /><label for=\"star5\" title=\"5 star\"></label>\r\n" +
                    "<input type=\"radio\" id=\"star4\" name=\"rating\" value=\"4\" disabled checked /><label for=\"star4\" title=\"4 star\"></label>\r\n" +
                    "<input type=\"radio\" id=\"star3\" name=\"rating\" value=\"3\" disabled /><label for=\"star3\" title=\"3 star\"></label>\r\n" +
                    "<input type=\"radio\" id=\"star2\" name=\"rating\" value=\"2\" disabled /><label for=\"star2\" title=\"2 star\"></label>\r\n" +
                    "<input type=\"radio\" id=\"star1\" name=\"rating\" value=\"1\" disabled /><label for=\"star1\" title=\"1 star\"></label>\r\n</div>\r\n                                                            " +
                    "</div>";
            }
            else
            {
                return "<div class=\"container\">\r\n" +
                    "<div class=\"starrating risingstar d-flex justify-content-center flex-row-reverse\">\r\n" +
                    "<input type=\"radio\" id=\"star5\" name=\"rating\" value=\"5\" disabled checked /><label for=\"star5\" title=\"5 star\"></label>\r\n" +
                    "<input type=\"radio\" id=\"star4\" name=\"rating\" value=\"4\" disabled /><label for=\"star4\" title=\"4 star\"></label>\r\n" +
                    "<input type=\"radio\" id=\"star3\" name=\"rating\" value=\"3\" disabled /><label for=\"star3\" title=\"3 star\"></label>\r\n" +
                    "<input type=\"radio\" id=\"star2\" name=\"rating\" value=\"2\" disabled /><label for=\"star2\" title=\"2 star\"></label>\r\n" +
                    "<input type=\"radio\" id=\"star1\" name=\"rating\" value=\"1\" disabled /><label for=\"star1\" title=\"1 star\"></label>\r\n</div>\r\n                                                            " +
                    "</div>";
            }
        }

    }
}