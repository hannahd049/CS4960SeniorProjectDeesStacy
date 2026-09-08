<%@ Page Language="C#" AutoEventWireup="true" Async="true"
    CodeBehind="ForgotPassword.aspx.cs"
    Inherits="SeniorProject.ForgotPassword" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">
    <link rel="stylesheet" href="StyleSheet.css" />
    <title>Forgot Password</title>

    <script>
        function clearError() {
            document.getElementById('<%= lblMessage.ClientID %>').innerText = "";
        }
    </script>
</head>

<body>

<form id="form1" runat="server">

    <div style="
        margin: 80px auto;
        width: 400px;
        padding: 35px;
        font-family: Arial, sans-serif;
        background-color: white;
        border-radius: 20px;
        box-shadow: 0 10px 25px rgba(0,0,0,0.15);
        border: 2px solid #f3c6d3;
    ">

        <h2 style="text-align: center; color: #d46a92;">
            Forgot Password?
        </h2>

        <p style="color: #555; text-align:center; margin-bottom: 20px;">
            Enter your email address and we'll send you a link to reset your password.
        </p>

        <label for="txtEmail" style="display:block; margin-top: 10px;">Email Address:</label>

        <asp:TextBox
            ID="txtEmail"
            runat="server"
            Width="100%"
            onkeyup="clearError()"
            style="margin-top: 5px; padding: 12px; border-radius: 8px; border: 1px solid #ccc;">
        </asp:TextBox>

        <asp:Label
            ID="lblMessage"
            runat="server"
            ForeColor="Red"
            style="display:block; margin-top: 10px;">
        </asp:Label>

        <asp:Button
            ID="btnSendEmail"
            runat="server"
            Text="Send Reset Link"
            OnClick="btnSendEmail_Click"
            style="
                margin-top: 20px;
                padding: 12px;
                width: 100%;
                border: none;
                border-radius: 8px;
                background-color: #d46a92;
                color: white;
                font-size: 16px;
                cursor: pointer;
            " />

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