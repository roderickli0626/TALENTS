using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Policy;
using System.Web;
using TALENTS.DAO;
using TALENTS.Models;

namespace TALENTS.Controller
{
    public class WorkDayHourController
    {
        ModWorkDayHourDAO modWorkDayHourDAO;
        WorkDayDAO workDayDAO;
        WorkHourDAO workHourDAO;
        public WorkDayHourController() 
        { 
            modWorkDayHourDAO = new ModWorkDayHourDAO();
            workDayDAO = new WorkDayDAO();
            workHourDAO = new WorkHourDAO();
        }

        public List<ModWorkDayHourCheck> FindByModel(int modelId)
        {
            List<ModWorkDayHour> modWorkDayHours = new ModWorkDayHourDAO().FindByModel(modelId);
            List<ModWorkDayHourCheck> result = new List<ModWorkDayHourCheck>();
            foreach (ModWorkDayHour modWorkDayHour in modWorkDayHours)
            {
                ModWorkDayHourCheck modWorkDayHourCheck = new ModWorkDayHourCheck(modWorkDayHour);
                result.Add(modWorkDayHourCheck);
            }
            return result;
        }

        public bool SaveModWorkDayHour(int modelId, int? dayId, int? shourId, int? ehourId)
        {
            ModWorkDayHour modWorkDayHour = modWorkDayHourDAO.FindByModel(modelId).Where(m => m.DayId == dayId).FirstOrDefault();
            if (modWorkDayHour == null)
            {
                modWorkDayHour = new ModWorkDayHour();
                modWorkDayHour.ModelId = modelId;
                modWorkDayHour.DayId = dayId ?? 0;
                modWorkDayHour.SHourId = shourId ?? 0;
                modWorkDayHour.EHourId = ehourId ?? 0;
                return modWorkDayHourDAO.Insert(modWorkDayHour);
            }
            else
            {
                modWorkDayHour.SHourId = shourId ?? 0;
                modWorkDayHour.EHourId = ehourId ?? 0;
                return modWorkDayHourDAO.Update(modWorkDayHour);
            }
        }

    }
}