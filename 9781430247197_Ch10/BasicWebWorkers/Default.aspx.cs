using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Services;


namespace BasicWebWorkers
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        [WebMethod]
        public static string GetCustomerData(string customerid)
        {
            return "Hello World!";
        }

        //[WebMethod]
        //public static Order[] GetCustomerData(string customerid)
        //{
        //    NorthwindEntities db=new NorthwindEntities();

        //    var data = from item in db.Orders
        //               where item.CustomerID == customerid
        //               select item;
        //    return data.ToArray();
        //}
    }
}