using System;
using System.Data.SqlClient;
using System.Web.UI;

namespace SeniorProject
{
    public partial class AccountSettings : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
                LoadUserProfile();
        }

        private void LoadUserProfile()
        {
            if (Session["UserEmail"] == null)
            {
                Response.Redirect("LogInPage.aspx");
                return;
            }

            string email = Session["UserEmail"].ToString();

            string connectionString =
                System.Configuration.ConfigurationManager
                .ConnectionStrings["SeniorProjectConnection"]
                .ConnectionString;

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                try
                {
                    connection.Open();

                    string query = "SELECT Name, Email, Password FROM Users WHERE Email = @Email";

                    using (SqlCommand command = new SqlCommand(query, connection))
                    {
                        command.Parameters.AddWithValue("@Email", email);

                        SqlDataReader reader = command.ExecuteReader();

                        if (reader.Read())
                        {
                            txtName.Text = reader["Name"].ToString();
                            txtEmail.Text = reader["Email"].ToString();
                            txtPassword.Text = reader["Password"].ToString();
                        }
                    }
                }
                catch (Exception ex)
                {
                    lblMessage.Text = "Database error: " + ex.Message;
                }
            }
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            if (Session["UserEmail"] == null)
            {
                Response.Redirect("LogInPage.aspx");
                return;
            }

            string oldEmail = Session["UserEmail"].ToString();

            string connectionString =
                System.Configuration.ConfigurationManager
                .ConnectionStrings["SeniorProjectConnection"]
                .ConnectionString;

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                try
                {
                    connection.Open();

                    string query = @"
                        UPDATE Users
                        SET Name = @Name,
                            Email = @NewEmail,
                            Password = @Password
                        WHERE Email = @OldEmail";

                    using (SqlCommand command = new SqlCommand(query, connection))
                    {
                        command.Parameters.AddWithValue("@Name", txtName.Text.Trim());
                        command.Parameters.AddWithValue("@NewEmail", txtEmail.Text.Trim());
                        command.Parameters.AddWithValue("@Password", txtPassword.Text.Trim());
                        command.Parameters.AddWithValue("@OldEmail", oldEmail);

                        command.ExecuteNonQuery();
                    }

                    Session["UserEmail"] = txtEmail.Text.Trim();

                    lblMessage.ForeColor = System.Drawing.Color.Green;
                    lblMessage.Text = "Profile updated successfully!";
                }
                catch (Exception ex)
                {
                    lblMessage.Text = "Database error: " + ex.Message;
                }
            }
        }
    }
}
