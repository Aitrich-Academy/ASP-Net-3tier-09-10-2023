﻿using BLL;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MiniProject
{
    public partial class Login : System.Web.UI.Page
    {
        User user = new User();
        Admin admin = new Admin();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string email = "admin@gmail.com";
            string password = "admin@123";

            user.property.Email = txtEmail.Text;
            user.property.Password = txtPswd.Text;

            string result = user.Login();

            if (user.property.Email == email && user.property.Password == password)
            {
                Response.Redirect("AdminWebForm.aspx");
            }
            else if (result == "Success")
            {
                DataTable table = user.GetUserDetails(txtEmail.Text, txtPswd.Text);
                if (table.Rows.Count > 0)
                {
                    DataRow row = table.Rows[0];
                    Session["UserID"] = row["UserID"].ToString();
                    Session["Name"] = row["Name"].ToString();
                    Session["Email"] = row["Email"].ToString();
                    Session["PhoneNumber"] = row["PhoneNumber"].ToString();
                    Session["District"] = row["District"].ToString();
                    Session["Pincode"] = row["Pincode"].ToString();
                    Session["PasswordHash"] = row["PasswordHash"].ToString();

                    string userStatus = row["Status"].ToString();
                    if (userStatus == "Delete")
                    {
                        Response.Write("<script language='javascript'>alert('Error: Account is deleted'); window.location.href = 'Register.aspx';</script>");
                        return;
                    }
                    else if (userStatus == "ADMIN deleted")
                    {
                        Response.Write("<script language='javascript'>alert('Error: This Account is ADMIN deleted.....❌'); window.location.href = 'Register.aspx';</script>");
                        return;
                    }
                }
                Response.Redirect("UserWebForm.aspx");
            }
            else
            {
                Response.Write("<script language='javascript'>alert('Error: User not found');</script>");
            }
        }
    }
}