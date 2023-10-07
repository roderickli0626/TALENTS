using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using TALENTS.Common;
using TALENTS.DAO;

namespace TALENTS.Controller
{
    public class EncryptedPass
    {
        public string Encrypted { get; set; }
        public string UnEncrypted { get; set; }

    }
    public class LoginController
    {
        private ModelDAO modelDao;
        private ModSettingDAO modSettingDAO;

        public LoginController()
        {
            modelDao = new ModelDAO();
            modSettingDAO = new ModSettingDAO();
        }

        public LoginCode LoginAndSaveSession(string email, EncryptedPass pass)
        {
            string SuperAdminEmail = System.Configuration.ConfigurationManager.AppSettings["AdminUserName"];
            string SuperAdminPass = System.Configuration.ConfigurationManager.AppSettings["AdminPassword"];

            if (email.CompareTo(SuperAdminEmail) == 0 && pass.UnEncrypted.CompareTo(SuperAdminPass) == 0)
            {
                new SessionController().SetSuperAdmin();
                new SessionController().SetCurrentUserId(0);
                new SessionController().SetCurrentUserEmail(email);
                new SessionController().SetPassword(pass);
                new SessionController().SetTimeout(60 * 24 * 7 * 2);

                return LoginCode.Success;
            }

            Model model = modelDao.FindByEmail(email);
            if (model == null) { return LoginCode.Failed; }
            string modelPW = new CryptoController().DecryptStringAES(model.Password);
            if (pass.UnEncrypted.CompareTo(modelPW) == 0)
            {
                if (model.IsAdmin == true)
                {
                    new SessionController().SetAdmin();
                }
                else if (model.IsUser == true)
                {
                    new SessionController().SetUser();
                }
                else if (model.IsModel == true)
                {
                    new SessionController().SetModel();
                }

                new SessionController().SetCurrentUserId(model.Id);
                new SessionController().SetCurrentUserEmail(model.Email);
                new SessionController().SetPassword(pass);
                new SessionController().SetTimeout(60 * 24 * 7 * 2);

                return LoginCode.Success;
            }
            else
            {
                return LoginCode.Failed;
            }

        }
        public bool IsSuperAdminLoggedIn()
        {
            return new SessionController().GetSuperAdmin() == true;
        }
        public bool IsAdminLoggedIn()
        {
            return new SessionController().GetAdmin() == true;
        }
        public bool IsUserLoggedIn()
        {
            return new SessionController().GetUser() == true;
        }

        public bool IsModelLoggedIn()
        {
            return new SessionController().GetModel() == true;
        }

        public Model GetCurrentUserAccount()
        {
            Model model = null;
            int? id = new SessionController().GetCurrentUserId();
            if (id == null) return null;
            model = modelDao.FindById(id.Value);
            return model;
        }

        public bool RegisterModel(string name, string email, EncryptedPass pass, bool IsModel, bool IsUser)
        {
            Model model = modelDao.FindByEmail(email);
            if (model != null)
            {
                return false;
            }
            Model registerModel = new Model();
            registerModel.Username = name;
            registerModel.Email = email;
            registerModel.Password = pass.Encrypted;
            registerModel.IsModel = IsModel;
            registerModel.IsUser = IsUser;

            if (IsModel)
            {
                ModSetting modSetting = new ModSetting();
                modSetting.ModelId = model.Id;
                modSetting.IsGreen = false;
                modSetting.IsAllowed = false;
                modSettingDAO.Insert(modSetting);
            }

            return modelDao.Insert(registerModel);
        }
    }
}