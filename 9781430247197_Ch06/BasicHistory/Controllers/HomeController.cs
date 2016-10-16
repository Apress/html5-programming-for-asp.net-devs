using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using BasicHistory.Models;

namespace BasicHistory.Controllers
{
    public class HomeController : Controller
    {
        public ActionResult Index(int id=0)
        {
            ImageDbEntities db = new ImageDbEntities();
            IQueryable<Image> data = null;
            int minId, maxId, prevId, nextId;
            minId = (from item in db.Images
                        orderby item.Id ascending
                        select item.Id).Min();

            maxId = (from item in db.Images
                        orderby item.Id ascending
                        select item.Id).Max();
            if (id == 0)
            {
                id = minId;
            }
            prevId = ((from item in db.Images
                        where item.Id < id
                        orderby item.Id descending
                        select item.Id).Take(1)).SingleOrDefault();
            if (prevId == 0)
            {
                prevId = minId;
            }
            nextId = ((from item in db.Images
                        where item.Id > id
                        orderby item.Id ascending
                        select item.Id).Take(1)).SingleOrDefault();
            if (nextId == 0)
            {
                nextId = maxId;
            }
            data = from item in db.Images
                    where item.Id == id
                    select item;
            ViewBag.PreviousId = prevId;
            ViewBag.NextId = nextId;
            return View(data.SingleOrDefault());
        }
    }
}
