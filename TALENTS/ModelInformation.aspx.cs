using Antlr.Runtime.Tree;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TALENTS.Controller;
using TALENTS.DAO;
using TALENTS.Util;

namespace TALENTS
{
    public partial class ModelInformation : System.Web.UI.Page
    {
        Model model;
        LoginController loginSystem = new LoginController();
        ModelController modelController = new ModelController();
        protected void Page_Load(object sender, EventArgs e)
        {
            model = loginSystem.GetCurrentUserAccount();
            if (model == null || !loginSystem.IsModelLoggedIn())
            {
                Response.Redirect("~/Login.aspx");
                return;
            }
            
            if (!IsPostBack)
            {
                ModelName.InnerText = model.Username;
                LoadBioInfo();
            }
        }

        private void LoadBioInfo()
        {
            //Load Sex
            ComboSex.Items. Clear();
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

    }
}