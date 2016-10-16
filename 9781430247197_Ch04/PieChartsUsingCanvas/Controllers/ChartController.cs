using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using PieChartsUsingCanvas.Models;
using System.IO;

namespace PieChartsUsingCanvas.Controllers
{
    public class ChartController : Controller
    {
        public ActionResult Index()
        {
            return View();
        }

        [HttpPost]
        public JsonResult SaveChart(string data, ChartMaster master, ChartDetail[] details)
        {
            Guid id = Guid.NewGuid();
            string path = HttpContext.Server.MapPath("~/images/" + id.ToString() + ".png");
            byte[] binaryData = Convert.FromBase64String(data);
            FileStream file = new FileStream(path, FileMode.Create);
            BinaryWriter bw = new BinaryWriter(file);
            bw.Write(binaryData);
            bw.Close();
            
            ChartDbEntities db = new ChartDbEntities();
            master.Id = id;
            master.ImageUrl = "~/images/" + id.ToString() + ".png";
            db.ChartMasters.AddObject(master);
            foreach (ChartDetail detail in details)
            {
                detail.ChartId = master.Id;
                db.ChartDetails.AddObject(detail);
            }
            db.SaveChanges();
            return Json("Chart saved in the database!");
        }

    }
}
