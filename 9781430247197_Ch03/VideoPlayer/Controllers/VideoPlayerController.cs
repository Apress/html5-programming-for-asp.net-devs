using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using VideoPlayer.Models;

namespace VideoPlayer.Controllers
{
    public class VideoPlayerController : Controller
    {
        public ActionResult Index()
        {
            return View();
        }

        public JsonResult GetPlayList()
        {
            VideoDbEntities db=new VideoDbEntities();
            var data = from items in db.Videos
                        select items;
            return Json(data.ToArray());
        }

    }
}
