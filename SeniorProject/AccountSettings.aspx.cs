using System;
using System.Data.SqlClient;
using System.IO;
using System.Web.UI;

namespace SeniorProject
{
    public partial class AccountSettings : Page
    {
        // Controls whether the password section stays open
        // after the page reloads because of an error.
        public bool ShowPasswordSection { get; set; }

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

            string email =
                Session["UserEmail"].ToString();

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

                    string query = @"
                        SELECT Name, Email, ProfilePicture
                        FROM Users
                        WHERE Email = @Email";

                    using (SqlCommand command =
                        new SqlCommand(query, connection))
                    {
                        command.Parameters.AddWithValue(
                            "@Email",
                            email);

                        using (SqlDataReader reader =
                            command.ExecuteReader())
                        {
                            if (reader.Read())
                            {
                                txtName.Text =
                                    reader["Name"].ToString();

                                lblEmail.Text =
                                    reader["Email"].ToString();

                                string profilePicture =
                                    reader["ProfilePicture"].ToString();

                                if (!string.IsNullOrEmpty(profilePicture))
                                {
                                    imgProfile.ImageUrl =
                                        "~/Images/" + profilePicture;
                                }
                                else
                                {
                                    imgProfile.ImageUrl =
                                        "~/Images/default-avatar.png";
                                }
                            }
                        }
                    }
                }
                catch (Exception ex)
                {
                    lblMessage.ForeColor =
                        System.Drawing.Color.Red;

                    lblMessage.Text =
                        "Database error: " + ex.Message;
                }
            }
        }


        // SAVE CHANGES
        protected void btnSave_Click(object sender, EventArgs e)
        {
            if (Session["UserEmail"] == null)
            {
                Response.Redirect("LogInPage.aspx");
                return;
            }

            string email =
                Session["UserEmail"].ToString();

            string newName =
                txtName.Text.Trim();

            string currentPassword =
                txtCurrentPassword.Text;

            string newPassword =
                txtNewPassword.Text;

            string confirmPassword =
                txtConfirmPassword.Text;

            // Clear old messages
            lblNameError.Text = "";
            lblPassError.Text = "";
            lblMessage.Text = "";

            // Check name
            if (string.IsNullOrEmpty(newName))
            {
                lblNameError.Text =
                    "Please enter your name.";

                return;
            }

            // Check if the user is trying to change
            // their password.
            bool changingPassword =
                !string.IsNullOrEmpty(currentPassword) ||
                !string.IsNullOrEmpty(newPassword) ||
                !string.IsNullOrEmpty(confirmPassword);

            // If any password field was filled in,
            // all password fields are required.
            if (changingPassword)
            {
                // Keep password section open
                ShowPasswordSection = true;

                if (string.IsNullOrEmpty(currentPassword))
                {
                    lblPassError.Text =
                        "Please enter your current password.";

                    return;
                }

                if (string.IsNullOrEmpty(newPassword))
                {
                    lblPassError.Text =
                        "Please enter a new password.";

                    return;
                }

                if (string.IsNullOrEmpty(confirmPassword))
                {
                    lblPassError.Text =
                        "Please confirm your new password.";

                    return;
                }

                if (newPassword != confirmPassword)
                {
                    lblPassError.Text =
                        "The new passwords do not match.";

                    return;
                }
            }

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

                    // Get the current name and password
                    string selectQuery = @"
                        SELECT Name, Password
                        FROM Users
                        WHERE Email = @Email";

                    string oldName = "";
                    string storedPassword = "";

                    using (SqlCommand command =
                        new SqlCommand(selectQuery, connection))
                    {
                        command.Parameters.AddWithValue(
                            "@Email",
                            email);

                        using (SqlDataReader reader =
                            command.ExecuteReader())
                        {
                            if (reader.Read())
                            {
                                oldName =
                                    reader["Name"].ToString();

                                storedPassword =
                                    reader["Password"].ToString();
                            }
                        }
                    }

                    // Check the current password
                    // only if the user is changing it.
                    if (changingPassword)
                    {
                        if (storedPassword != currentPassword)
                        {
                            ShowPasswordSection = true;

                            lblPassError.Text =
                                "Your current password is incorrect.";

                            return;
                        }
                    }

                    bool nameChanged =
                        oldName != newName;

                    bool passwordChanged =
                        changingPassword;


                    // Update name only if it actually changed.
                    if (nameChanged)
                    {
                        string nameQuery = @"
                            UPDATE Users
                            SET Name = @Name
                            WHERE Email = @Email";

                        using (SqlCommand command =
                            new SqlCommand(nameQuery, connection))
                        {
                            command.Parameters.AddWithValue(
                                "@Name",
                                newName);

                            command.Parameters.AddWithValue(
                                "@Email",
                                email);

                            command.ExecuteNonQuery();
                        }
                    }


                    // Update password only when
                    // Save Changes is clicked.
                    if (passwordChanged)
                    {
                        string passwordQuery = @"
                            UPDATE Users
                            SET Password = @Password
                            WHERE Email = @Email";

                        using (SqlCommand command =
                            new SqlCommand(passwordQuery, connection))
                        {
                            command.Parameters.AddWithValue(
                                "@Password",
                                newPassword);

                            command.Parameters.AddWithValue(
                                "@Email",
                                email);

                            command.ExecuteNonQuery();
                        }
                    }


                    // Show the correct message.
                    if (nameChanged && passwordChanged)
                    {
                        lblMessage.ForeColor =
                            System.Drawing.Color.Green;

                        lblMessage.Text =
                            "Your changes were saved successfully!";
                    }
                    else if (nameChanged)
                    {
                        lblMessage.ForeColor =
                            System.Drawing.Color.Green;

                        lblMessage.Text =
                            "Name updated successfully!";
                    }
                    else if (passwordChanged)
                    {
                        lblMessage.ForeColor =
                            System.Drawing.Color.Green;

                        lblMessage.Text =
                            "Password updated successfully!";
                    }
                    else
                    {
                        lblMessage.ForeColor =
                            System.Drawing.Color.Green;

                        lblMessage.Text =
                            "No changes were made.";
                    }


                    // Clear password fields after
                    // a successful password change.
                    if (passwordChanged)
                    {
                        txtCurrentPassword.Text = "";
                        txtNewPassword.Text = "";
                        txtConfirmPassword.Text = "";

                        ShowPasswordSection = false;
                    }
                }
                catch (Exception ex)
                {
                    lblMessage.ForeColor =
                        System.Drawing.Color.Red;

                    lblMessage.Text =
                        "Database error: " + ex.Message;
                }
            }
        }


        // UPLOAD PROFILE PICTURE
        protected void btnUploadPic_Click(object sender, EventArgs e)
        {
            if (Session["UserEmail"] == null)
            {
                Response.Redirect("LogInPage.aspx");
                return;
            }

            if (!fileProfilePic.HasFile)
            {
                lblMessage.ForeColor =
                    System.Drawing.Color.Red;

                lblMessage.Text =
                    "Please choose a picture first.";

                return;
            }

            string extension =
                Path.GetExtension(
                    fileProfilePic.FileName).ToLower();

            if (extension != ".jpg" &&
                extension != ".jpeg" &&
                extension != ".png" &&
                extension != ".gif")
            {
                lblMessage.ForeColor =
                    System.Drawing.Color.Red;

                lblMessage.Text =
                    "Please upload a JPG, JPEG, PNG, or GIF image.";

                return;
            }

            try
            {
                string email =
                    Session["UserEmail"].ToString();

                string fileName =
                    Guid.NewGuid().ToString() + extension;

                string folderPath =
                    Server.MapPath("~/Images/");

                if (!Directory.Exists(folderPath))
                {
                    Directory.CreateDirectory(folderPath);
                }

                string filePath =
                    Path.Combine(
                        folderPath,
                        fileName);

                fileProfilePic.SaveAs(filePath);

                string connectionString =
                    System.Configuration.ConfigurationManager
                    .ConnectionStrings["SeniorProjectConnection"]
                    .ConnectionString;

                using (SqlConnection connection =
                    new SqlConnection(connectionString))
                {
                    connection.Open();

                    string query = @"
                        UPDATE Users
                        SET ProfilePicture = @ProfilePicture
                        WHERE Email = @Email";

                    using (SqlCommand command =
                        new SqlCommand(query, connection))
                    {
                        command.Parameters.AddWithValue(
                            "@ProfilePicture",
                            fileName);

                        command.Parameters.AddWithValue(
                            "@Email",
                            email);

                        int rowsUpdated =
                            command.ExecuteNonQuery();

                        if (rowsUpdated > 0)
                        {
                            imgProfile.ImageUrl =
                                "~/Images/" + fileName;

                            lblMessage.ForeColor =
                                System.Drawing.Color.Green;

                            lblMessage.Text =
                                "Profile picture updated successfully!";
                        }
                        else
                        {
                            lblMessage.ForeColor =
                                System.Drawing.Color.Red;

                            lblMessage.Text =
                                "Profile picture could not be updated.";
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                lblMessage.ForeColor =
                    System.Drawing.Color.Red;

                lblMessage.Text =
                    "Upload error: " + ex.Message;
            }
        }


        // CANCEL ACCOUNT SETTINGS
        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("HomePage.aspx");
        }


        // DELETE ACCOUNT
        protected void btnProceedDelete_Click(object sender, EventArgs e)
        {
            if (Session["UserEmail"] == null)
            {
                Response.Redirect("LogInPage.aspx");
                return;
            }

            string email =
                Session["UserEmail"].ToString();

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

                    string query = @"
                        DELETE FROM Users
                        WHERE Email = @Email";

                    using (SqlCommand command =
                        new SqlCommand(query, connection))
                    {
                        command.Parameters.AddWithValue(
                            "@Email",
                            email);

                        command.ExecuteNonQuery();
                    }

                    // Log the user out
                    Session.Clear();
                    Session.Abandon();

                    // Send the user back to login
                    Response.Redirect("LogInPage.aspx");
                }
                catch (Exception ex)
                {
                    lblMessage.ForeColor =
                        System.Drawing.Color.Red;

                    lblMessage.Text =
                        "Account could not be deleted: "
                        + ex.Message;
                }
            }
        }
    }
}