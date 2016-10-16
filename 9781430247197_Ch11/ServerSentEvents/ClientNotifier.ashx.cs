using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ServerSentEvents
{
    public class ClientNotifier : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            HttpResponse Response = context.Response;
            DateTime startDate = DateTime.Now;
            Response.ContentType = "text/event-stream";
            while (startDate.AddMinutes(1) > DateTime.Now)
            {
                Response.Write(string.Format("data: {0}\n\n", DateTime.Now.ToString("hh:mm:ss")));
                Response.Flush();
                System.Threading.Thread.Sleep(15000);
            }
            Response.Close();
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