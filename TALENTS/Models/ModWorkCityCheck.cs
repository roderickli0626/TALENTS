using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace TALENTS.Models
{
    public class ModWorkCityCheck
    {
        private ModWorkingCityAlloc city;
        public ModWorkCityCheck() { }
        public ModWorkCityCheck(ModWorkingCityAlloc city)
        {
            this.city = city;
            if (city == null) { return; }
            Id = city.Id;
            WorkCity = city.City.Description;
        }
        public int Id
        {
            get; set;
        }

        public string WorkCity
        {
            get; set;
        }
    }
}