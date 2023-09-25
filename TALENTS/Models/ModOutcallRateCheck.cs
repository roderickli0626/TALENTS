using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace TALENTS.Models
{
    public class ModOutcallRateCheck
    {
        ModOutcallRate modOutcallrate;
        public ModOutcallRateCheck() { }

        public ModOutcallRateCheck(ModOutcallRate modOutcallRate)
        {
            this.modOutcallrate = modOutcallRate;
            if (modOutcallrate == null) { return; }
            Id = modOutcallrate.Id;
            OutcallPlace = modOutcallrate.ModOutcallPlace.OutcallPlace.Description;
            Duration = modOutcallrate.Duration.Description;
            Rate = modOutcallrate.Amount ?? 0;
        }
        public int Id
        {
            get; set;
        }
        public string OutcallPlace
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