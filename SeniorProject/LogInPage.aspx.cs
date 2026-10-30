using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Drawing;
using System.Web.Helpers;
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
            string password = txtPassword.Text;

            bool missingEmail = string.IsNullOrEmpty(email);
            bool missingPassword = string.IsNullOrEmpty(password);

            if (missingEmail)
            {
                lblUserError.Text = "Please enter your email.";
            }

            if (missingPassword)
            {
                lblPassError.Text = "Please enter your password.";
            }

            if (missingEmail || missingPassword)
            {
                return;
            }

            string connectionString =
                ConfigurationManager
                .ConnectionStrings["SeniorProjectConnection"]
                .ConnectionString;

            using (SqlConnection connection =
                new SqlConnection(connectionString))
            {
                try
                {
                    connection.Open();

                    string query = @"
                        SELECT
                            UserID,
                            Username,
                            FirstName,
                            Email,
                            PasswordHash,
                            Role
                        FROM Users
                        WHERE Email = @Email";

                    using (SqlCommand command =
                        new SqlCommand(query, connection))
                    {
                        command.Parameters.AddWithValue("@Email", email);

                        using (SqlDataReader reader =
                            command.ExecuteReader())
                        {
                            if (!reader.HasRows)
                            {
                                lblPassError.ForeColor = Color.Red;
                                lblPassError.Text =
                                    "Invalid email or password.";
                                return;
                            }

                            reader.Read();

                            string storedHash =
                                reader["PasswordHash"].ToString();

                            if (!Crypto.VerifyHashedPassword(
                                    storedHash,
                                    password))
                            {
                                lblPassError.ForeColor = Color.Red;
                                lblPassError.Text =
                                    "Invalid email or password.";
                                return;
                            }

                            int userId =
                                Convert.ToInt32(reader["UserID"]);

                            string username =
                                reader["Username"].ToString();

                            string userRole =
                                reader["Role"].ToString();

                            string firstName =
                                reader["FirstName"].ToString();

                            string userEmail =
                                reader["Email"].ToString();

                            Session["UserID"] = userId;

                            Session["Username"] = username;

                            Session["UserEmail"] = userEmail;

                            Session["UserRole"] = userRole;

                            Session["DisplayName"] = firstName;
                        }
                    }

                    Response.Redirect(
                        "HomePage.aspx",
                        false);

                    Context.ApplicationInstance
                        .CompleteRequest();
                }
                catch (Exception ex)
                {
                    lblMessage.ForeColor = Color.Red;

                    lblMessage.Text =
                        "Database error: " +
                        ex.Message;
                }
            }
        }
    }
}