
using System;
using System.Data.SqlClient;
using System.Configuration;
using System.Web;
using System.Web.UI;

namespace SeniorProject
{
    public partial class AccountRegistration : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            this.UnobtrusiveValidationMode =
                System.Web.UI.UnobtrusiveValidationMode.None;
        }

        protected void registerbutton_Click(object sender, EventArgs e)
        {
            if (!Page.IsValid)
            {
                return;
            }

            string firstName = FnameTB.Text.Trim();
            string lastName = LnameTB.Text.Trim();
            string username = txtUsername.Text.Trim();
            string email = txtEmail.Text.Trim();
            string password = txtPassword.Text;

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

                    // Check whether the email or username already exists
                    string checkQuery = @"
                        SELECT COUNT(*)
                        FROM Users
                        WHERE Email = @Email
                           OR Username = @Username";

                    using (SqlCommand command =
                        new SqlCommand(checkQuery, connection))
                    {
                        command.Parameters.AddWithValue("@Email", email);
                        command.Parameters.AddWithValue("@Username", username);

                        int accountExists =
                            (int)command.ExecuteScalar();

                        if (accountExists > 0)
                        {
                            ShowMessage(
                                "That email or username is already registered.");
                            return;
                        }
                    }

                    // Save first name and last name separately
                    string insertQuery = @"
                        INSERT INTO Users
                            (FirstName, LastName, Username, Email, Password, Role)
                        VALUES
                            (@FirstName, @LastName, @Username, @Email, @Password, @Role)";

                    using (SqlCommand command =
                        new SqlCommand(insertQuery, connection))
                    {
                        command.Parameters.AddWithValue(
                            "@FirstName", firstName);

                        command.Parameters.AddWithValue(
                            "@LastName", lastName);

                        command.Parameters.AddWithValue(
                            "@Username", username);

                        command.Parameters.AddWithValue(
                            "@Email", email);

                        command.Parameters.AddWithValue(
                            "@Password", password);

                        command.Parameters.AddWithValue(
                            "@Role", "User");

                        command.ExecuteNonQuery();
                    }

                    Response.Redirect("LogInPage.aspx", false);
                    Context.ApplicationInstance.CompleteRequest();
                }
                catch (Exception)
                {
                    ShowMessage(
                        "Your account could not be created. Please try again.");
                }
            }
        }

        private void ShowMessage(string message)
        {
            string safeMessage =
                HttpUtility.JavaScriptStringEncode(message);

            ClientScript.RegisterStartupScript(
                this.GetType(),
                "RegistrationMessage",
                "alert('" + safeMessage + "');",
                true);
        }
    }
}
