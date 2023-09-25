using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Policy;
using System.Web;
using TALENTS.DAO;
using TALENTS.Models;

namespace TALENTS.Controller
{
    public class InOutCallPlaceController
    {
        IncallPlaceDAO inCallPlaceDAO;
        OutcallPlaceDAO outCallPlaceDAO;
        ModIncallPlaceDAO modIncallPlaceDAO;
        ModOutcallPlaceDAO modOutcallPlaceDAO;
        ModIncallRateDAO modIncallRateDAO;
        ModOutcallRateDAO modOutcallRateDAO;

        public InOutCallPlaceController()
        {
            inCallPlaceDAO = new IncallPlaceDAO();
            outCallPlaceDAO = new OutcallPlaceDAO();
            modIncallPlaceDAO = new ModIncallPlaceDAO();
            modOutcallPlaceDAO = new ModOutcallPlaceDAO();
            modIncallRateDAO = new ModIncallRateDAO();
            modOutcallRateDAO = new ModOutcallRateDAO();
        }

        public List<ModIncallCheck> FindIncallPlaceByModel(int modelId)
        {
            List<ModIncallPlace> modIncallPlaces = modIncallPlaceDAO.FindByModel(modelId);
            List<ModIncallCheck> result = new List<ModIncallCheck>();
            foreach (ModIncallPlace modIncallPlace in modIncallPlaces)
            {
                ModIncallCheck modIncallCheck = new ModIncallCheck(modIncallPlace);
                result.Add(modIncallCheck);
            }
            return result;
        }
        public List<ModOutcallCheck> FindOutcallPlaceByModel(int modelId)
        {
            List<ModOutcallPlace> modOutcallPlaces = modOutcallPlaceDAO.FindByModel(modelId);
            List<ModOutcallCheck> result = new List<ModOutcallCheck>();
            foreach (ModOutcallPlace modOutcallPlace in modOutcallPlaces)
            {
                ModOutcallCheck modWorkCityCheck = new ModOutcallCheck(modOutcallPlace);
                result.Add(modWorkCityCheck);
            }
            return result;
        }

        public List<ModIncallRateCheck> FindIncallRateByModel(int modelId)
        {
            List<ModIncallRate> modIncallRates = modIncallRateDAO.FindByModel(modelId);
            List<ModIncallRateCheck> result = new List<ModIncallRateCheck>();
            foreach (ModIncallRate modIncallRate in modIncallRates)
            {
                ModIncallRateCheck modIncallRateCheck = new ModIncallRateCheck(modIncallRate);
                result.Add(modIncallRateCheck);
            }
            return result;
        }

        public List<ModOutcallRateCheck> FindOutcallRateByModel(int modelId)
        {
            List<ModOutcallRate> modOutcallRates = modOutcallRateDAO.FindByModel(modelId);
            List<ModOutcallRateCheck> result = new List<ModOutcallRateCheck>();
            foreach (ModOutcallRate modOutcallRate in modOutcallRates)
            {
                ModOutcallRateCheck modOutcallRateCheck = new ModOutcallRateCheck(modOutcallRate);
                result.Add(modOutcallRateCheck);
            }
            return result;
        }

        public bool SaveModIncall(int modelId, int? incallPlaceId)
        {
            ModIncallPlace modIncallPlace = modIncallPlaceDAO.FindByModel(modelId).Where(c => c.IncallPlaceId == incallPlaceId).FirstOrDefault();
            if (modIncallPlace == null)
            {
                modIncallPlace = new ModIncallPlace();
                modIncallPlace.ModelId = modelId;
                modIncallPlace.IncallPlaceId = incallPlaceId ?? 0;
                return modIncallPlaceDAO.Insert(modIncallPlace);
            }
            else
            {
                return true;
            }
        }

        public bool SaveModOutcall(int modelId, int? outcallPlaceId)
        {
            ModOutcallPlace modOutcallPlace = modOutcallPlaceDAO.FindByModel(modelId).Where(c => c.OutcallPlaceId == outcallPlaceId).FirstOrDefault();
            if (modOutcallPlace == null)
            {
                modOutcallPlace = new ModOutcallPlace();
                modOutcallPlace.ModelId = modelId;
                modOutcallPlace.OutcallPlaceId = outcallPlaceId ?? 0;
                return modOutcallPlaceDAO.Insert(modOutcallPlace);
            }
            else
            {
                return true;
            }
        }
        public bool SaveModIncallRate(int? modIncallPlaceId, int? durationId, double? rate)
        {
            ModIncallRate modIncallRate = modIncallRateDAO.FindByModInPlace(modIncallPlaceId ?? 0).Where(i => i.DurationId == durationId).FirstOrDefault();
            if (modIncallRate == null)
            {
                modIncallRate = new ModIncallRate();
                modIncallRate.ModIncallPlaceId = modIncallPlaceId ?? 0;
                modIncallRate.DurationId = durationId ?? 0;
                modIncallRate.Amount = rate;
                return modIncallRateDAO.Insert(modIncallRate);
            }
            else
            {
                modIncallRate.Amount = rate;
                return modIncallRateDAO.Update(modIncallRate);
            }
        }
        public bool SaveModOutcallRate(int? modOutcallPlaceId, int? durationId, double? rate)
        {
            ModOutcallRate modOutcallRate = modOutcallRateDAO.FindByModOutPlace(modOutcallPlaceId ?? 0).Where(i => i.DurationId == durationId).FirstOrDefault();
            if (modOutcallRate == null)
            {
                modOutcallRate = new ModOutcallRate();
                modOutcallRate.ModOutcallPlaceId = modOutcallPlaceId ?? 0;
                modOutcallRate.DurationId = durationId ?? 0;
                modOutcallRate.Amount = rate;
                return modOutcallRateDAO.Insert(modOutcallRate);
            }
            else
            {
                modOutcallRate.Amount = rate;
                return modOutcallRateDAO.Update(modOutcallRate);
            }
        }
    }
}