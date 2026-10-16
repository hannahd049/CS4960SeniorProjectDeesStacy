
using System;
using System.Web;

namespace SeniorProject
{
    public partial class HomePage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["DisplayName"] != null &&
                    Session["UserEmail"] != null)
                {
                    string firstName =
                        Session["DisplayName"].ToString();

                    string email =
                        Session["UserEmail"].ToString();

                    UserGreeting.Text = "Hi, " + firstName;

                    UserGreeting.NavigateUrl =
                        "ViewProfile.aspx?email=" +
                        HttpUtility.UrlEncode(email);
                }
                else
                {
                    Response.Redirect("LogInPage.aspx");
                }
            }
        }
    }
}
