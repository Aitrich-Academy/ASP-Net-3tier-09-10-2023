using DAL;
using System;
using System.Collections;
using System.Collections.Generic;
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
            list.Add("Email", property.Email);
            list.Add("PasswordHash", property.Password);

            return dataBase.ExecuteProcedure(list, "Login_User");
        }
    }
}
