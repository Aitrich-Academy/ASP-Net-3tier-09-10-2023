
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
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                UserBind();
            }
        }

        public void UserBind()
        {
            GridView1.DataSource = admin.Selectuser();
            GridView1.DataBind();
        }

        protected void btnBlockuser_Click(object sender, EventArgs e)
        {
            Button btnBlockuser = (Button)sender;
            int userId = Convert.ToInt32(btnBlockuser.CommandArgument);

            string result = admin.UserDelete(userId);

            if (result == "Success")
            {
                LblMsg.ForeColor = System.Drawing.Color.Green;
                LblMsg.Text = "User Blocked....";
                LblMsg.Visible = true;
            }
            else
            {
                LblMsg.ForeColor = System.Drawing.Color.Red;
                LblMsg.Visible = true;
                LblMsg.Text = "Error: " + result;
            }
        }
    }
}
   