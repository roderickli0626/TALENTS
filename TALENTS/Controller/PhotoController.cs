using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using TALENTS.DAO;
using TALENTS.Models;

namespace TALENTS.Controller
{
    public class PhotoController
    {
        private ModPhotoDAO modPhotoDAO;
        private PhotoGroupDAO photoGroupDAO;
        private ModNaturalPhotoDAO modNaturalPhotoDAO;
        public PhotoController() 
        { 
            modPhotoDAO = new ModPhotoDAO();
            photoGroupDAO = new PhotoGroupDAO();
            modNaturalPhotoDAO = new ModNaturalPhotoDAO();
        }

        public SearchResult SearchModPhotos(int start, int length, int modelId)
        {
            SearchResult result = new SearchResult();
            IQueryable<PhotoGroup> list = photoGroupDAO.Search().OrderBy(l => l.Id);
            result.TotalCount = list.Count();
            list = list.Skip(start).Take(length);

            List<object> checks = new List<object>();
            foreach (PhotoGroup fg in list)
            {
                List<ModPhoto> photosForGroup = modPhotoDAO.FindByModelAndGroup(modelId, fg.Id);
                List<ModPhotoCheck.Image> images = photosForGroup.Select(p => new ModPhotoCheck.Image
                {
                    ImageId = p.Id,
                    ImageName = p.Image
                }).ToList();
                ModPhotoCheck modPhotoCheck = new ModPhotoCheck(fg);
                modPhotoCheck.Length = images.Count;
                modPhotoCheck.Images = images;
                checks.Add(modPhotoCheck);
            }
            result.ResultList = checks;

            return result;
        }

        public bool SaveModPhoto(int modelId, int groupdId, string fileName)
        {
            ModPhoto modPhoto = new ModPhoto();
            modPhoto.ModelId = modelId;
            modPhoto.GroupId = groupdId;
            modPhoto.Image = fileName;
            return modPhotoDAO.Insert(modPhoto);
        }

    }
}