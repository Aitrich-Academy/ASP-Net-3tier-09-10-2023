using DAL;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;


namespace BLL
{

    public class User
    {
        private DataBase dataBase = new DataBase();
        public Property property = new Property();
        private SortedList list = new SortedList();

        public string UserInsert()
        {
            list.Clear();
            list.Add("Name", property.Name);
            list.Add("Email", property.Email);
            list.Add("PhoneNumber", property.PhoneNumber);
            list.Add("District", property.District);
            list.Add("Pincode", property.Pincode);
            list.Add("PasswordHash", property.Password);

            return dataBase.ExecuteProcedure(list, "Users_Insert");
        }

        public string Login()
        {
            list.Clear();
            list.Add("Email", property.Email);
            list.Add("PasswordHash", property.Password);

            return dataBase.ExecuteProcedure(list, "Login_User");
        }

        public DataTable GetUserDetails(string email, string passwordHash)
        {
            return dataBase.GetDataTable("User_Select", new SqlParameter("@Email", email), new SqlParameter("@PasswordHash", passwordHash));
        }

        public string Booking()
        {
            list.Clear();
            list.Add("UserID", property.Id);
            list.Add("Name", property.Name);
            list.Add("Email", property.Email);
            list.Add("PhoneNumber", property.PhoneNumber);
            list.Add("District", property.District);
            list.Add("Pincode", property.Pincode);

            return dataBase.ExecuteProcedure(list, "Users_Update");
        }
        public string UserUpdate()
        {
            list.Clear();
            list.Add("UserID", property.Id);
            list.Add("Name", property.Name);
            list.Add("Email", property.Email);
            list.Add("PhoneNumber", property.PhoneNumber);
            list.Add("District", property.District);
            list.Add("Pincode", property.Pincode);
            list.Add("PasswordHash", property.Password);

            return dataBase.ExecuteProcedure(list, "Users_Update");
        }
        public string UserDelete()
        {
            list.Clear();
            list.Add("UserID", property.Id);

            return dataBase.ExecuteProcedure(list, "Users_Delete");
        }


        public List<Property> SelectAllDishes()
        {
            List<Property> list = new List<Property>();
            DataTable dt = dataBase.GetDataTable("Dish_Select");

            foreach (DataRow dr in dt.Rows)
            {
                list.Add(new Property
                {
                    Dish_Id = Convert.ToInt32(dr["DishID"]),
                    Dishe_Name = dr["Dishe_Name"].ToString(),
                    Price = Convert.ToDecimal(dr["Price"]),
                    Image = "Photo/" + dr["Image"].ToString(),
                    Category_Id = Convert.ToInt32(dr["Category_id"])
                });
            }
            return list;
        }

        public List<Property> GetUserOrderDetails(string email, string passwordHash)
        {
            DataTable dt = dataBase.GetDataTable("User_DisplayOrderDetails", new SqlParameter("@Email", email), new SqlParameter("@PasswordHash", passwordHash));

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
                    Dishe_Name = dr["DishName"].ToString(),
                    Price = Convert.ToDecimal(dr["Price"]),
                    Quantity = Convert.ToInt32(dr["Quantity"]),
                    Image = dr["Image"].ToString()
                });
            }
            return list;
        }

        public string Order_Cancel()
        {
            list.Clear();
            list.Add("OrderID", property.Order_Id);

            return dataBase.ExecuteProcedure(list, "Order_Delete");
        }
    }   
}