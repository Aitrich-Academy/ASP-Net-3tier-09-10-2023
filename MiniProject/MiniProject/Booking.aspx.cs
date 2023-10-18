using BLL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MiniProject
{
    public partial class Booking : System.Web.UI.Page
    {
        User user = new User();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                SetUserDetails();
            }
        }

        private void SetUserDetails()
        {
            if (Session["UserID"] != null)
            {
                Hidden.Value = Session["UserID"].ToString();
            }
            txtName.Text = Session["Name"].ToString();
            txtEmail.Text = Session["Email"].ToString();
            txtPhoneNumber.Text = Session["PhoneNumber"].ToString();
            txtDistrict.Text = Session["District"].ToString();
            txtPincode.Text = Session["Pincode"].ToString();
        }
        public void DishesBooking()
        {
            user.property.Id = Convert.ToInt32(Session["UserID"]);
            user.property.Name = txtName.Text.ToString();
            user.property.Email = txtEmail.Text.ToString();
            user.property.PhoneNumber = txtPhoneNumber.Text.ToString();
            user.property.District = txtDistrict.Text.ToString();
            user.property.Pincode = txtPincode.Text.ToString();
            string result = user.Booking();
            if (result == "Success")
            {
                Session["Name"] = user.property.Name;
                Session["Email"] = user.property.Email;
                Session["PhoneNumber"] = user.property.PhoneNumber;
                Session["District"] = user.property.District;
                Session["Pincode"] = user.property.Pincode;

                Response.Write("<script>alert('Booking successfully......👍😎'); window.location.href = 'UserWebForm.aspx'; </script>");
            }
            else
            {
                Response.Write("<script language='javascript'>alert('Error: Booking failed');</script>");
            }
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Write("<script>alert('Booking Cancelled...👎😒'); window.location.href = 'UserWebForm.aspx'; </script>");
        }

        protected void btnConfirm_Click(object sender, EventArgs e)
        {
            DishesBooking();
        }
    }
}