using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace TALENTS.Models
{
    public class ModOutcallCheck
    {
        private ModOutcallPlace outCall;
        public ModOutcallCheck() { }
        public ModOutcallCheck(ModOutcallPlace outCall)
        {
            this.outCall = outCall;
            if (outCall == null) return;
            Id = outCall.Id;
            OutcallPlace = outCall.OutcallPlace.Description;
        }
        public int Id
        {
            get; set;
        }

        public string OutcallPlace
        {
            get; set;
        }
    }
}