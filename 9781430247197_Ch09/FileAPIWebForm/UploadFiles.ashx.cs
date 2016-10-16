using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace FileAPIWebForm
{
    public class UploadFiles : IHttpHandler
    {

            public void ProcessRequest(HttpContext context)
            {
                if (context.Request.Files.Count > 0)
                {
                    HttpFileCollection files = context.Request.Files;
                    foreach (string key in files)
                    {
                        HttpPostedFile file = files[key];
                        string fileName = file.FileName;
                        fileName = context.Server.MapPath("~/uploads/" + fileName);
                        file.SaveAs(fileName);
                    }
                }
                context.Response.ContentType = "text/plain";
                context.Response.Write("File Uploaded Successfully!");
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