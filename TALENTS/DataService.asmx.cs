using System;
using System.Collections.Generic;
using System.Globalization;
using System.IO;
using System.Linq;
using System.Reflection;
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
        public void AdminFindPhotos(int draw, int start, int length, int modelId)
        {
            Model model = loginSystem.GetCurrentUserAccount();
            if (!loginSystem.IsSuperAdminLoggedIn() && (model == null || !loginSystem.IsAdminLoggedIn())) return;

            PhotoController photoController = new PhotoController();
            SearchResult searchResult = photoController.SearchModPhotos(start, length, modelId);

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
        public void AdminSavePhoto()
        {
            HttpResponse Response = Context.Response;
            ProcResult result = new ProcResult();
            Response.ContentType = "application/json; charset=utf-8";

            Model model = loginSystem.GetCurrentUserAccount();
            if (!loginSystem.IsSuperAdminLoggedIn() && (model == null || !loginSystem.IsAdminLoggedIn()))
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
                int modelId = ParseUtil.TryParseInt(HttpContext.Current.Request.Params["modelId"]) ?? 0;
                // Save each file to a specific location on the server
                for (int i = 0; i < files.Count; i++)
                {
                    HttpPostedFile file = files[i];
                    string fileName = Path.GetFileName(file.FileName);
                    string filePath = Server.MapPath("~/Upload/Photos/") + fileName;
                    file.SaveAs(filePath);

                    result.success = new PhotoController().SaveModPhoto(modelId, groupId, fileName);
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

        [WebMethod(EnableSession = true)]
        [ScriptMethod(UseHttpGet = true, ResponseFormat = ResponseFormat.Json)]
        public void AdminDeletePhoto(int id)
        {
            //Is Logged in?
            Model model = loginSystem.GetCurrentUserAccount();
            if (!loginSystem.IsSuperAdminLoggedIn() && (model == null || !loginSystem.IsAdminLoggedIn())) return;
            bool success = new ModPhotoDAO().Delete(id);
            ResponseProc(success, "");
        }

        [WebMethod(EnableSession = true)]
        [ScriptMethod(UseHttpGet = true, ResponseFormat = ResponseFormat.Json)]
        public void SaveVideo()
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
                // Save each file to a specific location on the server
                for (int i = 0; i < files.Count; i++)
                {
                    HttpPostedFile file = files[i];
                    string fileName = Path.GetFileName(file.FileName);
                    string filePath = Server.MapPath("~/Upload/Videos/") + fileName;
                    file.SaveAs(filePath);

                    ModVideo modVideo = new ModVideo();
                    modVideo.ModelId = model.Id;
                    modVideo.Video = fileName;
                    result.success = new ModVideoDAO().Insert(modVideo);
                }

                Response.Write(serializer.Serialize(result));
            }
            catch (Exception ex)
            {
                return;
            }
        }

        [WebMethod(EnableSession = true)]
        [ScriptMethod(UseHttpGet = true, ResponseFormat = ResponseFormat.Json)]
        public void AdminSaveVideo()
        {
            HttpResponse Response = Context.Response;
            ProcResult result = new ProcResult();
            Response.ContentType = "application/json; charset=utf-8";

            Model model = loginSystem.GetCurrentUserAccount();
            if (!loginSystem.IsSuperAdminLoggedIn() && (model == null || !loginSystem.IsAdminLoggedIn()))
            {
                Response.Write(serializer.Serialize(result));
                return;
            }

            try
            {
                // Access the FormData object sent in the AJAX request
                HttpFileCollection files = HttpContext.Current.Request.Files;
                int modelId = ParseUtil.TryParseInt(HttpContext.Current.Request.Params["modelId"]) ?? 0;
                // Save each file to a specific location on the server
                for (int i = 0; i < files.Count; i++)
                {
                    HttpPostedFile file = files[i];
                    string fileName = Path.GetFileName(file.FileName);
                    string filePath = Server.MapPath("~/Upload/Videos/") + fileName;
                    file.SaveAs(filePath);

                    ModVideo modVideo = new ModVideo();
                    modVideo.ModelId = modelId;
                    modVideo.Video = fileName;
                    result.success = new ModVideoDAO().Insert(modVideo);
                }

                Response.Write(serializer.Serialize(result));
            }
            catch (Exception ex)
            {
                return;
            }
        }

        [WebMethod(EnableSession = true)]
        [ScriptMethod(UseHttpGet = true, ResponseFormat = ResponseFormat.Json)]
        public void SaveNaturalPhotos()
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
                // Save each file to a specific location on the server
                for (int i = 0; i < files.Count; i++)
                {
                    HttpPostedFile file = files[i];
                    string fileName = Path.GetFileName(file.FileName);
                    string filePath = Server.MapPath("~/Upload/NaturalPhotos/") + fileName;
                    file.SaveAs(filePath);

                    ModNaturalPhoto modNaturalPhoto = new ModNaturalPhoto();
                    modNaturalPhoto.ModelId = model.Id;
                    modNaturalPhoto.Image = fileName;
                    result.success = new ModNaturalPhotoDAO().Insert(modNaturalPhoto);
                }

                Response.Write(serializer.Serialize(result));
            }
            catch (Exception ex)
            {
                return;
            }
        }

        [WebMethod(EnableSession = true)]
        [ScriptMethod(UseHttpGet = true, ResponseFormat = ResponseFormat.Json)]
        public void AdminSaveNaturalPhotos()
        {
            HttpResponse Response = Context.Response;
            ProcResult result = new ProcResult();
            Response.ContentType = "application/json; charset=utf-8";

            Model model = loginSystem.GetCurrentUserAccount();
            if (!loginSystem.IsSuperAdminLoggedIn() && (model == null || !loginSystem.IsAdminLoggedIn()))
            {
                Response.Write(serializer.Serialize(result));
                return;
            }

            try
            {
                // Access the FormData object sent in the AJAX request
                HttpFileCollection files = HttpContext.Current.Request.Files;
                int modelId = ParseUtil.TryParseInt(HttpContext.Current.Request.Params["modelId"]) ?? 0;
                // Save each file to a specific location on the server
                for (int i = 0; i < files.Count; i++)
                {
                    HttpPostedFile file = files[i];
                    string fileName = Path.GetFileName(file.FileName);
                    string filePath = Server.MapPath("~/Upload/NaturalPhotos/") + fileName;
                    file.SaveAs(filePath);

                    ModNaturalPhoto modNaturalPhoto = new ModNaturalPhoto();
                    modNaturalPhoto.ModelId = modelId;
                    modNaturalPhoto.Image = fileName;
                    result.success = new ModNaturalPhotoDAO().Insert(modNaturalPhoto);
                }

                Response.Write(serializer.Serialize(result));
            }
            catch (Exception ex)
            {
                return;
            }
        }

        [WebMethod(EnableSession = true)]
        [ScriptMethod(UseHttpGet = true, ResponseFormat = ResponseFormat.Json)]
        public void FindModels(int draw, int start, int length, string searchVal)
        {
            Model model = loginSystem.GetCurrentUserAccount();
            if (!loginSystem.IsSuperAdminLoggedIn() && (model == null || !loginSystem.IsAdminLoggedIn())) return;

            ModelController modelController = new ModelController();
            SearchResult searchResult = modelController.SearchModels(start, length, searchVal);

            JSDataTable result = new JSDataTable();
            result.data = (IEnumerable<object>)searchResult.ResultList;
            result.draw = draw;
            result.recordsTotal = searchResult.TotalCount;
            result.recordsFiltered = searchResult.TotalCount;

            ResponseJson(result);
        }

        [WebMethod(EnableSession = true)]
        [ScriptMethod(UseHttpGet = true, ResponseFormat = ResponseFormat.Json)]
        public void AdminDeleteModel(int id)
        {
            //Is Logged in?
            Model model = loginSystem.GetCurrentUserAccount();
            if (!loginSystem.IsSuperAdminLoggedIn() && (model == null || !loginSystem.IsAdminLoggedIn())) return;

            ModelController modelController = new ModelController();
            bool success = modelController.DeleteModel(id);

            ResponseProc(success, "");
        }

        [WebMethod(EnableSession = true)]
        [ScriptMethod(UseHttpGet = true, ResponseFormat = ResponseFormat.Json)]
        public void FindUsers(int draw, int start, int length, string searchVal)
        {
            Model model = loginSystem.GetCurrentUserAccount();
            if (!loginSystem.IsSuperAdminLoggedIn() && (model == null || !loginSystem.IsAdminLoggedIn())) return;

            ModelController modelController = new ModelController();
            SearchResult searchResult = modelController.SearchUsers(start, length, searchVal);

            JSDataTable result = new JSDataTable();
            result.data = (IEnumerable<object>)searchResult.ResultList;
            result.draw = draw;
            result.recordsTotal = searchResult.TotalCount;
            result.recordsFiltered = searchResult.TotalCount;

            ResponseJson(result);
        }

        [WebMethod(EnableSession = true)]
        [ScriptMethod(UseHttpGet = true, ResponseFormat = ResponseFormat.Json)]
        public void AdminDeleteUser(int id)
        {
            //Is Logged in?
            Model model = loginSystem.GetCurrentUserAccount();
            if (!loginSystem.IsSuperAdminLoggedIn() && (model == null || !loginSystem.IsAdminLoggedIn())) return;

            ModelController modelController = new ModelController();
            bool success = modelController.DeleteModel(id);

            ResponseProc(success, "");
        }

        [WebMethod(EnableSession = true)]
        [ScriptMethod(UseHttpGet = true, ResponseFormat = ResponseFormat.Json)]
        public void FindAdmins(int draw, int start, int length, string searchVal)
        {
            Model model = loginSystem.GetCurrentUserAccount();
            if (!loginSystem.IsSuperAdminLoggedIn()) return;

            ModelController modelController = new ModelController();
            SearchResult searchResult = modelController.SearchAdmins(start, length, searchVal);

            JSDataTable result = new JSDataTable();
            result.data = (IEnumerable<object>)searchResult.ResultList;
            result.draw = draw;
            result.recordsTotal = searchResult.TotalCount;
            result.recordsFiltered = searchResult.TotalCount;

            ResponseJson(result);
        }

        [WebMethod(EnableSession = true)]
        [ScriptMethod(UseHttpGet = true, ResponseFormat = ResponseFormat.Json)]
        public void AdminDeleteAdmin(int id)
        {
            //Is Logged in?
            Model model = loginSystem.GetCurrentUserAccount();
            if (!loginSystem.IsSuperAdminLoggedIn()) return;

            ModelController modelController = new ModelController();
            bool success = modelController.DeleteModel(id);

            ResponseProc(success, "");
        }

        [WebMethod(EnableSession = true)]
        [ScriptMethod(UseHttpGet = true, ResponseFormat = ResponseFormat.Json)]
        public void FindNotices(int draw, int start, int length, string searchVal)
        {
            Model model = loginSystem.GetCurrentUserAccount();
            if (model == null || !loginSystem.IsModelLoggedIn()) return;

            NoticeController noticeController = new NoticeController();
            SearchResult searchResult = noticeController.SearchNotices(start, length, searchVal);

            JSDataTable result = new JSDataTable();
            result.data = (IEnumerable<object>)searchResult.ResultList;
            result.draw = draw;
            result.recordsTotal = searchResult.TotalCount;
            result.recordsFiltered = searchResult.TotalCount;

            ResponseJson(result);
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
