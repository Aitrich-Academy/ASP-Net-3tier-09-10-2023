using BLL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MiniProject
{
    public partial class Login : System.Web.UI.Page
    {
        User user = new User();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
          

            string email = "admin@gmail.com";
            string password = "admin@123";

            user.property.Email = txtEmail.Text;
            user.property.Password = txtPswd.Text;
            string result = user.Login();

            if (result == "Success")
            {
                Response.Redirect("UserWebForm.aspx");
            }
            else if (user.property.Email == email && user.property.Password == password)
            {
                Response.Redirect("AdminWebForm.aspx");
            }
            else
            {
                Response.Write("<script language='javascript'>alert('Error: User not found');</script>");
            }
        }
    }
}