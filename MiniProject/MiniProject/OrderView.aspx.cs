using BLL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MiniProject
{
    public partial class OrderView : System.Web.UI.Page
    {
        User user = new User();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                if (Session["OrderID"] != null)
                {
                    Hiddenvalue.Value = Session["OrderID"].ToString();
                }
                OrderBind();
            }
        }

        public void OrderBind()
        {
            string email = Session["Email"].ToString();
            string passwordHash = Session["PasswordHash"].ToString();
            List<Property> orderDetails = user.GetUserOrderDetails(email, passwordHash);
            DetailsView1.DataSource = orderDetails;
            DetailsView1.DataBind();
        }

        protected void DetailsView1_PageIndexChanging(object sender, DetailsViewPageEventArgs e)
        {
            DetailsView1.PageIndex = e.NewPageIndex;
            OrderBind();
        }

        public void Delete()
        {
            user.property.Order_Id = Convert.ToInt32(Session["OrderID"]);
            string result = user.Order_Cancel();
            if (result == "Success")
            {
                Lblmsg.ForeColor = System.Drawing.Color.Green;
                Lblmsg.Visible = true;
                Lblmsg.Text = "Cancellation successful";
            }
            else
            {
                Lblmsg.ForeColor = System.Drawing.Color.Red;
                Lblmsg.Visible = true;
                Lblmsg.Text = "Error";
            }
            OrderBind();
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Delete();
        }
    }
}