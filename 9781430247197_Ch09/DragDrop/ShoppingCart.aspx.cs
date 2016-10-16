using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Services;
using ShoppingCartModel;

public partial class _Default : System.Web.UI.Page
{
    [WebMethod]
    public static string PlaceOrder(string[] products)
    {
        Guid orderId = Guid.NewGuid();
        ShoppingCartEntities db = new ShoppingCartEntities();
        foreach (string p in products)
        {
            Order order = new Order();
            order.OrderId = orderId;
            order.ProductName = p;
            order.Qty = 1;
            db.Orders.AddObject(order);
        }
        db.SaveChanges();
        return "Order with " + products.Length.ToString() + " products has been added!";
    }

    protected void Page_Load(object sender, EventArgs e)
    {

    }
}