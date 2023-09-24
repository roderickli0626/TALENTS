using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Remoting.Messaging;
using System.Security.Policy;
using System.Web;
using TALENTS.DAO;
using TALENTS.Models;

namespace TALENTS.Controller
{
    public class CityController
    {
        CityDAO cityDao;
        ModWorkCityDAO modWorkCityDAO;

        public CityController()
        {
            cityDao = new CityDAO();
            modWorkCityDAO = new ModWorkCityDAO();
        }

        public List<ModWorkCityCheck> FindByModel(int modelId)
        {
            List<ModWorkingCityAlloc> modWorkingCityAllocs = new ModWorkCityDAO().FindByModel(modelId);
            List<ModWorkCityCheck> result = new List<ModWorkCityCheck>();
            foreach (ModWorkingCityAlloc modWorkCityAlloc in modWorkingCityAllocs)
            {
                ModWorkCityCheck modWorkCityCheck = new ModWorkCityCheck(modWorkCityAlloc);
                result.Add(modWorkCityCheck);
            }
            return result;
        }

        public bool SaveWorkCity(int modelId, int? workcityId)
        {
            ModWorkingCityAlloc modWorkingCity = modWorkCityDAO.FindByModel(modelId).Where(c => c.CityId == workcityId).FirstOrDefault();
            if (modWorkingCity == null)
            {
                modWorkingCity = new ModWorkingCityAlloc();
                modWorkingCity.ModelId = modelId;
                modWorkingCity.CityId = workcityId ?? 0;
                return modWorkCityDAO.Insert(modWorkingCity);
            }
            else
            {
                return true;
            }
        }
    }
}