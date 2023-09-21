using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Policy;
using System.Web;

namespace TALENTS.Models
{
    public class ModelCheck
    {
        private ModBiography biography = null;
        public ModelCheck() { }
        public ModelCheck(ModBiography biography) 
        {
            this.biography = biography;

            if (biography == null) return;
            Id = biography.ModelId;
            Name = biography.Name;
            CityResidence = biography.City.Description;
            Height = biography.Height ?? 0;
            Weight = biography.Weight ?? 0;
            Age = biography.Age ?? 0;
            Nationality = biography.Nationality.Description;
            Eye = biography.Eye.Description;
            HairColor = biography.HairColor.Description;
        }

        public int Id
        {
            get; set;
        }

        public string Name
        {
            get; set;
        }
        public string CityResidence
        {
            get; set;
        }
        public int Age 
        {
            get; set;
        }
        public double Height
        {
            get; set;
        }
        public double Weight
        {
            get; set;
        }
        public string Nationality
        {
            get; set;
        }
        public string Eye
        {
            get; set;
        }
        public string HairColor
        {
            get; set;
        }
        public string Image
        {
            get; set;
        }
        public List<ModPhoto> ImageList { get; set; }

    }
}