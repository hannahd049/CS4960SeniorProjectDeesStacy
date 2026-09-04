using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SeniorProject
{
    public partial class Welcome : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void loginbutton_Click(object sender, EventArgs e)
        {
            Response.Redirect("LogInPage.aspx");
        }

        protected void signupbutton_Click(object sender, EventArgs e)
        {
            Response.Redirect("AccountRegistration.aspx");
        }
    }
}