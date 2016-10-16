using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Example_03
{
    public partial class WebForm2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            List<Download> items = new List<Download>();
            items.Add(new Download("SQL Server Backup Tool","products/Product1Setup.exe"));
            items.Add(new Download("Visual Studio Add-In","products/Product2Setup.exe"));
            items.Add(new Download("Understanding DNA Architecture","Paper-Topic1.pdf"));
            items.Add(new Download("In-depth XML and JSON Serialization","Paper-Topic2.pdf"));
            items.Add(new Download("Data Access Component","Component1-comp.zip"));
            items.Add(new Download("Mass Mailing Component","Component2-comp.zip"));

            GridView1.DataSource = items;
            GridView1.DataBind();
        }
    }




    public class Download
    {
        public Download()
        {
        }
        public Download(string title, string url)
        {
            this.Title = title;
            this.URL = url;
        }
        public string Title { get; set; }
        public string URL { get; set; }
    }

}