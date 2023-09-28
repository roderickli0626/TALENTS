using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TALENTS.Controller;
using TALENTS.DAO;
using TALENTS.Util;

namespace TALENTS
{
    public partial class UserInformation : System.Web.UI.Page
    {
        Model model;
        LoginController loginSystem = new LoginController();
        ModelController modelController = new ModelController();

        protected void Page_Load(object sender, EventArgs e)
        {
            model = loginSystem.GetCurrentUserAccount();
            if (model == null || !loginSystem.IsUserLoggedIn())
            {
                Response.Redirect("~/Login.aspx");
                return;
            }
            if (!IsPostBack)
            {
                LoadInfo();
            }
        }
        private void LoadInfo()
        {
            //Load Nationality
            List<Nationality> NationList = new NationalityDAO().FindAll();
            ControlUtil.DataBind(ComboNation, NationList, "Id", "Description", "0", "[Unassigned]");
            //Load Residence
            List<City> CityList = new CityDAO().FindAll();
            ControlUtil.DataBind(ComboRes, CityList, "Id", "Description", "0", "[Unassigned]");

            //Load Model Info
            UserInfo userInfo = new UserInfoDAO().FindAll().Where(u => u.UserId == model.Id).FirstOrDefault();
            if (userInfo == null) { return; }
            ControlUtil.SelectValue(ComboNation, userInfo.NationalityId);
            ControlUtil.SelectValue(ComboRes, userInfo.CityResidenceId);
            TxtName.Text = userInfo.Name;
            TxtSurname.Text = userInfo.Surname;
            TxtAddress.Text = userInfo.Address;
            TxtCAP.Text = userInfo.CAP;
            TxtBirthDay.Text = userInfo.DateOfBirth?.ToString("dd/mm/yyyy");
            TxtSociety.Text = userInfo.Society;
            TxtVat.Text = userInfo.VatNumber;
            TxtLicenze.Text = userInfo.VatNumber;
            TxtWebSite.Text = userInfo.Website;
            TxtEmail.Text = userInfo.Email;
            TxtMobile.Text = userInfo.Mobile;
            TxtPhone.Text = userInfo.Phone;
            TxtNote.Text = userInfo.Note;
        }

        protected void BtnUserInfo_Click(object sender, EventArgs e)
        {
            bool success = true;
            string name = TxtName.Text;
            if (string.IsNullOrEmpty(name))
            {
                SuccessAlarm.Visible = false;
                ServerValidatorInfo1.IsValid = false;
                return;
            }
            string surname = TxtSurname.Text;
            string address = TxtAddress.Text;
            string CAP = TxtCAP.Text;
            int? nationId = ControlUtil.GetSelectedValue(ComboNation);
            int? resId = ControlUtil.GetSelectedValue(ComboRes);
            DateTime birthDay = ParseUtil.TryParseDate(TxtBirthDay.Text) ?? DateTime.Today;
            string society = TxtSociety.Text;
            string vat = TxtVat.Text;
            string licenze = TxtLicenze.Text;
            string mobile = TxtMobile.Text;
            string phone = TxtPhone.Text;
            string website = TxtWebSite.Text;
            string email = TxtEmail.Text;
            string note = TxtNote.Text;

            success = modelController.SaveUserInfo(model.Id, name, surname, address, CAP, nationId, resId, birthDay, society, 
                vat, licenze, mobile, phone, website, email, note);
            if (!success)
            {
                SuccessAlarm.Visible = false;
                ServerValidatorInfo2.IsValid = false;
                return;
            }

            SuccessAlarm.Visible = true;
        }
    }
}