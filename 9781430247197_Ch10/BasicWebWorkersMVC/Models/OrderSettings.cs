using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BasicWebWorkersMVC.Models
{
    public class OrderSettings
    {
        public string CustomerID { get; set; }
        public DateTime StartDate { get; set; }
        public DateTime EndDate { get; set; }
    }
}