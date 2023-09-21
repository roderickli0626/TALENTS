using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TALENTS.Controller;
using TALENTS.Models;
using TALENTS.Util;

namespace TALENTS
{
    public partial class ModelHomeDetail : System.Web.UI.Page
    {
        private int modelId;
        protected void Page_Load(object sender, EventArgs e)
        {
            modelId = ParseUtil.TryParseInt(Request.Params["modelId"]) ?? 0;

            if (!IsPostBack)
            {
                LoadModelInfo();
            }
        }

        private void LoadModelInfo()
        {
            ModelCheck modelInfo = new ModelController().GetDashboardModelInfo(modelId);

            ModelSurname.InnerText = modelInfo.Name;
            ModelHeight.InnerText = modelInfo.Height.ToString();
            ModelWeight.InnerText = modelInfo.Weight.ToString();
            ModelEth.InnerText = modelInfo.Nationality;
            ModelResid.InnerText = modelInfo.CityResidence;
            ModelEye.InnerText = modelInfo.Eye;
            ModelHairColor.InnerText = modelInfo.HairColor;

            DefaultPhotoRepeater1.DataSource = modelInfo.ImageList;
            DefaultPhotoRepeater1.DataBind();
            DefaultPhotoRepeater2.DataSource = modelInfo.ImageList;
            DefaultPhotoRepeater2.DataBind();
        }
    }
}