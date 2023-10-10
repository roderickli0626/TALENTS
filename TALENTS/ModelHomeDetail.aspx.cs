using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TALENTS.Controller;
using TALENTS.DAO;
using TALENTS.Models;
using TALENTS.Util;

namespace TALENTS
{
    public partial class ModelHomeDetail : System.Web.UI.Page
    {
        private int modelId;
        private Model model;
        protected void Page_Load(object sender, EventArgs e)
        {
            modelId = ParseUtil.TryParseInt(Request.Params["modelId"]) ?? 0;
            model = new ModelDAO().FindById(modelId);

            if (!IsPostBack)
            {
                LoadModelInfo1();
                if (model != null)
                {
                    LoadModelInfo2();
                }
            }
        }

        private void LoadModelInfo1()
        {
            ModelCheck modelInfo = new ModelController().GetDashboardModelInfo(modelId);

            ModelSurname.InnerText = modelInfo.Name;
            ModelHeight.InnerText = modelInfo.Height.ToString();
            ModelWeight.InnerText = modelInfo.Weight.ToString();
            ModelEth.InnerText = modelInfo.Nationality;
            ModelResid.InnerText = modelInfo.CityResidence;
            ModelEye.InnerText = modelInfo.Eye;
            ModelHairColor.InnerText = modelInfo.HairColor;

            DefaultPhotoRepeater1.DataSource = modelInfo.ImageList;
            DefaultPhotoRepeater1.DataBind();
            DefaultPhotoRepeater2.DataSource = modelInfo.ImageList;
            DefaultPhotoRepeater2.DataBind();
        }
        private void LoadModelInfo2()
        {
            // Biography Tab
            ModBiography modBiography = new ModelBiographyDAO().FindByModelId(modelId);
            if (modBiography == null) { return; }
            ModelName.InnerText = modBiography.Name;
            ModelSlogan.InnerText = modBiography.Slogan;
            ModelAge.InnerText = modBiography.Age.ToString();
            ModelSex.InnerText = modBiography.Sex == "F" ? "Female" : "Male";
            ModelEthnicity.InnerText = modBiography.Ethnicity?.Description;
            ModelNationality.InnerText = modBiography.Nationality?.Description;
            ModelResidence.InnerText = modBiography.City?.Description;
            ModelHairColor.InnerText = modBiography.HairColor?.Description;
            ModelHairLength.InnerText = modBiography.HairLength?.Description;
            ModelEye.InnerText = modBiography.Eye?.Description;
            ModelHeight.InnerText = modBiography.Height.ToString();
            ModelWeight.InnerText = modBiography.Weight.ToString();
            ModelDress.InnerText = modBiography.DressSize?.Description;
            ModelShoes.InnerText = modBiography.Shoes.ToString();
            ModelBust.InnerText = modBiography.Bust;
            ModelWaist.InnerText = modBiography.Waist;
            ModelHaunch.InnerText = modBiography.Haunch;
            ModelBreast.InnerText = modBiography.BreastSize?.Description;
            ModelSmoker.InnerText = modBiography.Smoker == "N" ? "Not" : (modBiography.Smoker == "Y" ? "Yes" : "Sometimes");
            ModelTattoos.InnerText = modBiography.Tattoos == "N" ? "No" : "Yes";
            ModelDrinker.InnerText = modBiography.Drinker == "N" ? "Not" : (modBiography.Drinker == "Y" ? "Yes" : "Sometimes");
            ModelPiercing.InnerText = modBiography.Piercing == "N" ? "No" : "Yes";
            ModelPeculiarities.InnerText = modBiography.Peculiarities;

            // About Me Tab
            ModelAbout.InnerText = modBiography.AboutMe;

            // Language Tab
            List<ModLanguageCheck> modLanguages = new LanguageController().FindByModel(model.Id);
            LanguageRepeater.DataSource = modLanguages;
            LanguageRepeater.DataBind();

            // Services Tab
            List<ModServiceCheck> modServiceChecks = new ServiceController().FindByModel(model.Id);
            RepeaterModServices.DataSource = modServiceChecks;
            RepeaterModServices.DataBind();

            // WorkCity Tab
            List<ModWorkCityCheck> modWorkCityChecks = new CityController().FindByModel(model.Id);
            RepeaterModWorkCity.DataSource = modWorkCityChecks;
            RepeaterModWorkCity.DataBind();

            List<ModIncallCheck> modIncallChecks = new InOutCallPlaceController().FindIncallPlaceByModel(model.Id);
            List<ModOutcallCheck> modOutcallChecks = new InOutCallPlaceController().FindOutcallPlaceByModel(model.Id);
            RepeaterModIncall.DataSource = modIncallChecks;
            RepeaterModIncall.DataBind();
            RepeaterModOutcall.DataSource = modOutcallChecks;
            RepeaterModOutcall.DataBind();

            // WorkDayHour Tab
            List<ModWorkDayHourCheck> modWorkDayHourChecks = new WorkDayHourController().FindByModel(model.Id);
            RepeaterModWorkHour.DataSource = modWorkDayHourChecks;
            RepeaterModWorkHour.DataBind();

            // Rate Tab
            List<ModIncallRateCheck> modIncallRateChecks = new InOutCallPlaceController().FindIncallRateByModel(model.Id);
            RepeaterModIncallRate.DataSource = modIncallRateChecks;
            RepeaterModIncallRate.DataBind();
            List<ModOutcallRateCheck> modOutcallRateChecks = new InOutCallPlaceController().FindOutcallRateByModel(model.Id);
            RepeaterModOutcallRate.DataSource = modOutcallRateChecks;
            RepeaterModOutcallRate.DataBind();

            // Tour Tab
            List<ModTourCheck> modTours = new TourController().FindByModel(model.Id);
            RepeaterTour.DataSource = modTours;
            RepeaterTour.DataBind();
                        
            // Natural Photo Tab
            List<ModNaturalPhoto> naturalPhotos = new ModNaturalPhotoDAO().FindByModel(model.Id);
            RepeaterNautralPhoto.DataSource = naturalPhotos;
            RepeaterNautralPhoto.DataBind();

            // Photo Tab
            List<ModPhoto> Photos = new ModPhotoDAO().FindByModel(model.Id);
            RepeaterPhotos.DataSource = Photos;
            RepeaterPhotos.DataBind();

            // Video Tab
            List<ModVideo> videos = new ModVideoDAO().FindByModel(model.Id);
            RepeaterVideo.DataSource = videos;
            RepeaterVideo.DataBind();

            // Review Tab
            List<ModReviewCheck> modReviews = new ReviewController().FindByModel(model.Id);
            RepeaterReview.DataSource = modReviews;
            RepeaterReview.DataBind();

            // Contact Tab
            ModContact modContact = new ModContactDAO().FindByModel(model.Id).FirstOrDefault();
            if (modContact == null) return;
            ModelSocialChat.InnerText = modContact.SocialChat?.Description;
            ModelInstructionChat.InnerText = modContact.InstructionChat?.Description;
            ModelEmail.InnerText = modContact.Email;
            ModelPhone.InnerText = modContact.MobilePhone;
            ModelAddress.InnerText = modContact.Address;
            ModelAddressCiv.InnerText = modContact.AddressCiv;
        }
    }
}