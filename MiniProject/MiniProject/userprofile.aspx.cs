using BLL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MiniProject
{
    public partial class WebForm2 : System.Web.UI.Page
    {
        User user = new User();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserID"] != null)
            {
                HiddenId.Value = Session["UserID"].ToString();
            }
            SetUserDetails();
        }
        private void SetUserDetails()
        {
            TxtName.Text = Session["Name"].ToString();
            TxtEmail.Text = Session["Email"].ToString();
            TxtPhonenumber.Text = Session["PhoneNumber"].ToString();
            TxtDistrict.Text = Session["District"].ToString();
            TxtPincode.Text = Session["Pincode"].ToString();
           TxtPassword.Text = Session["PasswordHash"].ToString();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {

                UpdateUser();

        }
        private void UpdateUser()
        {
            user.property.Id = Convert.ToInt32(Session["UserID"]);
            user.property.Name = TxtName.Text.ToString();
            user.property.Email = TxtEmail.Text.ToString();
            user.property.PhoneNumber = TxtPhonenumber.Text.ToString();
            user.property.District = TxtDistrict.Text.ToString();
            user.property.Pincode = TxtPincode.Text.ToString();
            user.property.Password = TxtPassword.Text.ToString();

            string result = user.UpdateUser();

            if (result == "Success")
            {
                // If the update was successful, update the session variables
                Session["Name"] = user.property.Name;
                Session["Email"] = user.property.Email;
                Session["PhoneNumber"] = user.property.PhoneNumber;
                Session["District"] = user.property.District;
                Session["Pincode"] = user.property.Pincode;
                Session["PasswordHash"] = user.property.Password;

                Response.Write("<script>alert('Booking successfully......👍😎'); window.location.href = 'UserWebForm.aspx'; </script>");
            }
            else
            {

                Response.Write("<script language='javascript'>alert('Error: Booking failed');</script>");
            }
        }


        protected void Button2_Click(object sender, EventArgs e)
        {
            Clear();
        }
        private void Clear()
        {
            TxtName.Text = string.Empty;
            TxtEmail.Text = string.Empty;
            TxtPhonenumber.Text = string.Empty;
            TxtDistrict.Text = string.Empty;
            TxtPincode.Text = string.Empty;
            TxtPassword.Text = string.Empty;
        }

        protected void Button3_Click(object sender, EventArgs e)
        {

                DeleteUser();
 
        }

        private void DeleteUser()
        {
            user.property.Id = Convert.ToInt32(Session["UserID"]);
            string result = user.DeleteUser();
            if (result == "Success")
            {
                Session["Name"] = user.property.Name;
                Session["Email"] = user.property.Email;
                Session["PhoneNumber"] = user.property.PhoneNumber;
                Session["District"] = user.property.District;
                Session["Pincode"] = user.property.Pincode;
                Session["PasswordHash"] = user.property.Password;

                Response.Write("<script>alert('Delete successfully......👍😎'); window.location.href = 'UserWebForm.aspx'; </script>");


            }
            else
            {
                Response.Write("<script language='javascript'>alert('Error: Booking failed');</script>");
            }
        }
    }
}
