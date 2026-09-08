<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ForgotResetPassword.aspx.cs" Inherits="SeniorProject.ForgotResetPassword" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="stylesheet" href="StyleSheet.css?v=5" />
    <title>Reset Password</title>
</head>
<body>
    <form id="form1" runat="server">

        <div class="bubble-section">
            <asp:Label ID="resettitle" runat="server" Text="Reset Password" CssClass="title-container"></asp:Label><br />

            <label>Email:</label><br />
            <asp:TextBox ID="txtEmail" runat="server" /><br /><br />

            <label>New Password:</label><br />
            <asp:TextBox ID="txtNewPassword" runat="server" TextMode="Password" /><br /><br />

            <label>Confirm Password:</label><br />
            <asp:TextBox ID="txtConfirmPassword" runat="server" TextMode="Password" /><br /><br />

            <asp:Button 
                ID="btnReset" runat="server" Text="Reset Password" CssClass="btn" OnClick="btnReset_Click" />
            <br /><br />

            <asp:Label ID="lblMessage" runat="server" ForeColor="Red" />
        </div>

    </form>
</body>
</html>
