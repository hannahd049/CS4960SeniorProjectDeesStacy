using System;
using System.Configuration;
using System.Data.SqlClient;
using System.IO;
using System.Web.UI;

namespace SeniorProject
{
    public partial class AccountSettings : Page
    {
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

            string email = Session["UserEmail"].ToString();

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
                        SELECT FirstName, LastName, Username,
                               Email, ProfilePicture, ProfileBanner, Major, AcademicYear, Bio, Status
                        FROM Users
                        WHERE Email = @Email";

                    using (SqlCommand command =
                        new SqlCommand(query, connection))
                    {
                        command.Parameters.AddWithValue("@Email", email);

                        using (SqlDataReader reader =
                            command.ExecuteReader())
                        {
                            if (reader.Read())
                            {
                                txtFirstName.Text =
                                    reader["FirstName"].ToString();

                                txtLastName.Text =
                                    reader["LastName"].ToString();

                                txtUsername.Text =
                                    reader["Username"].ToString();

                                lblEmail.Text =
                                    reader["Email"].ToString();

                                ddlMajor.SelectedValue = Convert.ToString(reader["Major"]);
                                ddlYear.SelectedValue = Convert.ToString(reader["AcademicYear"]);
                                txtBio.Text = Convert.ToString(reader["Bio"]);
                                txtStatus.Text = Convert.ToString(reader["Status"]);

                                string bannerFile = Path.GetFileName(Convert.ToString(reader["ProfileBanner"]));
                                if (!string.IsNullOrWhiteSpace(bannerFile) &&
                                    File.Exists(Server.MapPath("~/Images/" + bannerFile)))
                                {
                                    imgBanner.ImageUrl = "~/Images/" + bannerFile;
                                    imgBanner.Visible = true;
                                }

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

            string email = Session["UserEmail"].ToString();

            string firstName = txtFirstName.Text.Trim();
            string lastName = txtLastName.Text.Trim();
            string username = txtUsername.Text.Trim();

            string currentPassword = txtCurrentPassword.Text;
            string newPassword = txtNewPassword.Text;
            string confirmPassword = txtConfirmPassword.Text;

            lblNameError.Text = "";
            lblPassError.Text = "";
            lblMessage.Text = "";

            if (string.IsNullOrWhiteSpace(firstName))
            {
                lblNameError.Text = "Please enter your first name.";
                return;
            }

            if (string.IsNullOrWhiteSpace(lastName))
            {
                lblNameError.Text = "Please enter your last name.";
                return;
            }

            if (string.IsNullOrWhiteSpace(username))
            {
                lblNameError.Text = "Please enter a username.";
                return;
            }

            bool changingPassword =
                !string.IsNullOrEmpty(currentPassword) ||
                !string.IsNullOrEmpty(newPassword) ||
                !string.IsNullOrEmpty(confirmPassword);

            if (changingPassword)
            {
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
                ConfigurationManager
                .ConnectionStrings["SeniorProjectConnection"]
                .ConnectionString;

            using (SqlConnection connection =
                new SqlConnection(connectionString))
            {
                try
                {
                    connection.Open();

                    string selectQuery = @"
                        SELECT FirstName, LastName, Username, PasswordHash
                        FROM Users
                        WHERE Email = @Email";

                    string oldFirstName = "";
                    string oldLastName = "";
                    string oldUsername = "";
                    string storedPassword = "";

                    using (SqlCommand command =
                        new SqlCommand(selectQuery, connection))
                    {
                        command.Parameters.AddWithValue("@Email", email);

                        using (SqlDataReader reader =
                            command.ExecuteReader())
                        {
                            if (!reader.Read())
                            {
                                lblMessage.ForeColor =
                                    System.Drawing.Color.Red;

                                lblMessage.Text =
                                    "Your account could not be found.";
                                return;
                            }

                            oldFirstName =
                                reader["FirstName"].ToString();

                            oldLastName =
                                reader["LastName"].ToString();

                            oldUsername =
                                reader["Username"].ToString();

                            storedPassword =
                                reader["PasswordHash"].ToString();
                        }
                    }

                    if (changingPassword &&
                        storedPassword != currentPassword)
                    {
                        ShowPasswordSection = true;

                        lblPassError.Text =
                            "Your current password is incorrect.";
                        return;
                    }

                    bool firstNameChanged =
                        oldFirstName != firstName;

                    bool lastNameChanged =
                        oldLastName != lastName;

                    bool usernameChanged =
                        oldUsername != username;

                    bool passwordChanged = changingPassword;

                    // Check whether another account uses this username.
                    if (usernameChanged)
                    {
                        string checkUsernameQuery = @"
                            SELECT COUNT(*)
                            FROM Users
                            WHERE Username = @Username
                              AND Email <> @Email";

                        using (SqlCommand command =
                            new SqlCommand(
                                checkUsernameQuery, connection))
                        {
                            command.Parameters.AddWithValue(
                                "@Username", username);

                            command.Parameters.AddWithValue(
                                "@Email", email);

                            int usernameExists =
                                (int)command.ExecuteScalar();

                            if (usernameExists > 0)
                            {
                                lblNameError.Text =
                                    "That username is already taken.";
                                return;
                            }
                        }
                    }

                    // Update first name, last name, and username separately.
                    if (firstNameChanged ||
                        lastNameChanged ||
                        usernameChanged)
                    {
                        string updateProfileQuery = @"
                            UPDATE Users
                            SET FirstName = @FirstName,
                                LastName = @LastName,
                                Username = @Username
                            WHERE Email = @Email";

                        using (SqlCommand command =
                            new SqlCommand(
                                updateProfileQuery, connection))
                        {
                            command.Parameters.AddWithValue(
                                "@FirstName", firstName);

                            command.Parameters.AddWithValue(
                                "@LastName", lastName);

                            command.Parameters.AddWithValue(
                                "@Username", username);

                            command.Parameters.AddWithValue(
                                "@Email", email);

                            command.ExecuteNonQuery();
                        }

                        // Update the greeting for the current session.
                        Session["DisplayName"] = firstName;
                    }

                    // Update the password only when requested.
                    if (passwordChanged)
                    {
                        string passwordQuery = @"
                            UPDATE Users
                            SET Password = @Password
                            WHERE Email = @Email";

                        using (SqlCommand command =
                            new SqlCommand(
                                passwordQuery, connection))
                        {
                            command.Parameters.AddWithValue(
                                "@Password", newPassword);

                            command.Parameters.AddWithValue(
                                "@Email", email);

                            command.ExecuteNonQuery();
                        }
                    }

                    bool profileChanged =
                        firstNameChanged ||
                        lastNameChanged ||
                        usernameChanged;

                    if (profileChanged && passwordChanged)
                    {
                        lblMessage.ForeColor =
                            System.Drawing.Color.Green;

                        lblMessage.Text =
                            "Your changes were saved successfully!";
                    }
                    else if (profileChanged)
                    {
                        lblMessage.ForeColor =
                            System.Drawing.Color.Green;

                        lblMessage.Text =
                            "Profile updated successfully!";
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
                Path.GetExtension(fileProfilePic.FileName).ToLowerInvariant();

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
                string email = Session["UserEmail"].ToString();

                string fileName = Guid.NewGuid().ToString() + extension;

                string folderPath = Server.MapPath("~/Images/");

                if (!Directory.Exists(folderPath))
                {
                    Directory.CreateDirectory(folderPath);
                }

                string filePath =
                    Path.Combine(folderPath, fileName);

                fileProfilePic.SaveAs(filePath);

                string connectionString =
                    ConfigurationManager
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
                            "@ProfilePicture", fileName);

                        command.Parameters.AddWithValue(
                            "@Email", email);

                        int rowsUpdated = command.ExecuteNonQuery();

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

        protected void btnSaveProfile_Click(object sender, EventArgs e)
        {
            if (Session["UserEmail"] == null)
            {
                Response.Redirect("LogInPage.aspx");
                return;
            }

            string connectionString = ConfigurationManager.ConnectionStrings["SeniorProjectConnection"].ConnectionString;
            using (SqlConnection connection = new SqlConnection(connectionString))
            using (SqlCommand command = new SqlCommand(@"
                UPDATE Users SET Major=@Major, AcademicYear=@Year, Bio=@Bio, Status=@Status
                WHERE Email=@Email", connection))
            {
                command.Parameters.AddWithValue("@Major", ddlMajor.SelectedValue);
                command.Parameters.AddWithValue("@Year", ddlYear.SelectedValue);
                command.Parameters.AddWithValue("@Bio", txtBio.Text.Trim());
                command.Parameters.AddWithValue("@Status", txtStatus.Text.Trim());
                command.Parameters.AddWithValue("@Email", Session["UserEmail"].ToString());
                try
                {
                    connection.Open();
                    command.ExecuteNonQuery();
                    lblProfileMessage.ForeColor = System.Drawing.Color.Green;
                    lblProfileMessage.Text = "Profile saved successfully!";
                }
                catch (Exception ex)
                {
                    lblProfileMessage.ForeColor = System.Drawing.Color.Red;
                    lblProfileMessage.Text = "Could not save profile: " + ex.Message;
                }
            }
        }

        protected void btnUploadBanner_Click(object sender, EventArgs e)
        {
            if (Session["UserEmail"] == null)
            {
                Response.Redirect("LogInPage.aspx");
                return;
            }
            if (!fileBanner.HasFile)
            {
                lblProfileMessage.Text = "Please choose a banner image.";
                return;
            }

            string extension = Path.GetExtension(fileBanner.FileName).ToLowerInvariant();
            if (extension != ".jpg" && extension != ".jpeg" &&
                extension != ".png" && extension != ".gif" && extension != ".webp")
            {
                lblProfileMessage.Text = "Please upload a JPG, PNG, GIF or WebP image.";
                return;
            }
            if (fileBanner.PostedFile.ContentLength > 5 * 1024 * 1024)
            {
                lblProfileMessage.Text = "Banner must be 5 MB or smaller.";
                return;
            }

            try
            {
                // Verify image bytes, not just the filename extension.
                byte[] bytes = fileBanner.FileBytes;
                bool isJpeg = bytes.Length >= 3 && bytes[0] == 0xFF && bytes[1] == 0xD8 && bytes[2] == 0xFF;
                bool isPng = bytes.Length >= 8 && bytes[0] == 0x89 && bytes[1] == 0x50 && bytes[2] == 0x4E && bytes[3] == 0x47;
                bool isGif = bytes.Length >= 6 && bytes[0] == 0x47 && bytes[1] == 0x49 && bytes[2] == 0x46;
                bool isWebp = bytes.Length >= 12 && bytes[0] == 0x52 && bytes[1] == 0x49 && bytes[2] == 0x46 &&
                    bytes[3] == 0x46 && bytes[8] == 0x57 && bytes[9] == 0x45 && bytes[10] == 0x42 && bytes[11] == 0x50;
                bool valid = ((extension == ".jpg" || extension == ".jpeg") && isJpeg) ||
                    (extension == ".png" && isPng) || (extension == ".gif" && isGif) ||
                    (extension == ".webp" && isWebp);
                if (!valid)
                {
                    lblProfileMessage.Text = "The selected file is not a valid image.";
                    return;
                }

                string name = Guid.NewGuid().ToString("N") + extension;
                string folder = Server.MapPath("~/Images/");
                Directory.CreateDirectory(folder);
                fileBanner.SaveAs(Path.Combine(folder, name));

                string connectionString = ConfigurationManager.ConnectionStrings["SeniorProjectConnection"].ConnectionString;
                using (SqlConnection connection = new SqlConnection(connectionString))
                using (SqlCommand command = new SqlCommand(
                    "UPDATE Users SET ProfileBanner=@Banner WHERE Email=@Email", connection))
                {
                    command.Parameters.AddWithValue("@Banner", name);
                    command.Parameters.AddWithValue("@Email", Session["UserEmail"].ToString());
                    connection.Open();
                    command.ExecuteNonQuery();
                }
                imgBanner.ImageUrl = "~/Images/" + name;
                imgBanner.Visible = true;
                lblProfileMessage.ForeColor = System.Drawing.Color.Green;
                lblProfileMessage.Text = "Banner updated successfully!";
            }
            catch (Exception ex)
            {
                lblProfileMessage.ForeColor = System.Drawing.Color.Red;
                lblProfileMessage.Text = "Banner upload failed: " + ex.Message;
            }
        }

        // DELETE ACCOUNT
        protected void btnProceedDelete_Click(object sender, EventArgs e)
        {
            if (Session["UserEmail"] == null)
            {
                Response.Redirect("LogInPage.aspx");
                return;
            }

            string email = Session["UserEmail"].ToString();

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
                        DELETE FROM Users
                        WHERE Email = @Email";

                    using (SqlCommand command =
                        new SqlCommand(query, connection))
                    {
                        command.Parameters.AddWithValue("@Email", email);
                        command.ExecuteNonQuery();
                    }

                    Session.Clear();
                    Session.Abandon();

                    Response.Redirect("LogInPage.aspx", false);
                    Context.ApplicationInstance.CompleteRequest();
                }
                catch (Exception ex)
                {
                    lblMessage.ForeColor =
                        System.Drawing.Color.Red;

                    lblMessage.Text =
                        "Account could not be deleted: " + ex.Message;
                }
            }
        }
    }
}
