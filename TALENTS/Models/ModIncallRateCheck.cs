using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI.HtmlControls;

namespace TALENTS.Models
{
    public class ModIncallRateCheck
    {
        ModIncallRate modIncallrate;
        public ModIncallRateCheck() { }

        public ModIncallRateCheck(ModIncallRate modIncallRate) 
        {
            this.modIncallrate = modIncallRate;
            if (modIncallrate == null) { return; }
            Id = modIncallrate.Id;
            IncallPlace = modIncallrate.ModIncallPlace.IncallPlace.Description;
            Duration = modIncallrate.Duration.Description;
            Rate = modIncallrate.Amount ?? 0;
        }
        public int Id
        {
            get; set;
        }
        public string IncallPlace
        {
            get; set;
        }
        public string Duration
        {
            get; set;
        }
        public double Rate
        {
            get; set;
        }

    }
}