using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace TALENTS.Models
{
    public class ModReviewCheck
    {
        private ModReview modReview;
        public ModReviewCheck() { }
        public ModReviewCheck(ModReview modReview) 
        { 
            this.modReview = modReview;
            if (modReview == null) { return; }
            Id = modReview.Id;
            User = modReview.Model.Username;
            Comment = modReview.Comment;
            Rating = modReview.Rating ?? 0;
        }

        public int Id
        {
            get; set;
        }

        public string Comment
        {
            get; set;
        }
        public string User
        {
            get; set;
        }
        public int Rating
        {
            get; set;
        }
        public string Content
        {
            get; set;
        }
    }
}