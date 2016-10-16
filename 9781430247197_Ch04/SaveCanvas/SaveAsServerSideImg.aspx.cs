using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Services;
using System.IO;

namespace SaveCanvas
{
    public partial class SaveAsServerSideImg : System.Web.UI.Page
    {
        [WebMethod]
        public static void SaveAsImageFile(string data)
        {
            Guid id = Guid.NewGuid();
            string path = HttpContext.Current.Server.MapPath("~/images/" + id.ToString() + ".png");
            byte[] binaryData = Convert.FromBase64String(data);
            FileStream file = new FileStream(path, FileMode.Create);
            BinaryWriter bw = new BinaryWriter(file);
            bw.Write(binaryData);
            bw.Close();
        }

        protected void Page_Load(object sender, EventArgs e)
        {

        }
    }
}