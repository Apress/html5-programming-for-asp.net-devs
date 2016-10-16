using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using BasicHistory.Models;

namespace BasicHistory.Controllers
{
    public class AjaxHomeController : Controller
    {
        public ActionResult Index()
        {
            ImageDbEntities db = new ImageDbEntities();
            IQueryable<Image> data = null;

            data = (from item in db.Images
                    orderby item.Id ascending
                    select item).Take(1);

            return View(data.SingleOrDefault());
        }

        public JsonResult GetImage(int id,string direction)
        {
            ImageDbEntities db = new ImageDbEntities();
            IQueryable<Image> data = null;

            if (direction == "N")
            {
                data = (from item in db.Images
                        where item.Id > id
                        orderby item.Id ascending
                        select item).Take(1);
            }

            if (direction == "P")
            {
                data=(from item in db.Images
                        where item.Id < id
                        orderby item.Id descending
                        select item).Take(1);
            }

            if (direction == "")
            {
                data = from item in db.Images
                        where item.Id == id
                        select item;
            }

            return Json(data.SingleOrDefault());
        }

    }
}
