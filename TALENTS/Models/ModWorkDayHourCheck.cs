using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace TALENTS.Models
{
    public class ModWorkDayHourCheck
    {
        ModWorkDayHour modWorkDayHour;
        public ModWorkDayHourCheck() { }
        public ModWorkDayHourCheck(ModWorkDayHour modWorkDayHour) 
        { 
            this.modWorkDayHour = modWorkDayHour;
            if (modWorkDayHour == null ) { return; }
            Id = modWorkDayHour.Id;
            WorkDay = modWorkDayHour.WorkDay.Description;
            WorkSHour = modWorkDayHour.WorkHour.Description;
            WorkEHour = modWorkDayHour.WorkHour1.Description;
        }
        public int Id
        {
            get; set;
        }
        public string WorkDay
        {
            get; set;
        }
        public string WorkSHour
        {
            get; set;
        }
        public string WorkEHour
        {
            get; set;
        }
    }
}