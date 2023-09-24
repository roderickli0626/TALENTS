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

        public InOutCallPlaceController()
        {
            inCallPlaceDAO = new IncallPlaceDAO();
            outCallPlaceDAO = new OutcallPlaceDAO();
            modIncallPlaceDAO = new ModIncallPlaceDAO();
            modOutcallPlaceDAO = new ModOutcallPlaceDAO();
        }

        public List<ModIncallCheck> FindIncallPlaceByModel(int modelId)
        {
            List<ModIncallPlace> modIncallPlaces = new ModIncallPlaceDAO().FindByModel(modelId);
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
            List<ModOutcallPlace> modOutcallPlaces = new ModOutcallPlaceDAO().FindByModel(modelId);
            List<ModOutcallCheck> result = new List<ModOutcallCheck>();
            foreach (ModOutcallPlace modOutcallPlace in modOutcallPlaces)
            {
                ModOutcallCheck modWorkCityCheck = new ModOutcallCheck(modOutcallPlace);
                result.Add(modWorkCityCheck);
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
    }
}