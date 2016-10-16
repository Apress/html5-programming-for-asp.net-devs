using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Device.Location;
using JobsLocation.Models;

namespace JobsLocation.Controllers
{
    public class HomeController : Controller
    {
        public ActionResult Index()
        {
            return View();
        }

        private double GetDistance(double lat1,double long1,double lat2,double long2)
        {
            GeoCoordinate point1 = new GeoCoordinate(lat1, long1);
            GeoCoordinate point2 = new GeoCoordinate(lat2, long2);
            double distance = point1.GetDistanceTo(point2); //in meters
            return distance;
        }

        [HttpPost]
        public JsonResult GetJobs(double lat1, double long1, double distance)
        {
            JobsDbEntities db = new JobsDbEntities();
            var data = from item in db.Jobs
                        select item;
            List<Job> selectedJobs = new List<Job>();

            foreach(Job job in data)
            {
                var temp = from item in db.Locations
                            where item.LocationName==job.LocationName
                            select item;

                double lat2 = (double)((Location)temp.SingleOrDefault()).Latitude;
                double long2 = (double)((Location)temp.SingleOrDefault()).Longitude;

                if (GetDistance(lat1, long1, lat2, long2) <= distance)
                {
                    selectedJobs.Add(job);
                }
            }
            var finalData = from obj in selectedJobs
                            orderby obj.LocationName
                            select obj;
            return Json(finalData);
        }


    }
}
