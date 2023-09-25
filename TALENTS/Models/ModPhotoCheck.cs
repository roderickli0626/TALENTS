using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace TALENTS.Models
{
    public class ModPhotoCheck
    {
        ModPhoto modPhoto;
        PhotoGroup photoGroup;
        public ModPhotoCheck() { }

        public ModPhotoCheck(PhotoGroup photoGroup)
        {
            this.photoGroup = photoGroup;
            if (photoGroup == null ) { return; }
            Id = photoGroup.Id;
            Title = photoGroup.Description;
        }
        public int Id
        {
            get; set;
        }
        public string Title
        {
            get; set;
        }
        public int Length
        {
            get; set;
        }
        public List<Image> Images { get; set; }

        public class Image
        {
            public string ImageName { get; set; }
            public int ImageId { get; set; }
        }

    }
}