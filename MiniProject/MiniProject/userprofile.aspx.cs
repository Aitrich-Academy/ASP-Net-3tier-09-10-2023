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
            {
                SetUserDetails();
                if (Session["UserID"] != null)
                {
                    Hidden.Value = Session["UserID"].ToString();
                }
            }
        }
        private void SetUserDetails()
        {
            txtName.Text = Session["Name"].ToString();
            txtEmail.Text = Session["Email"].ToString();
            txtPhoneNumber.Text = Session["PhoneNumber"].ToString();
            txtDistrict.Text = Session["District"].ToString();
            txtPincode.Text = Session["Pincode"].ToString();
            txtPswd.Text = Session["PasswordHash"].ToString();
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            Update();
        }
        public void Update()
        {
            user.property.Id = Convert.ToInt32(Session["UserID"]);
            user.property.Name = txtName.Text.ToString();
            user.property.Email = txtEmail.Text.ToString();
            user.property.PhoneNumber = txtPhoneNumber.Text.ToString();
            user.property.District = txtDistrict.Text.ToString();
            user.property.Pincode = txtPincode.Text.ToString();
            user.property.Password = txtPswd.Text.ToString();

            string result = user.UserUpdate();
            if (result == "Success")
            {
                Session["Name"] = user.property.Name;
                Session["Email"] = user.property.Email;
                Session["PhoneNumber"] = user.property.PhoneNumber;
                Session["District"] = user.property.District;
                Session["Pincode"] = user.property.Pincode;
                Session["PasswordHash"] = user.property.Password;

                Response.Write("<script>alert('Profile Updated'); window.location.href = 'UserProfile.aspx'; </script>");
            }
            else
            {
                Response.Write("<script language='javascript'>alert('Error: Update failed'); window.location.href = 'UserProfile.aspx'; </script>");
            }
        }


        protected void btnClear_Click(object sender, EventArgs e)
        {
            Clear();
        }
        private void Clear()
        {
            txtName.Text = string.Empty;
            txtEmail.Text = string.Empty;
            txtPhoneNumber.Text = string.Empty;
            txtDistrict.Text = string.Empty;
            txtPincode.Text = string.Empty;
            txtPswd.Text = string.Empty;
        }
        protected void btnDelete_Click(object sender, EventArgs e)
        {
            Delete();
        }
        public void Delete()
        {
            user.property.Id = Convert.ToInt32(Session["UserID"]);

            string result = user.UserDelete();
            if (result == "Success")
            {
                Response.Write("<script>alert('Account Deleted'); window.location.href = 'Register.aspx'; </script>");
            }
            else
            {
                Response.Write("<script language='javascript'>alert('Error: Update failed'); window.location.href = 'UserProfile.aspx'; </script>");
            }
        }

    }
}