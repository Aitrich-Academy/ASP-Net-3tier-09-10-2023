
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BLL;


namespace MiniProject
{
    public partial class MenuList : System.Web.UI.Page
    {
        User user = new User();
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack == true)
            {
                SelectAllDishes();
               
            }
        }
        public void SelectAllDishes()
        {


            List<Property> dishes = user.SelectAllDishes();

            // Bind the data to the DataList
            DataList1.DataSource = dishes;
            DataList1.DataBind();
        }

              protected void DataList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            
        }

        protected void DataList1_SelectedIndexChanged1(object sender, EventArgs e)
        {

        }

        protected void DataList1_ItemCommand(object source, DataListCommandEventArgs e)
        {
            
        }

        protected void DataList1_ItemDataBound(object sender, DataListItemEventArgs e)
        {
           
                }
            }
        }
   
