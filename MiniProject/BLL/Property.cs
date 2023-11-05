using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL
{
    public class Property
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public string Email { get; set; }
        public string PhoneNumber { get; set; }
        public string District { get; set; }
        public string Pincode { get; set; }
        public string Password { get; set; }
        public string Status { get; set; }

        public int Category_Id { get; set; }
        public string Category_Name { get; set; }

        public int Dish_Id { get; set; }
        public string Dish_Name { get; set; }
        public string Image { get; set; }
        public decimal Price { get; set; }
        public string Meals { get; set; }
        public int Quantity { get; set; }
        public decimal TotalAmount { get; set; }

        public int Order_Id { get; set; }
    }
}