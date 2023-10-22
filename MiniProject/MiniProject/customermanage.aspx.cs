
using BLL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MiniProject
{
    public partial class WebForm3 : System.Web.UI.Page
    {
        Admin admin = new Admin();
        List<Property> lists = new List<Property>(); 

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                OrderBind();
            }
        }

        public void OrderBind()
        {
            GridView1.DataSource = admin.Selectuser();
            GridView1.DataBind();
        }
        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
      

        protected void btnAcceptOrder_Click(object sender, EventArgs e)
        {
            

            
            string result = admin.UserDelete();

            if (result == "Success")
            {
             
                OrderBind();
            }
            else
            {
            
            }
        }
    

        public string UserDelete()
        {
            lists.Clear();
            lists.Add(new Property { Id = 1 });
            
            return admin.UserDelete();   
        }

        protected void GridView1_SelectedIndexChanged1(object sender, EventArgs e)
        {

        }
    }
}
   