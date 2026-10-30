using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;

namespace SeniorProject
{
    public partial class Channels : Page
    {
        private readonly string connectionString =
            ConfigurationManager
            .ConnectionStrings["SeniorProjectConnection"]
            .ConnectionString;

        protected string CurrentUsername
        {
            get
            {
                return Session["Username"]?.ToString() ?? "";
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserID"] == null)
            {
                Response.Redirect("LogInPage.aspx");
                return;
            }

            if (!IsPostBack)
            {
                LoadChannels();
                LoadMessages();
                LoadUsers();
            }
        }

        private void LoadChannels()
        {
            using (SqlConnection connection =
                new SqlConnection(connectionString))
            {
                string query = @"
                    SELECT
                        ChannelID,
                        ChannelName
                    FROM Channels
                    ORDER BY ChannelName";

                SqlDataAdapter adapter =
                    new SqlDataAdapter(query, connection);

                DataTable table =
                    new DataTable();

                adapter.Fill(table);

                rptChannels.DataSource = table;
                rptChannels.DataBind();
            }
        }

        private void LoadMessages()
        {
            using (SqlConnection connection =
                new SqlConnection(connectionString))
            {
                string query = @"
                    SELECT
                        m.MessageID,
                        m.MessageText,
                        u.Username,
                        m.SentDate
                    FROM Messages m
                    INNER JOIN Users u
                        ON m.UserID = u.UserID
                    ORDER BY m.SentDate";

                SqlDataAdapter adapter =
                    new SqlDataAdapter(query, connection);

                DataTable table =
                    new DataTable();

                adapter.Fill(table);

                rptMessages.DataSource = table;
                rptMessages.DataBind();
            }
        }

        private void LoadUsers()
        {
            using (SqlConnection connection =
                new SqlConnection(connectionString))
            {
                string query = @"
                    SELECT Username
                    FROM Users
                    ORDER BY Username";

                SqlDataAdapter adapter =
                    new SqlDataAdapter(query, connection);

                DataTable table =
                    new DataTable();

                adapter.Fill(table);

                rptUsers.DataSource = table;
                rptUsers.DataBind();
            }
        }
        protected void btnSend_Click(
    object sender,
    EventArgs e)
        {
            if (Session["UserID"] == null)
            {
                Response.Redirect("LogInPage.aspx");
                return;
            }

            string message =
                txtMessage.Text.Trim();

            if (string.IsNullOrEmpty(message))
            {
                return;
            }

            int userId =
                Convert.ToInt32(Session["UserID"]);

            using (SqlConnection connection =
                new SqlConnection(connectionString))
            {
                connection.Open();

                string query = @"
            INSERT INTO Messages
            (
                ChannelID,
                UserID,
                MessageText
            )
            VALUES
            (
                @ChannelID,
                @UserID,
                @MessageText
            )";

                using (SqlCommand command =
                    new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue(
                        "@ChannelID", 1);

                    command.Parameters.AddWithValue(
                        "@UserID", userId);

                    command.Parameters.AddWithValue(
                        "@MessageText", message);

                    command.ExecuteNonQuery();
                }
            }

            txtMessage.Text = "";

            LoadMessages();
        }
    }
}