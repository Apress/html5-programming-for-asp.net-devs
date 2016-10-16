using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using SampleAppMVC.Models;

namespace SampleAppMVC.Controllers
{
    public class UserController : Controller
    {
        public ActionResult Index()
        {
            return View();
        }

        [HttpPost]
        public ActionResult Index(User user)
        {
            if (ModelState.IsValid)
            {
                UserDbEntities db = new UserDbEntities();
                db.Users.AddObject(user);
                db.SaveChanges();
                return View("Success");
            }
            else
            {
                return View("Index", user);
            }
        }

        [HttpPost]
        public JsonResult IsDuplicateEmail(string email)
        {
            UserDbEntities db = new UserDbEntities();
            var data = from item in db.Users
                        where item.Email == email
                        select item;
            bool flag=false;
            if (data.Count() > 0)
            {
                flag = true;
            }
            return Json(flag);
        }

        [HttpPost]
        public JsonResult IsDuplicateDisplayName(string displayname)
        {
            UserDbEntities db = new UserDbEntities();
            var data = from item in db.Users
                        where item.DisplayName == displayname
                        select item;
            bool flag = false;
            if (data.Count() > 0)
            {
                flag = true;
            }
            return Json(flag);
        }

    }
}
