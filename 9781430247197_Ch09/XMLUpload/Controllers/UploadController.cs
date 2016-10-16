using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Xml;
using System.Xml.Schema;
using System.IO;
using System.Text;

namespace XMLUpload.Controllers
{
    public class UploadController : Controller
    {
        public ActionResult Index()
        {
            return View();
        }

        public List<string> errors = new List<string>();

        [HttpPost]
        public JsonResult UploadFiles()
        {
            if (Request.Files.Count > 0)
            {
                HttpFileCollectionBase files = Request.Files;
                foreach (string key in files)
                {
                    HttpPostedFileBase file = files[key];
                    string fileName = file.FileName;
                    fileName = Server.MapPath("~/Content/Uploads/" + fileName);
                    file.SaveAs(fileName);

                    XmlReaderSettings settings = new XmlReaderSettings();
                    settings.Schemas.Add("", Server.MapPath("~/Content/Employees.xsd"));
                    settings.ValidationType = ValidationType.Schema;
                    settings.ValidationEventHandler += OnValidationError;
                    XmlReader reader = XmlReader.Create(fileName, settings);
                    while (reader.Read())
                    {

                    }
                    reader.Close();
                }
            }
            Response.ContentType = "text/plain";
            StringBuilder sb = new StringBuilder();
            sb.Append("<ul>");
            foreach (string error in errors)
            {
                sb.Append("<li>" + error + "</li>");
            }
            sb.Append("</ul>");
            return Json(sb.ToString());
        }

        void OnValidationError(object sender, ValidationEventArgs e)
        {
            string fileName = Path.GetFileName(((XmlReader)sender).BaseURI);
            errors.Add(fileName + " encountered an error - " + e.Exception.Message);
        }
    }
}
