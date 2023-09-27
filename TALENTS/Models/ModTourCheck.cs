using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace TALENTS.Models
{
    public class ModTourCheck
    {
        ModTour modTour;
        public ModTourCheck() { }
        public ModTourCheck(ModTour modTour) 
        { 
            this.modTour = modTour;
            if (modTour == null) { return; }
            Id = modTour.Id;
            City = modTour.City.Description;
            Email = modTour.Email;
            Phone = modTour.Phone;
            From = modTour.DateFrom?.ToString("dd/MM/yyyy HH:mm");
            To = modTour.DateTo?.ToString("dd/MM/yyyy HH:mm");
        }
        public int Id
        {
            get; set;
        }
        public string City
        {
            get; set;
        }
        public string Email
        {
            get; set;
        }
        public string Phone
        {
            get; set;
        }
        public string From { get; set; }
        public string To { get; set; }

    }
}