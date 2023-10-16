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
            UserId = modReview.UserId ?? 0;
            ModelId = modReview.ModelId ?? 0;
            User = modReview.Model.Username;
            Model = modReview.Model1.Username;
            Comment = modReview.Comment;
            Phone = modReview.PhoneNumber;
            Rating = modReview.Rating ?? 0;
            Allowed = modReview.Allowed ?? false;
            ReviewDate = modReview.DateCreated?.ToString("dd/MM/yyyy");
        }

        public int Id
        {
            get; set;
        }
        public int UserId
        {
            get; set;
        }
        public int ModelId
        {
            get; set;
        }
        public string Phone
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
        public string Model
        {
            get; set;
        }
        public int Rating
        {
            get; set;
        }
        public bool Allowed
        {
            get; set;
        }
        public string ReviewDate
        {
            get; set;
        }
        public string Content
        {
            get; set;
        }
    }
}