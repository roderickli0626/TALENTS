using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace TALENTS.Models
{
    public class ModServiceCheck
    {
        private ModService modService;
        public ModServiceCheck() { }

        public ModServiceCheck(ModService modService)
        {
            this.modService = modService;
            if (modService == null) return;
            Id = modService.Id;
            Group = modService.Service.ServiceGroup.Description;
            Service = modService.Service.Description;
            Amount = modService.Amount;
        }
        public int Id
        {
            get; set;
        }

        public string Group
        {
            get; set;
        }
        public string Service
        {
            get; set;
        }
        public double? Amount
        {
            get; set;
        }
    }
}