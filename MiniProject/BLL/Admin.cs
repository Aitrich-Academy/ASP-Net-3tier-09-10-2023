using DAL;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL
{
    public class Admin
    {
        private DataBase dataBase = new DataBase();
        public Property property = new Property();
        private SortedList lists = new SortedList();

        public string Category_Insert()
        {
            lists.Clear();
            lists.Add("Category_Id", property.Category_Id);
            lists.Add("Category_Name", property.Category_Name);

            return dataBase.ExecuteProcedure(lists, "Category_Insert");
        }

        public string Dish_Insert()
        {
            lists.Clear();
            lists.Add("Dishe_Name", property.Dish_Name);
            lists.Add("Price", property.Price);
            lists.Add("Image", property.Image);
            lists.Add("Category_Id", property.Category_Id);

            return dataBase.ExecuteProcedure(lists, "Dish_Insert");
        }

        public string Dish_Update()
        {
            lists.Clear();
            lists.Add("Dish_Id", property.Dish_Id);
            lists.Add("Dishe_Name", property.Dish_Name);
            lists.Add("Price", property.Price);
            lists.Add("Image", property.Image);
            lists.Add("Category_Id", property.Category_Id);

            return dataBase.ExecuteProcedure(lists, "Dish_Update");
        }

        public string Dish_Delete()
        {
            lists.Clear();
            lists.Add("DishID", property.Dish_Id);

            return dataBase.ExecuteProcedure(lists, "Dish_Delete");
        }

        public void EditDishes()
        {
            lists.Clear();
            lists.Add("Dish_Id", property.Dish_Id);
            DataTable dt = new DataTable();
            dt = dataBase.GetDataTable(lists, "Edit_Dish");
            if (dt.Rows.Count > 0)
            {
                property.Category_Id = Convert.ToInt32(dt.Rows[0].ItemArray[4]);
                property.Dish_Name = dt.Rows[0].ItemArray[1].ToString();
                decimal price;
                if (decimal.TryParse(dt.Rows[0].ItemArray[2].ToString(), out price))
                {
                    property.Price = price;
                }
                else
                {

                }
                property.Image = dt.Rows[0].ItemArray[3].ToString();
            }
        }

        public List<Property> SelectAllDishes()
        {
            DataTable dt = new DataTable();
            dt = dataBase.GetDataTable("Dish_Select");
            List<Property> list = new List<Property>();
            foreach (DataRow dr in dt.Rows)
            {
                list.Add(new Property
                {
                    Dish_Id = Convert.ToInt32(dr["DishID"]),
                    Dish_Name = dr["Dishe_Name"].ToString(),
                    Price = Convert.ToDecimal(dr["Price"]),
                    Image = dr["Image"].ToString(),
                    Category_Id = Convert.ToInt32(dr["Category_id"])
                });
            }
            return list;
        }

        public List<Property> SelectAllCategory()
        {
            DataTable dt = new DataTable();
            dt = dataBase.GetDataTable("Category_Select");
            List<Property> lists = new List<Property>();
            foreach (DataRow dr in dt.Rows)
            {
                lists.Add(new Property
                {
                    Category_Name = dr["Category_Name"].ToString(),
                    Category_Id = Convert.ToInt32(dr["CategoryID"])
                });
            }
            return lists;
        }

        public List<Property> SelectOrder()
        {
            DataTable dt = new DataTable();
            dt = dataBase.GetDataTable("Admin_OrderDetails");
            List<Property> list = new List<Property>();
            foreach (DataRow dr in dt.Rows)
            {
                list.Add(new Property
                {
                    Order_Id = Convert.ToInt32(dr["OrderID"]),
                    Name = dr["User_Name"].ToString(),
                    Email = dr["Email"].ToString(),
                    PhoneNumber = dr["PhoneNumber"].ToString(),
                    District = dr["District"].ToString(),
                    Pincode = dr["Pincode"].ToString(),
                    Dish_Name = dr["DishName"].ToString(),
                    Price = Convert.ToDecimal(dr["Price"]),
                    Quantity = Convert.ToInt32(dr["Quantity"]),
                    TotalAmount = Convert.ToDecimal(dr["Total_Price"]),
                    Image = dr["Image"].ToString(),
                    Status = dr["Status"].ToString()
                });
            }
            return list;
        }

        public List<Property> Selectuser()
        {
            DataTable dt = new DataTable();
            dt = dataBase.GetDataTable("User_Select_AdminView");
            List<Property> list = new List<Property>();
            foreach (DataRow dr in dt.Rows)
            {
                list.Add(new Property
                {
                    Id = Convert.ToInt32(dr["UserID"]),
                    Name = dr["Name"].ToString(),
                    Email = dr["Email"].ToString(),
                    PhoneNumber = dr["PhoneNumber"].ToString(),
                    District = dr["District"].ToString(),
                    Pincode = dr["Pincode"].ToString(),
                    Password = dr["PasswordHash"].ToString(),
                    Status = dr["Status"].ToString()
                });
            }
            return list;
        }

        public string UserDelete(int userId)
        {
            lists.Clear();
            lists.Add("UserID", userId);

            return dataBase.ExecuteProcedure(lists, "Users_Delete_Admin");
        }
    }
}