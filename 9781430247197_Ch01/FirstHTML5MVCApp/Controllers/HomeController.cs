using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Example_04.Controllers
{
    public class HomeController : Controller
    {

        public ActionResult Index()
        {
            return View();
        }

        public JsonResult SaveCanvas(string data)
        {
            //add code to store canvas data in some database
            Session["canvas_data"] = data;
            return Json("Canvas data stored successfully!");
        }
    }
}
