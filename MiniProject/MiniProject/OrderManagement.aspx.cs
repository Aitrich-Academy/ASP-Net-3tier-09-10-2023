using BLL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Mail;
using System.Net;
using System.Threading.Tasks;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MiniProject
{
    public partial class OrderManagement : System.Web.UI.Page
    {
        Admin admin = new Admin();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                OrderBind();
            }
        }

        public void OrderBind()
        {
            GridView1.DataSource = admin.SelectOrder();
            GridView1.DataBind();
        }

        private async Task SendEmail(string recipientEmail, string userName, string district, string pincode, string dishName, decimal price, int quantity, decimal totalAmount)
        {
            string fromMail = "haiindianplatter@gmail.com";
            string fromPassword = "tsimgaswqdamktvb";

            MailMessage message = new MailMessage();
            message.From = new MailAddress(fromMail);
            message.Subject = "Order Confirmation - Your IndianPlatter order has been placed";
            message.To.Add(new MailAddress(recipientEmail));
            message.Body = $@"<html><body>
                    Hi {userName}, <br>
                    We are happy to inform you that your order with <i><b>IndianPlatter</b></i> has been successfully placed. <br>
                    Your order is on the way...🛵 <br><br><hr>
                    Your order details:
                    <ul>
                        <li><b>Dish Name:</b> {dishName}</li>
                        <li><b>Price:</b> {price}</li>
                        <li><b>Quantity:</b> {quantity}</li>
                        <li><b>Total Amount:</b> ₹<span style='color:red;'>{totalAmount}</span></li>
                    </ul>
                    <hr>
                    Shipping to <br>
                    {userName}<br>
                    {district}, {pincode}
                    </body></html>";
            message.IsBodyHtml = true;
            var smtpClient = new SmtpClient("smtp.gmail.com")
            {
                Port = 587,
                Credentials = new NetworkCredential(fromMail, fromPassword),
                EnableSsl = true,
            };
            await smtpClient.SendMailAsync(message);
        }

        protected async void btnAcceptOrder_Click(object sender, EventArgs e)
        {
            try
            {
                GridViewRow row = GridView1.SelectedRow;
                if (row != null)
                {
                    string userName = row.Cells[2].Text;
                    string recipientEmail = row.Cells[3].Text;
                    string district = row.Cells[5].Text;
                    string pincode = row.Cells[6].Text;
                    string dishName = row.Cells[7].Text;
                    decimal price = Convert.ToDecimal(row.Cells[8].Text);
                    int quantity = Convert.ToInt32(row.Cells[9].Text);
                    decimal totalAmount = Convert.ToDecimal(row.Cells[10].Text);

                    await SendEmail(recipientEmail, userName, district, pincode, dishName, price, quantity, totalAmount);
                    Response.Write("<script>alert('Accept Order.');</script>");
                }
                else
                {
                    Response.Write("<script>alert('No row is selected.');</script>");
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('Error sending email: " + ex.Message + "');</script>");
            }
        }
        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridViewRow row = GridView1.SelectedRow;
            string tmpID = GridView1.DataKeys[row.RowIndex].Value.ToString();
        }
    }
}