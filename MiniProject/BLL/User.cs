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

            // Assuming you have a stored procedure to retrieve dish data named "Dish_Select"
            DataTable dt = dataBase.GetDataTable("Dish_Select");

            foreach (DataRow dr in dt.Rows)
            {
                list.Add(new Property
                {
                    Dish_Id = Convert.ToInt32(dr["DishID"]),
                    Dishe_Name = dr["Dishe_Name"].ToString(),
                    Price = Convert.ToDecimal(dr["Price"]),
                    Image = "Photo/" + dr["Image"].ToString(), // Update the path to match your image folder
                    Category_Id = Convert.ToInt32(dr["Category_id"])
                });
            }
            return list;
        }
    }   
}