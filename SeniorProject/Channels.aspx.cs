using System;
using System.Configuration;
using System.Data.SqlClient;
using System.IO;
using System.Web;
using System.Web.UI;

namespace SeniorProject
{
    public partial class Channels : Page
    {
        protected string ChatUsername { get; private set; } = "";
        protected string ChatAvatarUrl { get; private set; } = "";
        protected string ChatBannerUrl { get; private set; } = "";
        protected string ChatMajor { get; private set; } = "";
        protected string ChatYear { get; private set; } = "";
        protected string ChatBio { get; private set; } = "";
        protected string ChatStatus { get; private set; } = "";
        protected string ChatMemberSince { get; private set; } = "";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserEmail"] == null)
            {
                Response.Redirect("LogInPage.aspx", false);
                Context.ApplicationInstance.CompleteRequest();
                return;
            }

            string email = Session["UserEmail"].ToString();
            string connectionString = ConfigurationManager
                .ConnectionStrings["SeniorProjectConnection"].ConnectionString;

            using (SqlConnection connection = new SqlConnection(connectionString))
            using (SqlCommand command = new SqlCommand(
                "SELECT Username, ProfilePicture, ProfileBanner, Major, AcademicYear, Bio, Status, CreatedAt FROM Users WHERE Email = @Email", connection))
            {
                command.Parameters.AddWithValue("@Email", email);
                connection.Open();

                using (SqlDataReader reader = command.ExecuteReader())
                {
                    if (!reader.Read())
                    {
                        Response.Redirect("LogInPage.aspx", false);
                        Context.ApplicationInstance.CompleteRequest();
                        return;
                    }

                    ChatUsername = Convert.ToString(reader["Username"]);
                    ChatMajor = Convert.ToString(reader["Major"]);
                    ChatYear = Convert.ToString(reader["AcademicYear"]);
                    ChatBio = Convert.ToString(reader["Bio"]);
                    ChatStatus = Convert.ToString(reader["Status"]);
                    if (reader["CreatedAt"] != DBNull.Value)
                        ChatMemberSince = Convert.ToDateTime(reader["CreatedAt"]).ToString("MMM d, yyyy");
                    string bannerName = Path.GetFileName(Convert.ToString(reader["ProfileBanner"]));
                    if (!string.IsNullOrWhiteSpace(bannerName) &&
                        File.Exists(Server.MapPath("~/Images/" + bannerName)))
                        ChatBannerUrl = ResolveUrl("~/Images/" + bannerName);
                    string fileName = Convert.ToString(reader["ProfilePicture"]);

                    // The database stores a filename, not the image bytes.
                    // Ignore directory components to keep images inside ~/Images/.
                    fileName = Path.GetFileName(fileName ?? "");
                    string imagePath = "~/Images/default-avatar.png";

                    if (!string.IsNullOrWhiteSpace(fileName) &&
                        File.Exists(Server.MapPath("~/Images/" + fileName)))
                    {
                        imagePath = "~/Images/" + fileName;
                    }

                    ChatAvatarUrl = ResolveUrl(imagePath);
                }
            }
        }
    }
}
