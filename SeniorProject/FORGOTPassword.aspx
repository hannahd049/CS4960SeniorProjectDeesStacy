<%@ Page Language="C#" AutoEventWireup="true" Async="true" CodeBehind="ForgotPassword.aspx.cs" Inherits="SeniorProject.ForgotPassword" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">
    <link rel="stylesheet" href="StyleSheet.css?v=5" />
    <title>Forgot Password - GirlTalk Meets STEM</title>

</head>

<body>

<form id="form1" runat="server">

    <div class="bubble-section">

        <asp:Label ID="forgottitle" runat="server" Text="Forgot Password?" CssClass="title-container"></asp:Label><br />

        <p>
            Enter your email address and we'll send you
            a link to reset your password.
        </p>

        <asp:TextBox ID="txtEmail" runat="server" placeholder="Email Address"> </asp:TextBox>

        <br />

        <asp:Button ID="btnSendEmail" runat="server" Text="Send Reset Email" CssClass="btn" OnClick="btnSendEmail_Click" />

        <asp:Label ID="lblMessage" runat="server" CssClass="message"> </asp:Label>

    </div>

</form>

</body>

</html>
