using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using TALENTS.DAO;
using TALENTS.Models;

namespace TALENTS.Controller
{
    public class ModelController
    {
        ModelDAO modelDao;
        ModelBiographyDAO biographyDao;
        ModPhotoDAO modPhotoDao;

        public ModelController()
        {
            modelDao = new ModelDAO();
            biographyDao = new ModelBiographyDAO();
            modPhotoDao = new ModPhotoDAO();
        }

        public List<ModelCheck> SearchDashboardModels(int cityId)
        {
            List<ModBiography> mods = biographyDao.FindByCity(cityId);
            List<ModelCheck> modelChecks = new List<ModelCheck>();
            int defaultPhotoGroupID = new PhotoGroupDAO().FindAll().OrderBy(p => p.Id).FirstOrDefault().Id;
            foreach (ModBiography modBiography in mods)
            {
                ModelCheck modelCheck = new ModelCheck(modBiography);
                List<ModPhoto> photoList = modPhotoDao.FindByModelAndGroup(modBiography.ModelId, defaultPhotoGroupID);
                if (photoList.Count() == 0) continue;
                modelCheck.Image = photoList.FirstOrDefault().Image;
                modelChecks.Add(modelCheck);
            }

            return modelChecks;
        }

        public ModelCheck GetDashboardModelInfo(int modelId)
        {
            ModBiography modBiography = biographyDao.FindByModelId(modelId);
            ModelCheck modelCheck = new ModelCheck(modBiography);
            int defaultPhotoGroupID = new PhotoGroupDAO().FindAll().OrderBy(p => p.Id).FirstOrDefault().Id;
            modelCheck.ImageList = modPhotoDao.FindByModelAndGroup(modelId, defaultPhotoGroupID).ToList();
            return modelCheck;
        }
    }
}