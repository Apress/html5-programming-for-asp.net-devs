using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Services;

namespace SaveCanvas
{
    public partial class SaveInSQLServer : System.Web.UI.Page
    {
        [WebMethod]
        public static void SaveToDb(string data)
        {
            ImageDbEntities db = new ImageDbEntities();
            Image img = new Image();
            img.ImageData = data;
            img.SaveDate = DateTime.Now;
            db.Images.AddObject(img);
            db.SaveChanges();
        }

        protected void Page_Load(object sender, EventArgs e)
        {

        }
    }
}