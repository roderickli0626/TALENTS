using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TALENTS.Controller;
using TALENTS.DAO;
using TALENTS.Models;
using TALENTS.Util;

namespace TALENTS
{
    public partial class AdminModelInformation : System.Web.UI.Page
    {
        Model model;
        LoginController loginSystem = new LoginController();
        ModelController modelController = new ModelController();
        protected void Page_Load(object sender, EventArgs e)
        {
            Model admin = loginSystem.GetCurrentUserAccount();
            if (!loginSystem.IsSuperAdminLoggedIn() && (admin == null || !loginSystem.IsAdminLoggedIn()))
            {
                Response.Redirect("~/Login.aspx");
                return;
            }

            int modelId = ParseUtil.TryParseInt(Request.Params["id"]) ?? 0;
            if (modelId != 0)
            {
                model = new ModelDAO().FindById(modelId);
                HfModelID.Value = modelId.ToString();
            }


            if (!IsPostBack)
            {
                ModelName.InnerText = model.Username;
                LoadBioInfo();
                LoadAboutMe();
                LoadLanguage();
                LoadService();
                LoadWorkCities();
                LoadWorkDayHour();
                LoadModRate();
                LoadContactInfo();
                LoadVideos();
                LoadNaturalPhotos();
                LoadTours();
            }
        }
        // Bio Tab
        private void LoadBioInfo()
        {
            //Load Sex
            ComboSex.Items.Clear();
            ComboSex.Items.Add(new ListItem("[Unassigned]", "0"));
            ComboSex.Items.Add(new ListItem("Male", "M"));
            ComboSex.Items.Add(new ListItem("Female", "F"));
            //Load Ethnicity
            List<Ethnicity> EthList = new EthnicityDAO().FindAll();
            ControlUtil.DataBind(ComboEth, EthList, "Id", "Description", "0", "[Unassigned]");
            //Load Nationality
            List<Nationality> NationList = new NationalityDAO().FindAll();
            ControlUtil.DataBind(ComboNation, NationList, "Id", "Description", "0", "[Unassigned]");
            //Load Residence
            List<City> CityList = new CityDAO().FindAll();
            ControlUtil.DataBind(ComboRes, CityList, "Id", "Description", "0", "[Unassigned]");
            //Load HairColor
            List<HairColor> HColorList = new HairColorDAO().FindAll();
            ControlUtil.DataBind(ComboHairColor, HColorList, "Id", "Description", "0", "[Unassigned]");
            //Load HairLength
            List<HairLength> HLengList = new HairLengthDAO().FindAll();
            ControlUtil.DataBind(ComboHairLeng, HLengList, "Id", "Description", "0", "[Unassigned]");
            //Load Eye
            List<Eye> EyeList = new EyeDAO().FindAll();
            ControlUtil.DataBind(ComboEye, EyeList, "Id", "Description", "0", "[Unassigned]");
            //Load Dress Size
            List<DressSize> DressList = new DressSizeDAO().FindAll();
            ControlUtil.DataBind(ComboDress, DressList, "Id", "Description", "0", "");
            //Load Breast Size
            List<BreastSize> BreastList = new BreastSizeDAO().FindAll();
            ControlUtil.DataBind(ComboBreast, BreastList, "Id", "Description", "0", "");
            //Load Smoker
            ComboSmoker.Items.Clear();
            ComboSmoker.Items.Add(new ListItem("[Unassigned]", "0"));
            ComboSmoker.Items.Add(new ListItem("Yes", "Y"));
            ComboSmoker.Items.Add(new ListItem("Not", "N"));
            ComboSmoker.Items.Add(new ListItem("Sometimes", "S"));
            //Load Drinker
            ComboDrink.Items.Clear();
            ComboDrink.Items.Add(new ListItem("[Unassigned]", "0"));
            ComboDrink.Items.Add(new ListItem("Yes", "Y"));
            ComboDrink.Items.Add(new ListItem("Not", "N"));
            ComboDrink.Items.Add(new ListItem("Sometimes", "S"));
            //Load Tattoos
            ComboTattoos.Items.Clear();
            ComboTattoos.Items.Add(new ListItem("[Unassigned]", "0"));
            ComboTattoos.Items.Add(new ListItem("Yes", "Y"));
            ComboTattoos.Items.Add(new ListItem("No", "N"));
            //Load Piercing
            ComboPiercing.Items.Clear();
            ComboPiercing.Items.Add(new ListItem("[Unassigned]", "0"));
            ComboPiercing.Items.Add(new ListItem("Yes", "Y"));
            ComboPiercing.Items.Add(new ListItem("No", "N"));

            //Load Model Info
            ModBiography modBiography = new ModelBiographyDAO().FindByModelId(model.Id);
            if (modBiography == null) return;
            TxtName.Text = modBiography.Name;
            TxtSlogan.Text = modBiography.Slogan;
            TxtAge.Text = modBiography.Age.ToString();
            ControlUtil.SelectValue(ComboSex, modBiography.Sex);
            ControlUtil.SelectValue(ComboEth, modBiography.EthnicityId);
            ControlUtil.SelectValue(ComboNation, modBiography.NationalityId);
            ControlUtil.SelectValue(ComboRes, modBiography.CityResidenceId);
            ControlUtil.SelectValue(ComboHairColor, modBiography.HairColorId);
            ControlUtil.SelectValue(ComboHairLeng, modBiography.HairLenghId);
            ControlUtil.SelectValue(ComboEye, modBiography.EyeId);
            TxtHeight.Text = modBiography.Height.ToString();
            TxtWeight.Text = modBiography.Weight.ToString();
            TxtShoes.Text = modBiography.Shoes.ToString();
            ControlUtil.SelectValue(ComboDress, modBiography.DressSizeId);
            TxtBust.Text = modBiography.Bust;
            TxtHaunch.Text = modBiography.Haunch;
            TxtWaist.Text = modBiography.Waist;
            TxtPeculiarities.Text = modBiography.Peculiarities;
            ControlUtil.SelectValue(ComboBreast, modBiography.BreastSizeId);
            ControlUtil.SelectValue(ComboDrink, modBiography.Drinker);
            ControlUtil.SelectValue(ComboTattoos, modBiography.Tattoos);
            ControlUtil.SelectValue(ComboPiercing, modBiography.Piercing);
            ControlUtil.SelectValue(ComboSmoker, modBiography.Smoker);
        }
        protected void BtnBio_Click(object sender, EventArgs e)
        {
            bool success = true;
            string name = TxtName.Text;
            if (string.IsNullOrEmpty(name))
            {
                SuccessAlarm.Visible = false;
                ServerValidatorBio1.IsValid = false;
                return;
            }
            string slogan = TxtSlogan.Text;
            int? age = ParseUtil.TryParseInt(TxtAge.Text);
            string sex = ComboSex.SelectedValue;
            int? ethnicityId = ControlUtil.GetSelectedValue(ComboEth);
            int? nationId = ControlUtil.GetSelectedValue(ComboNation);
            int? resId = ControlUtil.GetSelectedValue(ComboRes);
            int? hairColorId = ControlUtil.GetSelectedValue(ComboHairColor);
            int? hairLengId = ControlUtil.GetSelectedValue(ComboHairLeng);
            int? eyeId = ControlUtil.GetSelectedValue(ComboEye);
            double? height = ParseUtil.TryParseDouble(TxtHeight.Text);
            double? weight = ParseUtil.TryParseDouble(TxtWeight.Text);
            int? dressId = ControlUtil.GetSelectedValue(ComboDress);
            int? shoes = ParseUtil.TryParseInt(TxtShoes.Text);
            string bust = TxtBust.Text;
            string waist = TxtWaist.Text;
            string haunch = TxtHaunch.Text;
            int? breastId = ControlUtil.GetSelectedValue(ComboBreast);
            string smoker = ComboSmoker.SelectedValue;
            string tattoos = ComboTattoos.SelectedValue;
            string drinker = ComboDrink.SelectedValue;
            string piercing = ComboPiercing.SelectedValue;
            string peculiarities = TxtPeculiarities.Text;

            success = modelController.SaveModelBio(model.Id, name, slogan, age, sex, ethnicityId, nationId, resId, hairColorId, hairLengId, eyeId,
                height, weight, dressId, shoes, bust, waist, haunch, breastId, smoker, tattoos, drinker, piercing, peculiarities);
            if (!success)
            {
                SuccessAlarm.Visible = false;
                ServerValidatorBio2.IsValid = false;
                return;
            }

            SuccessAlarm.Visible = true;
        }
        // About Me Tab
        private void LoadAboutMe()
        {
            ModBiography modBiography = new ModelBiographyDAO().FindByModelId(model.Id);
            if (modBiography == null) { return; }
            TxtItaly.InnerText = modBiography.AboutMe;
        }
        protected void BtnAbout_Click(object sender, EventArgs e)
        {
            bool success = true;
            string aboutMe = TxtItaly.InnerText;
            if (string.IsNullOrEmpty(aboutMe))
            {
                SuccessAlarmAbout.Visible = false;
                ServerValidatorAbout1.IsValid = false;
                return;
            }
            success = modelController.SaveAboutMe(model.Id, aboutMe);
            if (!success)
            {
                SuccessAlarmAbout.Visible = false;
                ServerValidatorAbout2.IsValid = false;
                return;
            }
            SuccessAlarmAbout.Visible = true;
        }
        // Language Tab
        private void LoadLanguage()
        {
            // Load Language
            List<Language> languages = new LanguageDAO().FindAll();
            ControlUtil.DataBind(ComboLang, languages, "Id", "Description", "0", "[Unassigned]");
            // Load Level
            List<SkillLevel> levels = new SkillLevelDAO().FindAll();
            ControlUtil.DataBind(ComboLevel, levels, "Id", "Description", "0", "[Unassigned]");
            // Load Model Languages
            List<ModLanguageCheck> modLanguages = new LanguageController().FindByModel(model.Id);
            LanguageRepeater.DataSource = modLanguages;
            LanguageRepeater.DataBind();
        }
        protected void BtnLang_Click(object sender, EventArgs e)
        {
            bool success = true;
            int? lanId = ControlUtil.GetSelectedValue(ComboLang);
            int? levelId = ControlUtil.GetSelectedValue(ComboLevel);
            if (lanId == null || levelId == null)
            {
                SuccessAlarmLang.Visible = false;
                ServerValidatorLang1.IsValid = false;
                return;
            }
            success = new LanguageController().SaveModLang(model.Id, lanId, levelId);
            if (!success)
            {
                SuccessAlarmLang.Visible = false;
                ServerValidatorLang2.IsValid = false;
                return;
            }
            SuccessAlarmLang.Visible = true;
            LoadLanguage();
        }
        protected void LanguageRepeater_ItemCreated(object sender, RepeaterItemEventArgs e)
        {
            ScriptManager scriptMan = ScriptManager.GetCurrent(this);
            LinkButton btn = e.Item.FindControl("DeleteButton") as LinkButton;
            if (btn != null)
            {
                btn.Click += LangDelete_Click;
                scriptMan.RegisterAsyncPostBackControl(btn);
            }
        }
        protected void LangDelete_Click(object sender, EventArgs e)
        {
            int id = int.Parse(((LinkButton)sender).CommandArgument.ToString());
            bool result = new ModLanguageDAO().Delete(id);
            if (result)
            {
                LoadLanguage();
            }
        }
        // Service Tab
        private void LoadService()
        {
            // Load Service Group
            List<ServiceGroup> serviceGroups = new ServiceGroupDAO().FindAll();
            ControlUtil.DataBind(ComboServiceGroup, serviceGroups, "Id", "Description", "0", "[Unassigned]");
            // Load Model Services
            List<ModServiceCheck> modServiceChecks = new ServiceController().FindByModel(model.Id);
            RepeaterModServices.DataSource = modServiceChecks;
            RepeaterModServices.DataBind();
        }
        protected void RepeaterModServices_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "Delete")
            {
                int id = int.Parse(e.CommandArgument.ToString());
                bool result = new ModServiceDAO().Delete(id);
                if (result) LoadService();
            }
        }
        protected void RepeaterModServices_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            ScriptManager scriptMan = ScriptManager.GetCurrent(this);
            LinkButton btn = e.Item.FindControl("DeleteButton") as LinkButton;
            if (btn != null)
            {
                scriptMan.RegisterAsyncPostBackControl(btn);
            }
        }
        protected void ComboServiceGroup_SelectedIndexChanged(object sender, EventArgs e)
        {
            // Load Serivces
            int groupId = ControlUtil.GetSelectedValue(ComboServiceGroup) ?? 0;
            List<Service> services = new ServiceDAO().FindByGroup(groupId);
            ControlUtil.DataBind(ComboService, services, "Id", "Description", "0", "[Unassigned]");
        }
        protected void BtnService_Click(object sender, EventArgs e)
        {
            bool success = true;
            int? serviceId = ControlUtil.GetSelectedValue(ComboService);
            if (serviceId == null)
            {
                SuccessAlarmService.Visible = false;
                servervalidatorService1.IsValid = false;
                return;
            }
            double? amount = ParseUtil.TryParseDouble(TxtServiceAmount.Text);
            success = new ServiceController().SaveService(model.Id, serviceId, amount);
            if (!success)
            {
                SuccessAlarmService.Visible = false;
                servervalidatorService2.IsValid = false;
                return;
            }
            SuccessAlarmService.Visible = true;
            LoadService();
        }
        // WorkCity Tab / work_city
        private void LoadWorkCities()
        {
            // Load Work Cities
            List<City> cities = new CityDAO().FindAll();
            ControlUtil.DataBind(ComboWorkCity, cities, "Id", "Description", "0", "[Unassigned]");
            // Load Model Work Cities
            List<ModWorkCityCheck> modWorkCityChecks = new CityController().FindByModel(model.Id);
            RepeaterModWorkCity.DataSource = modWorkCityChecks;
            RepeaterModWorkCity.DataBind();
            // Load Incall / Outcall Places
            List<IncallPlace> incallPlaces = new IncallPlaceDAO().FindAll();
            ControlUtil.DataBind(ComboIncall, incallPlaces, "Id", "Description", "0", "[Unassigned]");
            List<OutcallPlace> outcallPlaces = new OutcallPlaceDAO().FindAll();
            ControlUtil.DataBind(ComboOutcall, outcallPlaces, "Id", "Description", "0", "[Unassigned]");
            // Load Model Incall / Outcall Places
            List<ModIncallCheck> modIncallChecks = new InOutCallPlaceController().FindIncallPlaceByModel(model.Id);
            List<ModOutcallCheck> modOutcallChecks = new InOutCallPlaceController().FindOutcallPlaceByModel(model.Id);
            RepeaterModIncall.DataSource = modIncallChecks;
            RepeaterModIncall.DataBind();
            RepeaterModOutcall.DataSource = modOutcallChecks;
            RepeaterModOutcall.DataBind();
        }
        protected void BtnWorkCity_Click(object sender, EventArgs e)
        {
            bool success = true;
            int? workcityId = ControlUtil.GetSelectedValue(ComboWorkCity);
            if (workcityId == null)
            {
                SuccessAlarmWorkCity.Visible = false;
                ServerValidatorWorkCity1.IsValid = false;
                return;
            }
            success = new CityController().SaveWorkCity(model.Id, workcityId);
            if (!success)
            {
                SuccessAlarmWorkCity.Visible = false;
                servervalidatorService2.IsValid = false;
                return;
            }
            SuccessAlarmWorkCity.Visible = true;
            LoadWorkCities();
        }

        protected void RepeaterModWorkCity_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "Delete")
            {
                int id = int.Parse(e.CommandArgument.ToString());
                bool result = new ModWorkCityDAO().Delete(id);
                if (result) LoadWorkCities();
            }
        }
        // WorkCity Tab / IncallPlace
        protected void BtnIncall_Click(object sender, EventArgs e)
        {
            bool success = true;
            int? incallId = ControlUtil.GetSelectedValue(ComboIncall);
            if (incallId == null)
            {
                SuccessAlarmWorkCity.Visible = false;
                ServerValidatorWorkCity3.IsValid = false;
                return;
            }
            success = new InOutCallPlaceController().SaveModIncall(model.Id, incallId);
            if (!success)
            {
                SuccessAlarmWorkCity.Visible = false;
                servervalidatorService2.IsValid = false;
                return;
            }
            SuccessAlarmWorkCity.Visible = true;
            LoadWorkCities();
            LoadModRate();
        }

        protected void RepeaterModIncall_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "Delete")
            {
                int id = int.Parse(e.CommandArgument.ToString());
                bool result = new ModIncallPlaceDAO().Delete(id);
                if (result)
                {
                    LoadWorkCities();
                    LoadModRate();
                }
            }
        }
        // WorkCity Tab / OutcallPlace
        protected void BtnOutcall_Click(object sender, EventArgs e)
        {
            bool success = true;
            int? outcallId = ControlUtil.GetSelectedValue(ComboOutcall);
            if (outcallId == null)
            {
                SuccessAlarmWorkCity.Visible = false;
                ServerValidatorWorkCity4.IsValid = false;
                return;
            }
            success = new InOutCallPlaceController().SaveModOutcall(model.Id, outcallId);
            if (!success)
            {
                SuccessAlarmWorkCity.Visible = false;
                servervalidatorService2.IsValid = false;
                return;
            }
            SuccessAlarmWorkCity.Visible = true;
            LoadWorkCities();
            LoadModRate();
        }

        protected void RepeaterModOutcall_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "Delete")
            {
                int id = int.Parse(e.CommandArgument.ToString());
                bool result = new ModOutcallPlaceDAO().Delete(id);
                if (result)
                {
                    LoadWorkCities();
                    LoadModRate();
                }
            }
        }
        // WorkHours Tab
        private void LoadWorkDayHour()
        {
            // Load Work Day/Hours
            List<WorkDay> workDays = new WorkDayDAO().FindAll();
            ControlUtil.DataBind(ComboWorkDay, workDays, "Id", "Description", "0", "[Unassigned]");
            List<WorkHour> workHours = new WorkHourDAO().FindAll();
            ControlUtil.DataBind(ComboSHour, workHours, "Id", "Description", "0", "");
            ControlUtil.DataBind(ComboEHour, workHours, "Id", "Description", "0", "");
            // Load Mod Work Day/Hours
            List<ModWorkDayHourCheck> modWorkDayHourChecks = new WorkDayHourController().FindByModel(model.Id);
            RepeaterModWorkHour.DataSource = modWorkDayHourChecks;
            RepeaterModWorkHour.DataBind();
        }
        protected void BtnWorkHour_Click(object sender, EventArgs e)
        {
            bool success = true;
            int? dayId = ControlUtil.GetSelectedValue(ComboWorkDay);
            int? ehourId = ControlUtil.GetSelectedValue(ComboEHour);
            int? shourId = ControlUtil.GetSelectedValue(ComboSHour);
            if (dayId == null || ehourId == null || shourId == null)
            {
                SuccessAlarmWorkHours.Visible = false;
                ServerValidatorWorkHours1.IsValid = false;
                return;
            }
            success = new WorkDayHourController().SaveModWorkDayHour(model.Id, dayId, shourId, ehourId);
            if (!success)
            {
                SuccessAlarmWorkHours.Visible = false;
                ServerValidatorWorkHours2.IsValid = false;
                return;
            }
            SuccessAlarmWorkHours.Visible = true;
            LoadWorkDayHour();

        }
        protected void RepeaterModWorkHour_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "Delete")
            {
                int id = int.Parse(e.CommandArgument.ToString());
                bool result = new ModWorkDayHourDAO().Delete(id);
                if (result) LoadWorkDayHour();
            }
        }
        // Rate Tab
        private void LoadModRate()
        {
            // Load Mod IncallPlace
            List<ModIncallCheck> modIncallChecks = new InOutCallPlaceController().FindIncallPlaceByModel(model.Id);
            ControlUtil.DataBind(ComboModIncallPlace, modIncallChecks, "Id", "IncallPlace", "0", "[Unassigned]");
            // Load Mod OutcallPlace
            List<ModOutcallCheck> modOutcallChecks = new InOutCallPlaceController().FindOutcallPlaceByModel(model.Id);
            ControlUtil.DataBind(ComboModOutcallPlace, modOutcallChecks, "Id", "OutcallPlace", "0", "[Unassigned]");
            // Load Duration
            List<Duration> durations = new DurationDAO().FindAll();
            ControlUtil.DataBind(ComboDuration, durations, "Id", "Description", "0", "");
            ControlUtil.DataBind(ComboDuration1, durations, "Id", "Description", "0", "");
            // Load Mod IncallPlaceRate
            List<ModIncallRateCheck> modIncallRateChecks = new InOutCallPlaceController().FindIncallRateByModel(model.Id);
            RepeaterModIncallRate.DataSource = modIncallRateChecks;
            RepeaterModIncallRate.DataBind();
            // Load Mod OutcallPlaceRate
            List<ModOutcallRateCheck> modOutcallRateChecks = new InOutCallPlaceController().FindOutcallRateByModel(model.Id);
            RepeaterModOutcallRate.DataSource = modOutcallRateChecks;
            RepeaterModOutcallRate.DataBind();
        }
        protected void BtnIncallRate_Click(object sender, EventArgs e)
        {
            bool success = true;
            int? modIncallPlaceId = ControlUtil.GetSelectedValue(ComboModIncallPlace);
            int? durationId = ControlUtil.GetSelectedValue(ComboDuration);
            double? rate = ParseUtil.TryParseDouble(TxtIncallRate.Text);
            if (modIncallPlaceId == null || durationId == null || rate == null)
            {
                SuccessAlarmRate.Visible = false;
                ServerValidatorRate1.IsValid = false;
                return;
            }
            success = new InOutCallPlaceController().SaveModIncallRate(modIncallPlaceId, durationId, rate);
            if (!success)
            {
                SuccessAlarmRate.Visible = false;
                ServerValidatorRate3.IsValid = false;
                return;
            }
            SuccessAlarmRate.Visible = true;
            LoadModRate();
        }

        protected void BtnOutcallRate_Click(object sender, EventArgs e)
        {
            bool success = true;
            int? modOutcallPlaceId = ControlUtil.GetSelectedValue(ComboModOutcallPlace);
            int? durationId = ControlUtil.GetSelectedValue(ComboDuration1);
            double? rate = ParseUtil.TryParseDouble(TxtOutcallRate.Text);
            if (modOutcallPlaceId == null || durationId == null || rate == null)
            {
                SuccessAlarmRate.Visible = false;
                ServerValidatorRate2.IsValid = false;
                return;
            }
            success = new InOutCallPlaceController().SaveModOutcallRate(modOutcallPlaceId, durationId, rate);
            if (!success)
            {
                SuccessAlarmRate.Visible = false;
                ServerValidatorRate3.IsValid = false;
                return;
            }
            SuccessAlarmRate.Visible = true;
            LoadModRate();
        }

        protected void RepeaterModIncallRate_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "Delete")
            {
                int id = int.Parse(e.CommandArgument.ToString());
                bool result = new ModIncallRateDAO().Delete(id);
                if (result) LoadModRate();
            }
        }

        protected void RepeaterModOutcallRate_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "Delete")
            {
                int id = int.Parse(e.CommandArgument.ToString());
                bool result = new ModOutcallRateDAO().Delete(id);
                if (result) LoadModRate();
            }
        }
        // Contact Tab
        private void LoadContactInfo()
        {
            List<SocialChat> chatList = new SocialChatDAO().FindAll();
            List<InstructionChat> instructionsList = new InstructionChatDAO().FindAll();
            ControlUtil.DataBind(ComboSocialChat, chatList, "Id", "Description", "0", "[Unassigned]");
            ControlUtil.DataBind(ComboInstructionChat, instructionsList, "Id", "Description", "0", "[Unassigned]");
            ModContact modContact = new ModContactDAO().FindByModel(model.Id).FirstOrDefault();
            if (modContact == null) return;
            ControlUtil.SelectValue(ComboSocialChat, modContact.SocialChatId);
            ControlUtil.SelectValue(ComboInstructionChat, modContact.InstructionChatId);
            TxtEmail.Text = modContact.Email;
            TxtMobilePhone.Text = modContact.MobilePhone;
            TxtAddress.Text = modContact.Address;
            TxtAddressCiv.Text = modContact.AddressCiv;
        }
        protected void BtnContact_Click(object sender, EventArgs e)
        {
            bool success = true;
            int? socialId = ControlUtil.GetSelectedValue(ComboSocialChat);
            int? instructionId = ControlUtil.GetSelectedValue(ComboInstructionChat);
            string email = TxtEmail.Text;
            string mobilePhone = TxtMobilePhone.Text;
            string address = TxtAddress.Text;
            string addressCiv = TxtAddressCiv.Text;
            success = new ContactController().SaveContact(model.Id, socialId, instructionId, email, mobilePhone, address, addressCiv);
            if (!success)
            {
                SuccessAlarmContact.Visible = false;
                ServerValidatorContact.IsValid = false;
                return;
            }
            SuccessAlarmContact.Visible = true;
            LoadContactInfo();
        }
        // Video Tab
        private void LoadVideos()
        {
            List<ModVideo> videos = new ModVideoDAO().FindByModel(model.Id);
            RepeaterVideo.DataSource = videos;
            RepeaterVideo.DataBind();
        }

        protected void RepeaterVideo_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "Delete")
            {
                int id = int.Parse(e.CommandArgument.ToString());
                bool result = new ModVideoDAO().Delete(id);
                if (result) LoadVideos();
            }
        }

        protected void BtnReload_Click(object sender, EventArgs e)
        {
            LoadVideos();
        }

        // Natural Photo Tab
        private void LoadNaturalPhotos()
        {
            List<ModNaturalPhoto> naturalPhotos = new ModNaturalPhotoDAO().FindByModel(model.Id);
            RepeaterNautralPhoto.DataSource = naturalPhotos;
            RepeaterNautralPhoto.DataBind();
        }
        protected void BtnReloadNatural_Click(object sender, EventArgs e)
        {
            LoadNaturalPhotos();
        }

        protected void RepeaterNautralPhoto_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "Delete")
            {
                int id = int.Parse(e.CommandArgument.ToString());
                bool result = new ModNaturalPhotoDAO().Delete(id);
                if (result) LoadNaturalPhotos();
            }
        }
        // Tour Tab
        private void LoadTours()
        {
            List<City> cities = new CityDAO().FindAll();
            ControlUtil.DataBind(ComboTourCity, cities, "Id", "Description", "0", "[Unassigned]");

            List<ModTourCheck> modTours = new TourController().FindByModel(model.Id);
            RepeaterTour.DataSource = modTours;
            RepeaterTour.DataBind();
        }
        protected void RepeaterTour_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "Delete")
            {
                int id = int.Parse(e.CommandArgument.ToString());
                bool result = new ModTourDAO().Delete(id);
                if (result) LoadTours();
            }
        }

        protected void BtnTour_Click(object sender, EventArgs e)
        {
            bool success = true;
            int? cityId = ControlUtil.GetSelectedValue(ComboTourCity);
            DateTime? sdate = ParseUtil.TryParseDate(TxtSDate.Text, "dd/MM/yyyy HH:mm");
            DateTime? edate = ParseUtil.TryParseDate(TxtEDate.Text, "dd/MM/yyyy HH:mm");
            if (cityId == null)
            {
                SuccessAlarmTour.Visible = false;
                ServerValidatorTour1.IsValid = false;
                return;
            }
            if (sdate == null || edate == null)
            {
                SuccessAlarmTour.Visible = false;
                ServerValidatorTour2.IsValid = false;
                return;
            }
            string tourEmail = TxtTourEmail.Text;
            string tourPhone = TxtTourPhone.Text;

            success = new TourController().SaveTour(model.Id, cityId, sdate, edate, tourEmail, tourPhone);

            if (!success)
            {
                SuccessAlarmTour.Visible = false;
                ServerValidatorTour3.IsValid = false;
                return;
            }
            SuccessAlarmTour.Visible = true;
            LoadTours();
            return;

        }

        protected void BtnSetting_Click(object sender, EventArgs e)
        {

        }
    }
}