<%@ Page Language="C#" AutoEventWireup="true" Async="true" CodeBehind="ForgotPassword.aspx.cs" Inherits="SeniorProject.ForgotPassword" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">
    <link rel="stylesheet" href="StyleSheet.css?v=5" />
    <title>Forgot Password</title>

    <script>
        function clearError() {
            document.getElementById('<%= lblMessage.ClientID %>').innerText = "";
        }
    </script>
</head>

<body>

<form id="form1" runat="server">

    <div class="bubble-section">

        <h2 class="h2">Forgot Password?</h2>

        <p class="p"> Enter your email address and we'll send you a link to reset your password.</p>

        <label for="txtEmail" style="display:block; margin-top: 10px;">Email Address:</label>

        <asp:TextBox
            ID="txtEmail" runat="server" Width="100%" onkeyup="clearError()" CssClass="tb">
        </asp:TextBox>

        <asp:Label ID="lblMessage" runat="server" ForeColor="Red" style="display:block; margin-top: 10px;">
        </asp:Label>

        <asp:Button ID="btnSendEmail" runat="server" Text="Resend Link?" OnClick="btnSendEmail_Click" CssClass="btn" />

        <div style="margin-top: 10px; text-align:center;">
            <asp:HyperLink
                ID="lnkBackToLogin"
                runat="server"
                NavigateUrl="~/LogInPage.aspx"
                Text="Back to Login"
                style="color: #b565a7; font-size: 14px; text-decoration:none;">
            </asp:HyperLink>
        </div>

    </div>

</form>

</body>
</html>