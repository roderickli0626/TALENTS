using Microsoft.Ajax.Utilities;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TALENTS.Controller;
using TALENTS.DAO;
using TALENTS.Models;
using TALENTS.Util;

namespace TALENTS
{
    public partial class Dashboard : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            ModelController modelController = new ModelController();
            HfModelInfo.Value = JsonConvert.SerializeObject(modelController.SearchDashboardModels(0));

            if (!IsPostBack)
            {
                LoadCity();
                LoadModelPhotos();
            }
        }

        private void LoadCity()
        {
            List<City> cities = new List<City>();
            cities = new CityDAO().FindAll();
            ComboCity.Items.Clear();
            ControlUtil.DataBind(ComboCity, cities, "Id", "Description", 0, "[tutte]");
        }

        private void LoadModelPhotos()
        {
            int cityId = ControlUtil.GetSelectedValue(ComboCity) ?? 0;
            ModelController modelController = new ModelController();
            List<ModelCheck> modelList = modelController.SearchDashboardModels(cityId);
            ModelPhotoRepeater.DataSource = modelList;
            ModelPhotoRepeater.DataBind();
        }

        protected void BtnSearch_Click(object sender, EventArgs e)
        {
            LoadModelPhotos();
        }
    }
}