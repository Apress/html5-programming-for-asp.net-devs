using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.Text;   
using System.ServiceModel.Web;

namespace AJAXWebForm
{
    [ServiceContract]
    public interface IService
    {
        [OperationContract]
        [WebInvoke(Method = "POST", RequestFormat = WebMessageFormat.Json, ResponseFormat = WebMessageFormat.Json)]
        TemperatureData Convert(TemperatureData t);

    }

    public class Service : IService
    {
        public TemperatureData Convert(TemperatureData t)
        {
            if (t.Unit == "C")
            {
                t.Value = (t.Value * 1.8m) + 32;
                t.Unit = "F";
            }
            else
            {
                t.Value = (t.Value - 32) / 1.8m;
                t.Unit = "C";
            }
            return t;
        }

    }

    [DataContract]
    public class TemperatureData
    {
        [DataMember]
        public decimal Value { get; set; }
        [DataMember]
        public string Unit { get; set; }
    }
}