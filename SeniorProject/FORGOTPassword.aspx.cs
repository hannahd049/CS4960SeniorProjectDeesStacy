using System;
using System.Threading.Tasks;
using System.Web.UI;
using MailKit.Net.Smtp;
using MailKit.Security;
using MimeKit;

namespace SeniorProject
{
    public partial class ForgotPassword : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected async void btnSendEmail_Click(object sender, EventArgs e)
        {
            string recipientEmail = txtEmail.Text.Trim();

            if (string.IsNullOrEmpty(recipientEmail))
            {
                lblMessage.Text = "Please enter your email address.";
                return;
            }

            try
            {
                // YOUR GMAIL ADDRESS
                string senderEmail = "";

                // YOUR GOOGLE APP PASSWORD
                string appPassword = "";

                // Temporary reset link for testing
                string resetLink =
                Request.Url.GetLeftPart(UriPartial.Authority)
                + "/ForgotResetPassword.aspx?email="
                + Server.UrlEncode(recipientEmail);

                // Create the email
                var message = new MimeMessage();

                message.From.Add(
                    new MailboxAddress(
                        "GirlTalk Meets STEM",
                        senderEmail
                    )
                );

                message.To.Add(
                    new MailboxAddress(
                        "",
                        recipientEmail
                    )
                );

                message.Subject =
                    "GirlTalk Meets STEM - Reset Your Password";

                var builder = new BodyBuilder();

                builder.HtmlBody = $@"
<!DOCTYPE html>
<html>
<body style='
    margin:0;
    padding:40px;
    background-color:#fff5f8;
    font-family:Arial,sans-serif;
'>

<div style='
    max-width:500px;
    margin:auto;
    background:white;
    padding:35px;
    border-radius:18px;
    box-shadow:0 4px 15px rgba(0,0,0,0.10);
'>

    <h1 style='
        text-align:center;
        color:#FA4616;
    '>
        GirlTalk Meets STEM
    </h1>

    <h2 style='
        text-align:center;
        color:#333333;
    '>
        Reset Your Password
    </h2>

    <p style='
        color:#555555;
        font-size:16px;
        line-height:1.6;
    '>
        We received a request to reset your
        GirlTalk Meets STEM password.
    </p>

    <p style='
        color:#555555;
        font-size:16px;
        line-height:1.6;
    '>
        Click the button below to reset your password.
    </p>

    <div style='
        text-align:center;
        margin:30px 0;
    '>

        <a href='{resetLink}'
           style='
                background-color:#FA4616;
                color:white;
                padding:14px 28px;
                text-decoration:none;
                border-radius:8px;
                font-size:16px;
                font-weight:bold;
                display:inline-block;
           '>
            Reset My Password
        </a>

    </div>

    <p style='
        color:#777777;
        font-size:13px;
    '>
        If you did not request a password reset,
        you can safely ignore this email.
    </p>

    <hr style='
        border:none;
        border-top:1px solid #eeeeee;
        margin:25px 0;
    '>

    <p style='
        text-align:center;
        color:#999999;
        font-size:12px;
    '>
        GirlTalk Meets STEM
    </p>

</div>

</body>
</html>";

                message.Body = builder.ToMessageBody();

                // Connect to Gmail
                using (var smtp = new SmtpClient())
                {
                    await smtp.ConnectAsync(
                        "smtp.gmail.com",
                        587,
                        SecureSocketOptions.StartTls
                    );

                    // Login using Gmail + App Password
                    await smtp.AuthenticateAsync(
                        senderEmail,
                        appPassword
                    );

                    // Send the email
                    await smtp.SendAsync(message);

                    await smtp.DisconnectAsync(true);
                }

                lblMessage.Text =
                    "Password reset email sent successfully!";
            }
            catch (Exception ex)
            {
                lblMessage.Text =
                    "Email Error: " + ex.Message;
            }
        }
    }
}