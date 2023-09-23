using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using TALENTS.DAO;
using TALENTS.Models;

namespace TALENTS.Controller
{
    public class LanguageController
    {
        LanguageDAO languageDAO;
        ModLanguageDAO modLanguageDAO;
        public LanguageController() 
        {
            languageDAO = new LanguageDAO();
            modLanguageDAO = new ModLanguageDAO();
        }

        public List<ModLanguageCheck> FindByModel(int modelId)
        {
            List<ModLanguageAlloc> modLanguageAllocs = modLanguageDAO.FindByModel(modelId);
            List<ModLanguageCheck> result = new List<ModLanguageCheck>();
            foreach (ModLanguageAlloc modLanguageAlloc in modLanguageAllocs)
            {
                ModLanguageCheck modLanguageCheck = new ModLanguageCheck(modLanguageAlloc);
                result.Add(modLanguageCheck);
            }
            return result;
        }

        public bool SaveModLang(int modelId, int? langId, int? levelId)
        {
            if (langId == null || levelId == null)
            {
                return false;
            }
            ModLanguageAlloc modLanguageAlloc = modLanguageDAO.FindByModel(modelId).Where(l => l.LanguageId == langId).FirstOrDefault();
            if (modLanguageAlloc == null)
            {
                modLanguageAlloc = new ModLanguageAlloc();
                modLanguageAlloc.ModelId = modelId;
                modLanguageAlloc.LanguageId = langId ?? 0;
                modLanguageAlloc.SkillId = levelId ?? 0;
                return modLanguageDAO.Insert(modLanguageAlloc);
            }
            else
            {
                modLanguageAlloc.SkillId = levelId ?? 0;
                return modLanguageDAO.Update(modLanguageAlloc);
            }
            
        }


    }
}