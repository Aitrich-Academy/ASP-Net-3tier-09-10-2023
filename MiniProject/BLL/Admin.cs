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
            lists.Add("Category_Name",property.Category_Name);

            return dataBase.ExecuteProcedure(lists, "Category_Insert");
        }
        public string Dish_Insert()
        {
            lists.Clear();
            lists.Add("Dishe_Name", property.Dish_Name);
            lists.Add("Price", property.Price);
            lists.Add("Image", property.Image);
            lists.Add("Category_Id", property.Category_Id);

            return dataBase.ExecuteProcedure(lists,"Dish_Insert");

        }

        //public string Dish_Update()
        //{
        //    S1.Clear();
        //    S1.Add("Dish_Id", property.Dish_Id);
        //    S1.Add("Dishe_Name", property.Dish_Name);
        //    S1.Add("Price", property.Price);
        //    S1.Add("IMAGE", property.Image);
        //    S1.Add("Category_Id", property.Category_Id);
        //    return dataBase.ExecuteProcedure(S1, "Dish_Update ");
        //}

        //public string Dish_Delete()
        //{
        //    S1.Clear();
        //    S1.Add("DishID", property.Dish_Id);
        //    return dataBase.ExecuteProcedure(S1, "Dish_Delete");
        //}
        public List<Property> SelectAllDishes()
        {
            DataTable dt = new DataTable();
            dt = dataBase.GetDataTable("GetCategoriesAndDishes");
            List<Property> list = new List<Property>();
            foreach (DataRow dr in dt.Rows)
            {
                list.Add(new Property
                {

                    //Category_Name = dr[" Category_Name"].ToString(),
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
                    //Dish_Id = Convert.ToInt32(dr["DishID"]),
                    //Dish_Name = dr["Dishe_Name"].ToString(),
                    //Price = Convert.ToDecimal(dr["Price"]),
                    //Image = dr["Image"].ToString(),
                    Category_Id = Convert.ToInt32(dr["CategoryID"])


                });
            }
            return lists;
        }

    }
}
