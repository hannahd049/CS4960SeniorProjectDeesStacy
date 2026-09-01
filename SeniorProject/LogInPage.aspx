<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LogInPage.aspx.cs" Inherits="SeniorProject.LogInPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login</title>
</head>
<body>
    <form id="form1" runat="server">

        <div style="margin: 50px auto; width: 300px; font-family: Arial, sans-serif;">

            <h2>Login</h2>

            <div>
                <label for="txtUsername">Username:</label><br />
                <asp:TextBox 
                    ID="txtUsername" 
                    runat="server" 
                    Width="100%">
                </asp:TextBox>
            </div>

            <br />

            <div>
                <label for="txtPassword">Password:</label><br />
                <asp:TextBox 
                    ID="txtPassword" 
                    runat="server" 
                    TextMode="Password" 
                    Width="100%">
                </asp:TextBox>
            </div>

            <br />

            <div>
                <asp:Button 
                    ID="btnLogin" 
                    runat="server" 
                    Text="Log In" 
                    OnClick="btnLogin_Click" 
                    Width="100%" />
            </div>

            <br />

            <div style="text-align:center;">
                <asp:HyperLink 
                    ID="lnkForgotPassword" 
                    runat="server" 
                    NavigateUrl="~/ForgotResetPassword.aspx"
                    Text="Forgot your password?" />
            </div>

            <br />

            <asp:Label 
                ID="lblMessage" 
                runat="server" 
                ForeColor="Red">
            </asp:Label>

        </div>

    </form>
</body>
</html>
