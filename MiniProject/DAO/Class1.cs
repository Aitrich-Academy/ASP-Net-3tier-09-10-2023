using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAO
{
    public class DAO
    {

        public DAO()
        {
        }
        //private int _pid;
        //private string _pname;
        //private decimal _pcost;
        //private string _pdec;
        //private string _pimage;
        public int Dish_Id { get; set; }
        public string Dishe_Name { get; set; }
        public string Image { get; set; }
        public decimal Price { get; set; }
        public int Quantity { get; set; }
        public int DishId
        {
            get { return Dish_Id; }
            set { Dish_Id = value; }
        }
        public string DishName
        {
            get { return Dishe_Name; }
            set { Dishe_Name = value; }
        }
        public decimal DishPrice
        {
            get { return Price; }
            set { Price = value; }
        }
       
        public string dishimage
        {
            get { return Image; }
            set { Image = value; }
        }
    }
}

