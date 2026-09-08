using System;
using System.Data.SqlClient;
using System.Drawing;

namespace SeniorProject
{
    public partial class ForgotResetPassword : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack)
            {
                txtNewPassword.Attributes["value"] = txtNewPassword.Text;
                txtConfirmPassword.Attributes["value"] = txtConfirmPassword.Text;
            }
        }

        protected void btnReset_Click(object sender, EventArgs e)
        {
            string email = txtEmail.Text.Trim();
            string newPassword = txtNewPassword.Text.Trim();
            string confirmPassword = txtConfirmPassword.Text.Trim();

            if (string.IsNullOrEmpty(email))
            {
                lblMessage.ForeColor = Color.Red;
                lblMessage.Text = "Please enter your email.";
                return;
            }

            if (string.IsNullOrEmpty(newPassword))
            {
                lblMessage.ForeColor = Color.Red;
                lblMessage.Text = "Please enter a new password.";
                return;
            }

            if (string.IsNullOrEmpty(confirmPassword))
            {
                lblMessage.ForeColor = Color.Red;
                lblMessage.Text = "Please confirm your password.";
                return;
            }

            if (newPassword != confirmPassword)
            {
                lblMessage.ForeColor = Color.Red;
                lblMessage.Text = "Passwords do not match.";
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

                    string query = "UPDATE Users SET Password = @Password WHERE Email = @Email";

                    using (SqlCommand command = new SqlCommand(query, connection))
                    {
                        command.Parameters.AddWithValue("@Password", newPassword);
                        command.Parameters.AddWithValue("@Email", email);

                        int rowsAffected = command.ExecuteNonQuery();

                        if (rowsAffected > 0)
                        {
                            Response.Redirect("~/LogInPage.aspx", false);
                        }
                        else
                        {
                            lblMessage.ForeColor = Color.Red;
                            lblMessage.Text = "Email not found.";
                        }
                    }
                }
                catch (Exception ex)
                {
                    lblMessage.ForeColor = Color.Red;
                    lblMessage.Text = "Error: " + ex.Message;
                }
            }
        }
    }
}
