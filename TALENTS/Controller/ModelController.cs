using Antlr.Runtime.Tree;
using Microsoft.Ajax.Utilities;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Security.Policy;
using System.Web;
using System.Web.UI;
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

        public bool SaveModelBio(int modelId, string name, string slogan, int? age, string sex, int? ethId, int? nationId, int? resId, int? hairColorId, int? hairLengId, int? eyeId,
                double? height, double? weight, int? dressId, int? shoes, string bust, string waist, string haunch, int? breastId, string smoker, string tattoos, string drinker, string piercing, string peculiarities)
        {
            bool result = false;
            ModBiography modBiography = biographyDao.FindByModelId(modelId);
            if (modBiography == null) 
            {
                modBiography = new ModBiography();
                modBiography.ModelId = modelId;
                modBiography.Name = name;
                modBiography.Age = age;
                modBiography.Sex = sex;
                modBiography.Slogan = slogan;
                modBiography.EthnicityId = ethId;
                modBiography.NationalityId = nationId;
                modBiography.CityResidenceId = resId;
                modBiography.HairColorId = hairColorId;
                modBiography.HairLenghId = hairLengId;
                modBiography.EyeId = eyeId;
                modBiography.Height = height;
                modBiography.Weight = weight;
                modBiography.DressSizeId = dressId;
                modBiography.Shoes = shoes;
                modBiography.Bust = bust;
                modBiography.Waist = waist;
                modBiography.Haunch = haunch;
                modBiography.BreastSizeId = breastId;
                modBiography.Drinker = drinker;
                modBiography.Smoker = smoker;
                modBiography.Piercing = piercing;
                modBiography.Peculiarities = peculiarities;
                modBiography.Tattoos = tattoos;

                result = biographyDao.Insert(modBiography);
            }
            else
            {
                modBiography.Name = name;
                modBiography.Age = age;
                modBiography.Sex = sex;
                modBiography.Slogan = slogan;
                modBiography.EthnicityId = ethId;
                modBiography.NationalityId = nationId;
                modBiography.CityResidenceId = resId;
                modBiography.HairColorId = hairColorId;
                modBiography.HairLenghId = hairLengId;
                modBiography.EyeId = eyeId;
                modBiography.Height = height;
                modBiography.Weight = weight;
                modBiography.DressSizeId = dressId;
                modBiography.Shoes = shoes;
                modBiography.Bust = bust;
                modBiography.Waist = waist;
                modBiography.Haunch = haunch;
                modBiography.BreastSizeId = breastId;
                modBiography.Drinker = drinker;
                modBiography.Smoker = smoker;
                modBiography.Piercing = piercing;
                modBiography.Peculiarities = peculiarities;
                modBiography.Tattoos = tattoos;

                result = biographyDao.Update(modBiography);
            }
            return result;
        }

        public bool SaveAboutMe(int modelId, string aboutMe)
        {
            bool result = false;
            ModBiography modBiography =  biographyDao.FindByModelId(modelId);
            if (modBiography == null)
            {
                modBiography = new ModBiography();
                modBiography.ModelId = modelId;
                modBiography.AboutMe = aboutMe;
                result = biographyDao.Insert(modBiography);
            }
            else
            {
                modBiography.AboutMe = aboutMe;
                result = biographyDao.Update(modBiography);
            }
            return result;
        }

        public bool SaveUserInfo(int userId, string name, string surname, string address, string CAP, int? nationId, int? resId, DateTime birthDay,
            string society, string vat, string licenze, string mobile, string phone, string website, string email, string note)
        {
            bool result = false;
            UserInfo userInfo = new UserInfoDAO().FindAll().Where(u => u.UserId == userId).FirstOrDefault();
            if (userInfo == null)
            {
                userInfo = new UserInfo();
                userInfo.UserId = userId;
                userInfo.Name = name;
                userInfo.Surname = surname;
                userInfo.Address = address;
                userInfo.CAP = CAP;
                userInfo.NationalityId = nationId;
                userInfo.CityResidenceId = resId;
                userInfo.DateOfBirth = birthDay;
                userInfo.Society = society;
                userInfo.VatNumber = vat;
                userInfo.Email = email;
                userInfo.Phone = phone;
                userInfo.Website = website;
                userInfo.Mobile = mobile;
                userInfo.LicenceNumber = licenze;
                userInfo.Note = note;
                result = new UserInfoDAO().Insert(userInfo);
            }
            else
            {
                userInfo.Name = name;
                userInfo.Surname = surname;
                userInfo.Address = address;
                userInfo.CAP = CAP;
                userInfo.NationalityId = nationId;
                userInfo.CityResidenceId = resId;
                userInfo.DateOfBirth = birthDay;
                userInfo.Society = society;
                userInfo.VatNumber = vat;
                userInfo.Email = email;
                userInfo.Phone = phone;
                userInfo.Website = website;
                userInfo.Mobile = mobile;
                userInfo.LicenceNumber = licenze;
                userInfo.Note = note;
                result = new UserInfoDAO().Update(userInfo);
            }
            return result;
        }

        public SearchResult SearchModels(int start, int length, string search)
        {
            SearchResult result = new SearchResult();
            IEnumerable<Model> list = modelDao.FindAllModels().Where(m => m.Email.Contains(search) || m.Username.Contains(search));
            result.TotalCount = list.Count();
            list = list.Skip(start).Take(length);

            List<object> checks = new List<object>();
            foreach (Model md in list)
            {
                ModBiography modBiography = biographyDao.FindByModelId(md.Id);
                ModelCheck modelCheck = new ModelCheck(modBiography);
                if (modBiography == null) modelCheck.Id = md.Id;
                List<ModPhoto> photoList = modPhotoDao.FindByModel(md.Id);
                if (photoList.Count() == 0) modelCheck.Image = "Default.jpg";
                else modelCheck.Image = photoList.FirstOrDefault().Image;
                checks.Add(modelCheck);
            }
            result.ResultList = checks;

            return result;
        }

        public bool DeleteModel(int id)
        {
            Model item = modelDao.FindById(id);
            if (item == null) return false;

            return modelDao.Delete(id);
        }

        public SearchResult SearchUsers(int start, int length, string search)
        {
            SearchResult result = new SearchResult();
            IEnumerable<Model> list = modelDao.FindAllUsers().Where(m => m.Email.Contains(search) || m.Username.Contains(search));
            result.TotalCount = list.Count();
            list = list.Skip(start).Take(length);

            List<object> checks = new List<object>();
            foreach (Model md in list)
            {
                ModelCheck modelCheck = new ModelCheck();
                modelCheck.Id = md.Id;
                modelCheck.Email = md.Email;
                modelCheck.Name = md.Username;
                checks.Add(modelCheck);
            }
            result.ResultList = checks;

            return result;
        }

        public SearchResult SearchAdmins(int start, int length, string search)
        {
            SearchResult result = new SearchResult();
            IEnumerable<Model> list = modelDao.FindAllAdmins().Where(m => m.Email.Contains(search) || m.Username.Contains(search));
            result.TotalCount = list.Count();
            list = list.Skip(start).Take(length);

            List<object> checks = new List<object>();
            foreach (Model md in list)
            {
                ModelCheck modelCheck = new ModelCheck();
                modelCheck.Id = md.Id;
                modelCheck.Email = md.Email;
                modelCheck.Name = md.Username;
                checks.Add(modelCheck);
            }
            result.ResultList = checks;

            return result;
        }

        public bool SaveAdmin(string name, string email, EncryptedPass pass)
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
            registerModel.IsAdmin = true;

            return modelDao.Insert(registerModel);
        }

        public bool UpdateAdmin(int? adminId, string name, string email, EncryptedPass pass)
        {
            Model admin = modelDao.FindById(adminId ?? 0);
            if (admin == null)
            {
                return false;
            }

            admin.Username = name;
            admin.Email = email;
            admin.Password = pass.Encrypted;
            admin.IsAdmin = true;

            return modelDao.Update(admin);
        }

        public bool UpdateUser(int? userId, string name, string email, EncryptedPass pass)
        {
            Model user = modelDao.FindById(userId ?? 0);
            if (user == null)
            {
                return false;
            }

            user.Username = name;
            user.Email = email;
            user.Password = pass.Encrypted;
            user.IsUser = true;

            return modelDao.Update(user);
        }

        public bool UpdateModel(int? modelId, string name, string email, EncryptedPass pass)
        {
            Model model = modelDao.FindById(modelId ?? 0);
            if (model == null)
            {
                return false;
            }

            model.Username = name;
            model.Email = email;
            model.Password = pass.Encrypted;
            model.IsModel = true;

            return modelDao.Update(model);
        }

    }
}