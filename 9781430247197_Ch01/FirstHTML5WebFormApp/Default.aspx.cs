using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Services;

namespace Example_03
{
    public partial class Default : System.Web.UI.Page
    {

        [WebMethod]
        public static string GetAudio()
        {
            //write logic to return random audio file
            return "audio1.mp3";
        }

        [WebMethod]
        public static string GetVideo()
        {
            //write logic to return random video file
            return "video1.mp4";
        }

        protected void Page_Load(object sender, EventArgs e)
        {

        }
    }
}