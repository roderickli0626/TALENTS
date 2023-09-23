using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using TALENTS.DAO;
using TALENTS.Models;

namespace TALENTS.Controller
{
    public class ServiceController
    {
        ServiceDAO serviceDAO;
        ServiceGroupDAO serviceGroupDAO;
        ModServiceDAO modServiceDAO;

        public ServiceController()
        {
            serviceDAO = new ServiceDAO();
            serviceGroupDAO = new ServiceGroupDAO();
            modServiceDAO = new ModServiceDAO();
        }

        public List<ModServiceCheck> FindByModel(int modelId)
        {
            List<ModService> modServices = modServiceDAO.FindByModel(modelId);
            List<ModServiceCheck> result = new List<ModServiceCheck>();
            foreach (ModService modservice in modServices)
            {
                ModServiceCheck modServiceCheck = new ModServiceCheck(modservice);
                result.Add(modServiceCheck);
            }
            return result;
        }
        public bool SaveService(int modelId, int? serviceId, double? amount)
        {
            if (serviceId == null) { return false; }
            ModService modService = modServiceDAO.FindByModel(modelId).Where(l => l.ServiceId == serviceId).FirstOrDefault();
            if (modService == null)
            {
                modService = new ModService();
                modService.ModelId = modelId;
                modService.ServiceId = serviceId ?? 0;
                modService.Amount = amount;
                return modServiceDAO.Insert(modService);
            }
            else
            {
                modService.Amount = amount;
                return modServiceDAO.Update(modService);
            }
        }
    }
}