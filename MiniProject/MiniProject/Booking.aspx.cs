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
            txtName.Text = Session["Name"].ToString();
            txtEmail.Text = Session["Email"].ToString();
            txtPhoneNumber.Text = Session["PhoneNumber"].ToString();
            txtDistrict.Text = Session["District"].ToString();
            txtPincode.Text = Session["Pincode"].ToString();
        }
        public void DishesBooking()
        {
            int userID = Convert.ToInt32(Session["UserID"]);
            string name = txtName.Text.Trim();
            string email = txtEmail.Text.Trim();
            string phoneNumber = txtPhoneNumber.Text.Trim();
            string district = txtDistrict.Text.Trim();
            string pincode = txtPincode.Text.Trim();

            string result = user.Booking(userID, name, email, phoneNumber, district, pincode);
            if (result == "Success")
            {
                Session["UserID"] = userID;
                Session["Name"] = name;
                Session["Email"] = email;
                Session["PhoneNumber"] = phoneNumber;
                Session["District"] = district;
                Session["Pincode"] = pincode;
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