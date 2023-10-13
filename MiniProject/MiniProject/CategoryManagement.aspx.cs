using BLL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MiniProject
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        Admin admin = new Admin();
     

        protected void Page_Load(object sender, EventArgs e)
        {
            GridData();
            map1.Visible = false;
        }
        public void InsertCategory()
        {
            if (int.TryParse(CategoryId.Text.Trim(), out int categoryId))
            {
                admin.property.Category_Id = categoryId;
                admin.property.Category_Name = DropDownList1.SelectedItem.Text;
                string result = admin.Category_Insert();
                if (result == "Success")
                {
                    lblmsg.Text = "Insertion was successful.";
                    lblmsg.Visible = true;
                }
                else
                {
                    lblmsg.Visible = true;
                    lblmsg.Text = "Error: " + result; // Show the specific error message.
                }
            }
            else
            {
                lblmsg.Visible = true;
                lblmsg.Text = "Error: Invalid Category ID"; // Handle invalid CategoryId input.
            }
            GridData();
        }

        protected void Btncategory_Click(object sender, EventArgs e)
        {
            InsertCategory();
        }

        
        private string GetRandomText()
        {
            string randomtext = "";
            string alpahbets = "0123456789";

            Random r = new Random();
            for (int j = 0; j <= 3; j++)
            {
                randomtext += alpahbets[r.Next(alpahbets.Length)];

            }
            return randomtext.ToString();
        }
        public void InsertDish()
        {
            if (FileUpload1.HasFile == true)
            {
                string filename = GetRandomText();
                string path = Server.MapPath("~/Picture/");
                FileUpload1.SaveAs(path + filename + ".jpg");

                admin.property.Image=("~/Picture/" + filename + ".jpg");
                admin.property.Category_Id = int.Parse(category.Text.Trim());
                admin.property.Dish_Name = Dishname.Text.Trim().ToString();
                admin.property.Price = decimal.Parse(price.Text.Trim());
                string result = admin.Dish_Insert();
                category.Text = "";
                CategoryId.Text = "";
                Dishname.Text = "";
                price.Text = "";
                DropDownList1.SelectedIndex = 0;
                Hiddenval.Value = "-1";
                if (result == "SUCCESS")
                {
                    lblmsg.Visible = true;
                    lblmsg.Text = "Inserted Successfully";

                }
                else
                {
                    lblmsg.Visible = true;
                    lblmsg.Text = "Error";
                }
                //GridData();
            }
        }
        protected void submitbtn_Click(object sender, EventArgs e)
        {
            if (Hiddenval.Value == "-1")
            {
                InsertDish();
            }
            //else
            //{

            //}

                
        }


        public void GridData()
        {
            GridView2.DataSource = admin.SelectAllCategory();
            GridView2.DataBind();

        }

    }
}