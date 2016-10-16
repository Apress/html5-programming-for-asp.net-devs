using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CustomData
{
    public partial class CustomValidationMessages : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        public string GetValidationMessage(string errorCode)
        {
            ValidationDbEntities db = new ValidationDbEntities();

            var data = from item in db.ErrorMessages
                        where item.ErrorCode == errorCode
                        select item.ErrorMessageText;
            return data.SingleOrDefault();
        }

        protected void Repeater1_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                TextBox txtBirthDate = (TextBox)e.Item.FindControl("txtBirthDate");
                DateTime dtBirthDate = DateTime.Parse(((TextBox)e.Item.FindControl("txtBirthDate")).Text);
                txtBirthDate.Text = dtBirthDate.ToString("yyyy-MM-dd");

                TextBox txtHireDate = (TextBox)e.Item.FindControl("txtHireDate");
                DateTime dtHireDate = DateTime.Parse(((TextBox)e.Item.FindControl("txtHireDate")).Text);
                txtHireDate.Text = dtHireDate.ToString("yyyy-MM-dd");
            }
        }
    }
}