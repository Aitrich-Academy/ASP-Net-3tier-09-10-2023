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

        public string Booking(int userID, string name, string email, string phoneNumber, string district, string pincode)
        {
            list.Clear();
            list.Add("UserID", userID);
            list.Add("Name", name);
            list.Add("Email", email);
            list.Add("PhoneNumber", phoneNumber);
            list.Add("District", district);
            list.Add("Pincode", pincode);

            return dataBase.ExecuteProcedure(list, "Users_Update");
        }
    }
}
