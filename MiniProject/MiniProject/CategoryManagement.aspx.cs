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
            if (!Page.IsPostBack)
            {
                GridData();
                map1.Visible = false;
                GridSource();
            }

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
                    lblmsg.Text = "Error: " + result;
                }
            }
            else
            {
                lblmsg.Visible = true;
                lblmsg.Text = "Error: Invalid Category ID";
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

                admin.property.Image = ("~/Picture/" + filename + ".jpg");
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
                GridSource();
            }
        }

        public void UpdateDish()
        {
            if (FileUpload1.HasFile == true)
            {
                string filename = GetRandomText();
                string path = Server.MapPath("~/Picture/");
                FileUpload1.SaveAs(path + filename + ".jpg");
                admin.property.Image = ("~/Picture/" + filename + ".jpg");
                admin.property.Dish_Id = int.Parse(Hiddenval.Value);
                admin.property.Category_Id = int.Parse(category.Text.Trim());
                admin.property.Dish_Name = Dishname.Text.Trim().ToString();
                admin.property.Price = decimal.Parse(price.Text.Trim());
                string result = admin.Dish_Update();
                category.Text = "";
                CategoryId.Text = "";
                Dishname.Text = "";
                price.Text = "";
                map1.Visible = false;

                //DropDownList1.SelectedIndex = 0;
                //Hiddenval.Value = "-1";
                if (result == "Success")
                {
                    lblmsg.Visible = true;
                    lblmsg.Text = "Updated Successfully";
                    map1.Visible = false;
                }
                else
                {
                    lblmsg.Visible = true;
                    lblmsg.Text = "Error";
                }
                GridSource();
            }
        }

        public void DeleteDish()
        {
            admin.property.Dish_Id = int.Parse(Hiddenval.Value);
            string result = admin.Dish_Delete();
            Hiddenval.Value = "-1";
            if (result == "Success")
            {
                lblmsg.Visible = true;
                lblmsg.Text = "Deleted Successfiully";
            }
            else
            {
                lblmsg.Visible = true;
                lblmsg.Text = "Error";
            }
            GridSource();
        }

        public void EditDish()
        {
            string path = Server.MapPath("~/Picture/");
            map1.Visible = true;
            admin.property.Dish_Id = int.Parse(Hiddenval.Value);
            admin.EditDishes();
            category.Text = admin.property.Category_Id.ToString();
            Dishname.Text = admin.property.Dish_Name;
            map1.ImageUrl = admin.property.Image;
            map1.AlternateText = admin.property.Image;
            price.Text = admin.property.Price.ToString();
            //GridSource();
        }

        protected void submitbtn_Click(object sender, EventArgs e)
        {
            if (Hiddenval.Value == "-1")
            {
                InsertDish();
            }
            else
            {
                UpdateDish();
            }
        }

        public void GridData()
        {
            GridView2.DataSource = admin.SelectAllCategory();
            GridView2.DataBind();
        }

        public void GridSource()
        {
            GridView3.DataSource = admin.SelectAllDishes();
            GridView3.DataBind();
        }

        protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
        {
            ImageButton imgbtn = sender as ImageButton;
            GridViewRow gvr = imgbtn.NamingContainer as GridViewRow;
            Hiddenval.Value = GridView3.DataKeys[gvr.RowIndex].Value.ToString();
            EditDish();
        }

        protected void ImageButton2_Click(object sender, ImageClickEventArgs e)
        {
            ImageButton imgbtn = sender as ImageButton;
            GridViewRow gvr = imgbtn.NamingContainer as GridViewRow;
            Hiddenval.Value = GridView3.DataKeys[gvr.RowIndex].Value.ToString();
            DeleteDish();
        }
    }
}