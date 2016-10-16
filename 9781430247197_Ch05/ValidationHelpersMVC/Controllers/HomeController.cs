using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Text.RegularExpressions;

namespace ValidationHelpersMVC.Controllers
{
    public class HomeController : Controller
    {

        public ActionResult Index()
        {
            return View();
        }

        [HttpPost]
        public ActionResult Index(FormCollection form)
        {
            if (form["FirstName"].Length < 3 || form["firstname"].Length > 50)
            {
                ModelState.AddModelError("FirstName", "Invalid First Name. Must be between 3 and 50 characters.");
            }
            if (form["LastName"].Length < 3 || form["LastName"].Length > 50)
            {
                ModelState.AddModelError("LastName", "Invalid Last Name. Must be between 3 and 50 characters.");
            }
            if (form["Email"].Length <= 0)
            {
                ModelState.AddModelError("Email", "Please enter Email Address.");
            }
            if (!Regex.IsMatch(form["Email"], @"\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"))
            {
                ModelState.AddModelError("Email", "Invalid Email Address.");
            }
            return View();
        }

    }
}
