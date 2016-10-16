using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using BasicWebWorkersMVC.Models;
using System.Data.Objects.SqlClient;

namespace BasicWebWorkersMVC.Controllers
{
    public class HomeController : Controller
    {
        public ActionResult Index()
        {
            return View();
        }




        public ActionResult SharedWorkerIndex()
        {
            return View();
        }

        [HttpPost]
        public JsonResult GetOrders(OrderSettings settings)
        {
            NorthwindEntities1 db = new NorthwindEntities1();
            var data = from item in db.Orders
                       join item2 in db.Order_Details on item.OrderID equals item2.OrderID
                       where
                       item.CustomerID == settings.CustomerID
                       &&
                       item.OrderDate >= settings.StartDate
                       &&
                       item.OrderDate <= settings.EndDate
                       orderby item.OrderID ascending
                       select new { item.CustomerID, item.OrderID,item.OrderDate, item2.UnitPrice, item2.Quantity };
            return Json(data.ToArray());
                                   

        }

        //public static bool IsOrderDateInRange(DateTime orderdate, DateTime startdate, DateTime enddate)
        //{
        //    DateTime temp = orderdate.AddYears(startdate.Year - enddate.Year);
        //    if (temp < startdate)
        //        temp = temp.AddYears(1);
        //    return orderdate <= enddate && temp >= startdate && temp <= enddate;
        //}

    }
}
