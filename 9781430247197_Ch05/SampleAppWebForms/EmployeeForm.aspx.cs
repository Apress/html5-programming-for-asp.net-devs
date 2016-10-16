using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SampleAppWebForms.Model;
using System.Web.Services;

namespace SampleAppWebForms
{
    public partial class EmployeeForm : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        [WebMethod]
        public static string[] GetTitles()
        {
            NorthwindEntities db=new NorthwindEntities();
            var data = (from item in db.Employees
                        select item.Title).Distinct();
            return data.ToArray();
        }

        public IQueryable<Employee> GetEmployees()
        {
            NorthwindEntities db = new NorthwindEntities();
            var data = from item in db.Employees
                        orderby item.EmployeeID
                        select item;
            return data;
        }

        public void InsertEmployee(Employee e)
        {
            NorthwindEntities db = new NorthwindEntities();
            db.Employees.AddObject(e);
            db.SaveChanges();
        }

        public void UpdateEmployee(Employee e)
        {
            NorthwindEntities db = new NorthwindEntities();
            var data = from item in db.Employees
                        where item.EmployeeID == e.EmployeeID
                        select item;

            Employee obj = data.SingleOrDefault();
            obj.TitleOfCourtesy = e.TitleOfCourtesy;
            obj.FirstName = e.FirstName;
            obj.LastName = e.LastName;
            obj.BirthDate = e.BirthDate;

            obj.Title = e.Title;
            obj.HireDate = e.HireDate;

            obj.Address = e.Address;
            obj.City = e.City;
            obj.Country = e.Country;
            obj.HomePhone = e.HomePhone;

            db.SaveChanges();
        }

        public void DeleteEmployee(Employee e)
        {
            NorthwindEntities db = new NorthwindEntities();
            var data = from item in db.Employees
                        where item.EmployeeID == e.EmployeeID
                        select item;
            Employee obj = data.SingleOrDefault();
            db.DeleteObject(obj);
            db.SaveChanges();
        }

protected void FormView1_DataBound(object sender, EventArgs e)
{
    if(FormView1.CurrentMode == FormViewMode.Edit)
    {
        DateTime dtBirthDate= ((Employee)FormView1.DataItem).BirthDate.GetValueOrDefault();
        DateTime dtHireDate = ((Employee)FormView1.DataItem).HireDate.GetValueOrDefault();
        TextBox txtBirthDate= (TextBox)FormView1.FindControl("txtBirthDate");
        TextBox txtHireDate = (TextBox)FormView1.FindControl("txtHireDate");
        txtBirthDate.Text = dtBirthDate.ToString("yyyy-MM-dd");
        txtHireDate.Text = dtHireDate.ToString("yyyy-MM-dd");
    }
}

        protected void FormView1_ItemUpdating(object sender, FormViewUpdateEventArgs e)
        {
            
        }

    }
}