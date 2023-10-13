using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MiniProject
{
    public partial class Booking : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Write("<script>alert('Booking Cancelled...👎😒'); window.location.href = 'UserWebForm.aspx'; </script>");
        }

        protected void btnConfirm_Click(object sender, EventArgs e)
        {
            Response.Write("<script>alert('Booking successful......👍😎'); window.location.href = 'UserWebForm.aspx'; </script>");

        }
    }
}