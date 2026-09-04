using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SeniorProject
{
    public partial class EmailVeri2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            this.UnobtrusiveValidationMode = System.Web.UI.UnobtrusiveValidationMode.None;
        }

        protected void SendCodeBtn_Click(object sender, EventArgs e)
        {
            string email = EmailTB.Text.Trim();

            // Generate 6-digit code
            Random rnd = new Random();
            int code = rnd.Next(100000, 999999);

            // Store code + email in session
            Session["VerificationCode"] = code.ToString();
            Session["VerificationEmail"] = email;

            // Send email
            SendEmailCode(email, code.ToString());

            // Switch UI to code entry
            EmailPanel.Visible = false;
            CodePanel.Visible = true;

            // Disable resend button for 15 seconds
            ResendBtn.Enabled = false;
            ScriptManager.RegisterStartupScript(this, GetType(), "EnableResend",
                "setTimeout(function(){ document.getElementById('" + ResendBtn.ClientID + "').disabled = false; }, 15000);",
                true);

            EmailMessage.Text = "A verification code has been sent.";
        }
        private void SendEmailCode(string email, string code)
        {
            MailMessage msg = new MailMessage();
            msg.From = new MailAddress("verifystudent99@gmail.com");   // MUST MATCH LOGIN
            msg.To.Add(email);
            msg.Subject = "Your Verification Code";
            msg.Body = "Your verification code is: " + code;

            SmtpClient smtp = new SmtpClient("smtp.gmail.com", 587);
            smtp.EnableSsl = true;

            // USE YOUR APP PASSWORD HERE
            smtp.Credentials = new NetworkCredential("verifystudent99@gmail.com", "bwjq wdhp ibtd sdqk");

            smtp.Send(msg);
        }
        protected void VeriCodeBtn_Click(object sender, EventArgs e)
        {
            string enteredCode = CodeTB.Text.Trim();
            string actualCode = Session["VerificationCode"].ToString();

            if (enteredCode == actualCode)
            {
                Response.Redirect("AccountRegistration.aspx");
            }
            else
            {
                CodeMessage.Text = "Incorrect code. Please try again.";
            }
        }

        protected void ResendBtn_Click(object sender, EventArgs e)
        {
            string email = Session["VerificationEmail"].ToString();

            // Generate new code
            Random rnd = new Random();
            int code = rnd.Next(100000, 999999);
            Session["VerificationCode"] = code.ToString();

            SendEmailCode(email, code.ToString());

            CodeMessage.ForeColor = System.Drawing.Color.Green;
            CodeMessage.Text = "A new code has been sent.";

            // Disable resend again
            ResendBtn.Enabled = false;
            ScriptManager.RegisterStartupScript(this, GetType(), "EnableResendAgain",
                "setTimeout(function(){ document.getElementById('" + ResendBtn.ClientID + "').disabled = false; }, 15000);",
                true);
        }
    }
}