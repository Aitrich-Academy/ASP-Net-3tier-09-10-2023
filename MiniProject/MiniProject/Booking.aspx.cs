using BLL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Mail;
using System.Net;
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

            txtDishName.Text = Session["Dishe_Name"].ToString();
            decimal price = Convert.ToDecimal(Session["Price"]);
            int quantity = Convert.ToInt32(Session["Quantity"]);
            txtPrice.Text = price.ToString();
            txtQuantity.Text = quantity.ToString();

            decimal totalAmount = price * quantity;
            txtTotal.Text = totalAmount.ToString();

            string image = Session["Image"].ToString();
            Image1.ImageUrl = image;

        }

        public void DishesBooking()
        {
            user.property.Id = Convert.ToInt32(Session["UserID"]);
            user.property.Name = txtName.Text.ToString();
            user.property.Email = txtEmail.Text.ToString();
            user.property.PhoneNumber = txtPhoneNumber.Text.ToString();
            user.property.District = txtDistrict.Text.ToString();
            user.property.Pincode = txtPincode.Text.ToString();

            user.property.Dish_Name = txtDishName.Text.ToString();
            user.property.Price = Convert.ToDecimal(txtPrice.Text);
            user.property.Quantity = Convert.ToInt32(txtQuantity.Text);

            decimal totalAmount = user.property.Price * user.property.Quantity;
            user.property.TotalAmount = totalAmount;
            totalAmount = Convert.ToDecimal(txtTotal.Text);

            user.property.Image = Image1.ImageUrl;

            string result = user.Booking();
            if (result == "Success")
            {
                Session["Name"] = user.property.Name;
                Session["Email"] = user.property.Email;
                Session["PhoneNumber"] = user.property.PhoneNumber;
                Session["District"] = user.property.District;
                Session["Pincode"] = user.property.Pincode;

                Session["Dish_Name"] = user.property.Dish_Name;
                Session["Price"] = user.property.Price;
                Session["Quantity"] = user.property.Quantity;
                Session["TotalPrice"] = user.property.TotalAmount;
                Session["Image"] = user.property.Image;

                Response.Write("<script>alert('Booking successfully......👍😎'); window.location.href = 'UserWebForm.aspx'; </script>");
            }
            else
            {
                Response.Write("<script language='javascript'>alert('Error: Booking failed'); </script>");
            }
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Write("<script>alert('Booking Cancelled...👎😒'); window.location.href = 'UserWebForm.aspx'; </script>");
        }

        protected void btnConfirm_Click(object sender, EventArgs e)
        {
            try
            {
                string adminEmail = "haiindianplatter@gmail.com";
                MailMessage mail = new MailMessage();
                mail.From = new MailAddress("userindianplatter@gmail.com");
                mail.To.Add(adminEmail);
                mail.Subject = "Order Confirmation Request";
                mail.Body = mail.Body = $@"<html><body>
                <p>Please confirm the order for 
                    <h1>{Session["Name"]}</h1></p>              
                </body></html>";
                mail.IsBodyHtml = true;

                SmtpClient smtpClient = new SmtpClient("smtp.gmail.com");
                smtpClient.Port = 587;
                smtpClient.Credentials = new NetworkCredential("userindianplatter@gmail.com", "ukvnslehbqbxldmn");
                smtpClient.EnableSsl = true;

                smtpClient.Send(mail);
                mail.Dispose();
                smtpClient.Dispose();

                DishesBooking();
                Response.Write("<script>alert('Email sent successfully.');</script>");
            }
            catch (Exception ex)
            {

                Response.Write($"<script>alert('Error: {ex.Message}');</script>");
            }
        }
    }
}