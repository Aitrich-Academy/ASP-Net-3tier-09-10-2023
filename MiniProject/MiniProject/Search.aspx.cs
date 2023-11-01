using BLL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MiniProject
{
    public partial class Search : System.Web.UI.Page
    {
        User user = new User();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ImageButton_Click(object sender, ImageClickEventArgs e)
        {
            string searchQuery = TextBox1.Text.Trim().ToLower();
            List<Property> searchResults = user.SearchDishes(searchQuery);

            DataList1.DataSource = searchResults;
            DataList1.DataBind();
        }

        protected void DataList1_ItemCommand(object source, DataListCommandEventArgs e)
        {
            int itemIndex = e.Item.ItemIndex;
            Label quantityLabel = (Label)e.Item.FindControl("quantitylabl");

            if (e.CommandName == "Increment")
            {
                int currentQuantity = 0;
                if (!string.IsNullOrEmpty(quantityLabel.Text))
                {
                    currentQuantity = Convert.ToInt32(quantityLabel.Text);
                }
                currentQuantity++;
                quantityLabel.Text = currentQuantity.ToString();
            }
            else if (e.CommandName == "Decrement")
            {
                int currentQuantity = 0;
                if (!string.IsNullOrEmpty(quantityLabel.Text))
                {
                    currentQuantity = Convert.ToInt32(quantityLabel.Text);
                }
                currentQuantity--;
                quantityLabel.Text = currentQuantity.ToString();
            }
            else if (e.CommandName == "BuyNow")
            {
                string dishName = ((Label)e.Item.FindControl("lb1")).Text;
                string imageUrl = ((Image)e.Item.FindControl("imgDish")).ImageUrl;
                decimal price = Convert.ToDecimal(((Label)e.Item.FindControl("lbl2")).Text);
                int quantity = Convert.ToInt32(((Label)e.Item.FindControl("quantitylabl")).Text);

                Session["Dishe_Name"] = dishName;
                Session["Image"] = imageUrl;
                Session["Price"] = price;
                Session["Quantity"] = quantity;
                Response.Redirect("Booking.aspx");
            }
        }
    }
}