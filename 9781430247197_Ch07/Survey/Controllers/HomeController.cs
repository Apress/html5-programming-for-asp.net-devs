using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Survey.Models;
using Newtonsoft.Json;
using Newtonsoft.Json.Converters;
using Newtonsoft.Json.Serialization;
using System.IO;

namespace Survey.Controllers
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
            string jsonData = Request.Form["hiddenAnswers"];
            Dictionary<string, string> data = JsonConvert.DeserializeObject<Dictionary<string, string>>(jsonData);
            //save data here
            return Index();
        }


        public JsonResult GetQuestions()
        {
            SurveyDbEntities db = new SurveyDbEntities();
            var data = from item in db.Questions
                        select item;
            return Json(data.ToArray());
        }


        public JsonResult GetChoices()
        {
            SurveyDbEntities db = new SurveyDbEntities();
            var data = from item in db.Choices
                        select item;
            return Json(data.ToArray());
        }


        public JsonResult SaveResults()
        {
            string jsonData = string.Empty;
            using (StreamReader sr = new StreamReader(Request.InputStream))
            {
                jsonData = sr.ReadToEnd();
            }
            Dictionary<string, string> data = JsonConvert.DeserializeObject<Dictionary<string, string>>(jsonData);

            SurveyDbEntities db = new SurveyDbEntities();

            User usr = new User();
            usr.FirstName = data["FirstName"];
            usr.LastName = data["LastName"];
            usr.Email = data["Email"];
            db.Users.AddObject(usr);
            db.SaveChanges();

            string userEmail = data["Email"];
            int usrId = (from item in db.Users
                            where item.Email == userEmail
                            select item.UserID).SingleOrDefault();

            data.Remove("FirstName");
            data.Remove("LastName");
            data.Remove("Email");

            foreach (string str in data.Keys)
            {
                int choiceId = int.Parse(str);
                int questionId = int.Parse(data[str]);
                Result result = new Result();
                result.QuestionID = questionId;
                result.ChoiceID = choiceId;
                result.UserID = usrId;
                db.Results.AddObject(result);
            }
            db.SaveChanges();
            return Json("success");
        }


    }
}
