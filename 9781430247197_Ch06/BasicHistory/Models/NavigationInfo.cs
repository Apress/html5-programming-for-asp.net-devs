using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BasicHistory.Models
{
    public class NavigationInfo
    {
        public int MinId { get; set; }
        public int MaxId { get; set; }
        public int PreviousId { get; set; }
        public int NextId { get; set; }
    }
}