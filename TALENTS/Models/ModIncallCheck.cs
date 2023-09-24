using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace TALENTS.Models
{
    public class ModIncallCheck
    {
        private ModIncallPlace incall;
        public ModIncallCheck() { }
        public ModIncallCheck(ModIncallPlace incall)
        {
            this.incall = incall;
            if (incall == null) return;
            Id = incall.Id;
            IncallPlace = incall.IncallPlace.Description;
        }
        public int Id
        {
            get; set;
        }

        public string IncallPlace
        {
            get; set;
        }
    }
}