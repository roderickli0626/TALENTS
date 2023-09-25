using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.Script.Services;
using System.Web.Services;
using TALENTS.Controller;
using TALENTS.DAO;
using TALENTS.Models;
using TALENTS.Util;

namespace TALENTS
{
    /// <summary>
    /// Summary description for DataService
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    // [System.Web.Script.Services.ScriptService]
    public class DataService : System.Web.Services.WebService
    {
        LoginController loginSystem = new LoginController();
        private JavaScriptSerializer serializer = new JavaScriptSerializer();

        [WebMethod(EnableSession = true)]
        [ScriptMethod(UseHttpGet = true, ResponseFormat = ResponseFormat.Json)]
        public void FindPhotos(int draw, int start, int length)
        {
            Model model = loginSystem.GetCurrentUserAccount();
            if (model == null || !loginSystem.IsModelLoggedIn()) return;

            PhotoController photoController = new PhotoController();
            SearchResult searchResult = photoController.SearchModPhotos(start, length, model.Id);

            JSDataTable result = new JSDataTable();
            result.data = (IEnumerable<object>)searchResult.ResultList;
            result.draw = draw;
            result.recordsTotal = searchResult.TotalCount;
            result.recordsFiltered = searchResult.TotalCount;

            ResponseJson(result);
        }

        [WebMethod(EnableSession = true)]
        [ScriptMethod(UseHttpGet = true, ResponseFormat = ResponseFormat.Json)]
        public void SavePhoto()
        {
            HttpResponse Response = Context.Response;
            ProcResult result = new ProcResult();
            Response.ContentType = "application/json; charset=utf-8";

            Model model = loginSystem.GetCurrentUserAccount();
            if (model == null || !loginSystem.IsModelLoggedIn())
            {
                Response.Write(serializer.Serialize(result));
                return;
            }

            try
            {
                // Access the FormData object sent in the AJAX request
                HttpFileCollection files = HttpContext.Current.Request.Files;
                string groupIdS = HttpContext.Current.Request.Params["groupId"];
                int groupId = ParseUtil.TryParseInt(groupIdS) ?? 0;
                // Save each file to a specific location on the server
                for (int i = 0; i < files.Count; i++)
                {
                    HttpPostedFile file = files[i];
                    string fileName = Path.GetFileName(file.FileName);
                    string filePath = Server.MapPath("~/Upload/Photos/") + fileName;
                    file.SaveAs(filePath);

                    result.success = new PhotoController().SaveModPhoto(model.Id, groupId, fileName);
                }

                Response.Write(serializer.Serialize(result));
            }
            catch (Exception ex)
            {
                result.success = false;
                Response.Write(serializer.Serialize(result));
            }
        }

        [WebMethod(EnableSession = true)]
        [ScriptMethod(UseHttpGet = true, ResponseFormat = ResponseFormat.Json)]
        public void DeletePhoto(int id)
        {
            //Is Logged in?
            if (!loginSystem.IsModelLoggedIn()) return;
            bool success = new ModPhotoDAO().Delete(id);
            ResponseProc(success, "");
        }

        protected void ResponseJson(Object result)
        {
            HttpResponse Response = Context.Response;
            Response.ContentType = "application/json; charset=utf-8";
            Response.Write(serializer.Serialize(result));
        }
        protected void ResponseJson(Object result, bool success)
        {
            HttpResponse Response = Context.Response;
            Response.ContentType = "application/json; charset=utf-8";
            Response.Write(serializer.Serialize(result));
            if (success)
            {
                Response.StatusCode = 200;
            }
            Response.Flush();
        }

        protected void ResponseProc(bool success, object data, string message = "")
        {
            ProcResult result = new ProcResult();
            result.success = success;
            result.data = data;
            result.message = message;
            ResponseJson(result, success);
        }
    }
}
