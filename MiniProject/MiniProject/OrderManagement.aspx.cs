using BLL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MiniProject
{
    public partial class OrderManagement : System.Web.UI.Page
    {
        Admin admin = new Admin();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                OrderBind();
            }
        }

        public void OrderBind()
        {
            GridView1.DataSource = admin.SelectOrder();
            GridView1.DataBind();
        }

        protected void btnAcceptOrder_Click(object sender, EventArgs e)
        {

        }
    }
}