using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using CustomValidation.Models;

namespace CustomValidation.Controllers
{
    public class HomeController : Controller
    {
        public ActionResult Index()
        {
            return View();
        }

        public JsonResult ValidateCustomerID(string id)
        {
            NorthwindEntities db = new NorthwindEntities();
            var data = from item in db.Customers
                        where item.CustomerID == id
                        select item;
            if (data.Count() <= 0)
            {
                return Json(false);
            }
            else
            {
                return Json(true);
            }
        }
    }
}
