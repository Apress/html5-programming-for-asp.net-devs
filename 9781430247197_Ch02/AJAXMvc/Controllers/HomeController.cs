using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using AJAXMvc.Models;

namespace AJAXMvc.Controllers
{
    public class HomeController : Controller
    {
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult Ajax()
        {
            return View();
        }

        public JsonResult Convert(TemperatureData t)
        {
            if (t.Unit == "C")
            {
                t.Value = (t.Value * 1.8m) + 32;
                t.Unit = "F";
            }
            else
            {
                t.Value = (t.Value - 32) / 1.8m;
                t.Unit = "C";
            }
            return Json(t, JsonRequestBehavior.AllowGet);
        }

    }
}
