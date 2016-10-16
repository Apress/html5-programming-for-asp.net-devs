using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Xml;
using System.Xml.Schema;
using System.IO;
using System.Text;


//As an alternative to Controller Action MEthod you can also use Geheric Handler to upload files

namespace XMLUpload.Controllers
{
    public class Validator : IHttpHandler
    {
        public List<string> errors = new List<string>();

        public void ProcessRequest(HttpContext context)
        {
            if (context.Request.Files.Count > 0)
            {
                HttpFileCollection files = context.Request.Files;
                foreach (string key in files)
                {
                    HttpPostedFile file = files[key];
                    string fileName = file.FileName;
                    fileName = context.Server.MapPath("~/Content/Uploads/" + fileName);
                    file.SaveAs(fileName);

                    XmlReaderSettings settings = new XmlReaderSettings();
                    settings.Schemas.Add("", context.Server.MapPath("~/Content/Employees.xsd"));
                    settings.ValidationType = ValidationType.Schema;
                    settings.ValidationEventHandler += settings_ValidationEventHandler;
                    XmlReader reader = XmlReader.Create(fileName, settings);
                    while (reader.Read())
                    {

                    }
                    reader.Close();
                }
            }
            context.Response.ContentType = "text/plain";
            StringBuilder sb = new StringBuilder();
            sb.Append("<ul>");
            foreach (string error in errors)
            {
                sb.Append("<li>" + error +"</li>");
            }
            sb.Append("</ul>");
            context.Response.Write(sb.ToString());
        }

        void settings_ValidationEventHandler(object sender, ValidationEventArgs e)
        {
            string fileName=Path.GetFileName(((XmlReader)sender).BaseURI);
            errors.Add(fileName + " encountered an error - " + e.Exception.Message);
        }

        public bool IsReusable
        {
            get
            {
                return false;
            }
        }
    }
}