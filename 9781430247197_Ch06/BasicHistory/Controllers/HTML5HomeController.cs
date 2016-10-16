using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using BasicHistory.Models;

namespace BasicHistory.Controllers
{
    public class HTML5HomeController : Controller
    {

        public ActionResult Index(int id=0)
        {
            ImageDbEntities db = new ImageDbEntities();
            IQueryable<Image> data = null;
            if (id == 0)
            {
                data = (from item in db.Images
                        orderby item.Id ascending
                        select item).Take(1);
            }
            else
            {
                data = from item in db.Images
                        where item.Id == id
                        select item;
            }
            return View(data.SingleOrDefault());
        }

        public JsonResult GetImage(int id, string direction)
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
                data = (from item in db.Images
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
