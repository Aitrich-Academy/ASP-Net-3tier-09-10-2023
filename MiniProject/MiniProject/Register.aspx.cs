using BLL;
using System;
using System.Collections.Generic;
using System.Data;
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

            DataTable table = user.GetUserStatus(txtEmail.Text, txtPswd.Text);
            if (table.Rows.Count > 0)
            {
                DataRow row = table.Rows[0];
                string userStatus = row["Status"].ToString();
                if (userStatus == "ADMIN deleted")
                {
                    Response.Write("<script language='javascript'>alert('Error : This Account is ADMIN deleted.....❌\\n           Please Create a New Account'); window.location.href = 'Register.aspx';</script>");
                    return;
                }
            }

            string result = user.UserInsert();
            txtName.Text = "";
            int userID = int.Parse(Hidden.Value);
            user.property.Id = userID;
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