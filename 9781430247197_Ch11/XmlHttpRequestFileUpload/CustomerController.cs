using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace XmlHttpRequest
{
        public class CustomerController : ApiController
        {
            public IEnumerable<Customer> Get()
            {
                NorthwindEntities db = new NorthwindEntities();
                var data = from item in db.Customers
                            orderby item.CustomerID
                            select item;
                return data;
            }

            public Customer Get(string id)
            {
                NorthwindEntities db = new NorthwindEntities();
                var data = from item in db.Customers
                            where item.CustomerID == id
                            select item;
                return data.SingleOrDefault();
            }

            public void Post(Customer obj)
            {
                NorthwindEntities db = new NorthwindEntities();
                db.Customers.AddObject(obj);
                db.SaveChanges();
            }

        public void Put(string id, Customer obj)
        {
            NorthwindEntities db = new NorthwindEntities();
            var data = from item in db.Customers
                       where item.CustomerID == id
                       select item;
            Customer cust= data.SingleOrDefault();
            cust.CustomerID = obj.CustomerID;
            cust.CompanyName = obj.CompanyName;
            cust.ContactName = obj.ContactName;
            cust.Country = obj.Country;
            db.SaveChanges();
        }

        public void Delete(string id)
        {
            NorthwindEntities db = new NorthwindEntities();
            var data = from item in db.Customers
                       where item.CustomerID == id
                       select item;
            db.DeleteObject(data.SingleOrDefault());
            db.SaveChanges();
        }
    }
}