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
            {
                LoadUserProfile();
            }
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

                    string query = @"
                        SELECT Name, Email, Password
                        FROM Users
                        WHERE Email = @Email";

                    using (SqlCommand command = new SqlCommand(query, connection))
                    {
                        command.Parameters.AddWithValue("@Email", email);

                        using (SqlDataReader reader = command.ExecuteReader())
                        {
                            if (reader.Read())
                            {
                                txtName.Text = reader["Name"].ToString();
                                txtEmail.Text = reader["Email"].ToString();
                                txtPassword.Text = reader["Password"].ToString();
                            }
                        }
                    }
                }
                catch (Exception ex)
                {
                    lblMessage.ForeColor = System.Drawing.Color.Red;
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

            string newName = txtName.Text.Trim();
            string newEmail = txtEmail.Text.Trim();
            string newPassword = txtPassword.Text;

            if (string.IsNullOrEmpty(newName))
            {
                lblMessage.ForeColor = System.Drawing.Color.Red;
                lblMessage.Text = "Please enter your name.";
                return;
            }

            if (string.IsNullOrEmpty(newEmail))
            {
                lblMessage.ForeColor = System.Drawing.Color.Red;
                lblMessage.Text = "Please enter your email.";
                return;
            }

            if (string.IsNullOrEmpty(newPassword))
            {
                lblMessage.ForeColor = System.Drawing.Color.Red;
                lblMessage.Text = "Please enter your password.";
                return;
            }

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
                        command.Parameters.AddWithValue("@Name", newName);
                        command.Parameters.AddWithValue("@NewEmail", newEmail);
                        command.Parameters.AddWithValue("@Password", newPassword);
                        command.Parameters.AddWithValue("@OldEmail", oldEmail);

                        int rowsUpdated = command.ExecuteNonQuery();

                        if (rowsUpdated > 0)
                        {
                            Session["UserEmail"] = newEmail;

                            lblMessage.ForeColor = System.Drawing.Color.Green;
                            lblMessage.Text = "Profile updated successfully!";
                        }
                        else
                        {
                            lblMessage.ForeColor = System.Drawing.Color.Red;
                            lblMessage.Text = "Profile could not be updated.";
                        }
                    }
                }
                catch (Exception ex)
                {
                    lblMessage.ForeColor = System.Drawing.Color.Red;
                    lblMessage.Text = "Database error: " + ex.Message;
                }
            }
        }
    }
}