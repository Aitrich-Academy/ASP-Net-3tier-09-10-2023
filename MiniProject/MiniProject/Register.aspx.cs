using BLL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MiniProject
{
    public partial class Register : System.Web.UI.Page
    {
        User user = new User();
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        public void Insert()
        {
            user.property.Name = txtName.Text.Trim().ToString();
            user.property.Email = txtEmail.Text.Trim().ToString();
            user.property.PhoneNumber = txtPhone.Text.ToString();
            user.property.District = DistrictDropDownList.SelectedValue;
            user.property.Pincode = txtPincode.Text.Trim().ToString();
            user.property.Password = txtPswd.Text.Trim().ToString();

            string result = user.UserInsert();
            txtName.Text = "";
            Hidden.Value = "-1";
            if (result == "Success")
            {
                Response.Write("<script language='javascript'>if(confirm('Registration is successfully......👍😎\\nDo you want to go to the login page?\\nClick OK Button')){ window.location.href = 'Login.aspx'; } else { alert('Cancelled.'); }</script>");
            }
            else
            {
                Response.Write("<script language=\"javascript\">alert(\"Error\");</script>");
            }
        }

        protected void btnSignUp_Click(object sender, EventArgs e)
        {
            if (Hidden.Value == "-1")
            {
                Insert();
            }
        }
    }
}