using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;

namespace AJAXWebForm
{
    public class Handler : IHttpHandler
    {
        public void ProcessRequest(HttpContext context)
        {
            decimal value = Convert.ToDecimal(context.Request["Value"]);
            string unit = Convert.ToString(context.Request["Unit"]);
            TemperatureData t = new TemperatureData();
            if (unit == "C")
            {
                t.Value = (value * 1.8m) + 32;
                t.Unit = "F";
            }
            else
            {
                t.Value = (value - 32) / 1.8m;
                t.Unit = "C";
            }
            JavaScriptSerializer json = new JavaScriptSerializer();
            string jsonString = json.Serialize(t);
            context.Response.ContentType = "application/json";
            context.Response.Write(jsonString);
        }

        public bool IsReusable
        {
            get
            {
                return false;
            }
        }
    }
}