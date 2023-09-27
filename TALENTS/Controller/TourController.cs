using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Policy;
using System.Web;
using TALENTS.DAO;
using TALENTS.Models;

namespace TALENTS.Controller
{
    public class TourController
    {
        private ModTourDAO modTourDAO;
        public TourController()
        {
            modTourDAO = new ModTourDAO();
        }
        
        public List<ModTourCheck> FindByModel(int modelID)
        {
            List<ModTour> list = new ModTourDAO().FindByModel(modelID);
            List<ModTourCheck> result = new List<ModTourCheck>();
            foreach(ModTour modtour in list)
            {
                ModTourCheck modtourCheck = new ModTourCheck(modtour);
                result.Add(modtourCheck);
            }
            return result;
        }

        public bool SaveTour(int modelId, int? cityId, DateTime? sdate, DateTime? edate, string email, string phone)
        {
            ModTour modtour = new ModTour();
            modtour.ModelId = modelId;
            modtour.CityId = cityId ?? 0;
            modtour.DateFrom = sdate;
            modtour.DateTo = edate;
            modtour.Email = email;
            modtour.Phone = phone;

            return modTourDAO.Insert(modtour);
        }
    }
}