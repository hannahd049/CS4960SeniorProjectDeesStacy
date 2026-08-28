using System;
using System.Drawing;
using System.Data.SqlClient;
using System.Web.UI;

namespace SeniorProject
{
    public partial class LogInPage : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string email = txtUsername.Text.Trim();
            string password = txtPassword.Text.Trim();

            string connectionString =
                System.Configuration.ConfigurationManager
                .ConnectionStrings["SeniorProjectConnection"]
                .ConnectionString;

            using (SqlConnection connection =
                   new SqlConnection(connectionString))
            {
                try
                {
                    connection.Open();

                    string query =
                        "SELECT Role FROM Users " +
                        "WHERE Email = @Email " +
                        "AND Password = @Password";

                    using (SqlCommand command =
                           new SqlCommand(query, connection))
                    {
                        command.Parameters.AddWithValue(
                            "@Email", email);

                        command.Parameters.AddWithValue(
                            "@Password", password);

                        object role = command.ExecuteScalar();

                        if (role != null)
                        {
                            string userRole = role.ToString();

                            lblMessage.ForeColor = Color.Green;
                            lblMessage.Text = "Login successful!";

                            if (userRole.Equals(
                                "Admin",
                                StringComparison.OrdinalIgnoreCase))
                            {
                                Response.Redirect("HomePage.aspx");
                            }
                            else if (userRole.Equals(
                                "User",
                                StringComparison.OrdinalIgnoreCase))
                            {
                                Response.Redirect("HomePage.aspx");
                            }
                            else
                            {
                                lblMessage.ForeColor = Color.Red;
                                lblMessage.Text =
                                    "Login successful, but your account has no valid role.";
                            }
                        }
                        else
                        {
                            lblMessage.ForeColor = Color.Red;
                            lblMessage.Text =
                                "Invalid email or password.";
                        }
                    }
                }
                catch (Exception ex)
                {
                    lblMessage.ForeColor = Color.Red;
                    lblMessage.Text =
                        "Database error: " + ex.Message;
                }
            }
        }
    }
}
