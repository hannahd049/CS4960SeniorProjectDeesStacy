using System;
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
            lblUserError.Text = "";
            lblPassError.Text = "";
            lblMessage.Text = "";

            string email = txtEmail.Text.Trim();
            string password = txtPassword.Text.Trim();

            bool missingUsername = string.IsNullOrEmpty(email);
            bool missingPassword = string.IsNullOrEmpty(password);

            if (missingUsername)
                lblUserError.Text = "Please enter your email.";

            if (missingPassword)
                lblPassError.Text = "Please enter your password.";

            if (missingUsername || missingPassword)
                return;

            string connectionString =
                System.Configuration.ConfigurationManager
                .ConnectionStrings["SeniorProjectConnection"]
                .ConnectionString;

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                try
                {
                    connection.Open();

                    string query = "SELECT Password, Role FROM Users WHERE Email = @Email";

                    using (SqlCommand command = new SqlCommand(query, connection))
                    {
                        command.Parameters.AddWithValue("@Email", email);

                        SqlDataReader reader = command.ExecuteReader();

                        if (!reader.HasRows)
                        {
                            lblUserError.Text = "Incorrect email.";
                            return;
                        }

                        reader.Read();

                        string storedPassword = reader["Password"].ToString();

                        if (storedPassword != password)
                        {
                            lblPassError.Text = "Incorrect password.";
                            return;
                        }

                        lblMessage.ForeColor = System.Drawing.Color.Green;
                        lblMessage.Text = "Login successful!";
                        Response.Redirect("HomePage.aspx");
                    }
                }
                catch (Exception ex)
                {
                    lblMessage.Text = "Database error: " + ex.Message;
                }
            }
        }
    }
}
