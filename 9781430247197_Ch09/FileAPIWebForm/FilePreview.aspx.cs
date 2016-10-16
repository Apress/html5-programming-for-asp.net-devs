using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FileAPIWebForm
{
    public partial class FilePreview : System.Web.UI.Page
    {
            protected void Page_Load(object sender, EventArgs e)
            {
                //if (Request.Files.Count >0)
                //{
                //    HttpFileCollection files = Request.Files;
                //    foreach (string key in files)
                //    {
                //        HttpPostedFile file = files[key];
                //        string fileName = file.FileName;
                //        fileName = Server.MapPath("~/uploads/" + fileName);
                //        file.SaveAs(fileName);
                //    }
                //}
                //foreach (HttpPostedFile file in FileUpload1.PostedFiles)
                //{
                //    string fileName = file.FileName;
                //    fileName = Server.MapPath("~/uploads/" + fileName);
                //    file.SaveAs(fileName);
                //}
            }

    }
}