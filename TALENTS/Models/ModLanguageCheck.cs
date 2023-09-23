using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace TALENTS.Models
{
    public class ModLanguageCheck
    {
        private ModLanguageAlloc modLanguage;
        public ModLanguageCheck() { }
        public ModLanguageCheck(ModLanguageAlloc modLanguage) 
        { 
            this.modLanguage = modLanguage;
            if (modLanguage == null) { return; }
            Id = modLanguage.Id;
            Language = modLanguage.Language.Description;
            Level = modLanguage.SkillLevel.Description;
        }

        public int Id
        {
            get; set;
        }

        public string Language
        {
            get; set;
        }
        public string Level
        {
            get; set;
        }

    }
}