<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ForgotResetPassword.aspx.cs" Inherits="SeniorProject.ForgotResetPassword" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="stylesheet" href="StyleSheet.css" />
    <title>Reset Password</title>
</head>
<body>
    <form id="form1" runat="server">

        <div style="margin: 50px auto; width: 300px; font-family: Arial, sans-serif;">
            <h2>Reset Password</h2>

            <label>Email:</label><br />
            <asp:TextBox ID="txtEmail" runat="server" Width="100%" /><br /><br />

            <label>New Password:</label><br />
            <asp:TextBox ID="txtNewPassword" runat="server" TextMode="Password" Width="100%" /><br /><br />

            <label>Confirm Password:</label><br />
            <asp:TextBox ID="txtConfirmPassword" runat="server" TextMode="Password" Width="100%" /><br /><br />

            <asp:Button 
                ID="btnReset" 
                runat="server" 
                Text="Reset Password" 
                OnClick="btnReset_Click" 
                Width="100%" />

            <br /><br />

            <asp:Label ID="lblMessage" runat="server" ForeColor="Red" />
        </div>

    </form>
</body>
</html>
