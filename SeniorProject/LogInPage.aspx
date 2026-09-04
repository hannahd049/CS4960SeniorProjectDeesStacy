<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LogInPage.aspx.cs" Inherits="SeniorProject.LogInPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">
    <link rel="stylesheet" href="StyleSheet.css" />
    <title>Login to Your Account</title>

    <script>
        function clearUserError() {
            document.getElementById('<%= lblUserError.ClientID %>').innerText = "";
        }

        function clearPassError() {
            document.getElementById('<%= lblPassError.ClientID %>').innerText = "";
        }
    </script>
</head>

<body>

    <form id="form1" runat="server">

        <div style="
            margin: 80px auto;
            width: 350px;
            padding: 35px;
            font-family: Arial, sans-serif;
            background-color: white;
            border-radius: 20px;
            box-shadow: 0 10px 25px rgba(0,0,0,0.15);
            border: 2px solid #f3c6d3;
        ">

            <h2 style="text-align: center; color: #d46a92;">
                Welcome Back
            </h2>

            <label for="txtEmail" style="display:block; margin-top: 15px;">Email:</label>
            <asp:TextBox
                ID="txtEmail"
                runat="server"
                Width="100%"
                onkeyup="clearUserError()"
                style="margin-top: 5px; padding: 8px; border-radius: 8px; border: 1px solid #ccc;">
            </asp:TextBox>

            <asp:Label 
                ID="lblUserError" 
                runat="server" 
                ForeColor="Red"
                style="font-size: 13px; display:block; margin-top: 4px; margin-bottom: 8px;" />

            <label for="txtPassword" style="display:block; margin-top: 5px;">Password:</label>
            <asp:TextBox
                ID="txtPassword"
                runat="server"
                TextMode="Password"
                Width="100%"
                onkeyup="clearPassError()"
                style="margin-top: 5px; padding: 8px; border-radius: 8px; border: 1px solid #ccc;">
            </asp:TextBox>

            <asp:Label 
                ID="lblPassError" 
                runat="server" 
                ForeColor="Red"
                style="font-size: 13px; display:block; margin-top: 4px;" />

            <div style="margin-top: 6px;">
                <asp:HyperLink
                    ID="lnkForgotPassword"
                    runat="server"
                    NavigateUrl="~/FORGOTPassword.aspx"
                    Text="Forgot your password?"
                    style="color: #b565a7; font-size: 14px;">
                </asp:HyperLink>
            </div>

            <asp:Button
                ID="btnLogin"
                runat="server"
                Text="Log In"
                OnClick="btnLogin_Click"
                Width="100%"
                style="
                    margin-top: 15px;
                    padding: 10px;
                    border: none;
                    border-radius: 8px;
                    background-color: #d46a92;
                    color: white;
                    font-size: 16px;
                    cursor: pointer;
                " />

            <p style="margin-top: 15px; font-size: 14px; text-align: center;">
                Not registered?
                <a href="#" style="text-decoration: none; color: #b565a7;">
                    Create an account
                </a>
            </p>

            <asp:Label
                ID="lblMessage"
                runat="server"
                ForeColor="Red"
                style="font-size: 14px; display:block; margin-top:10px;" />

        </div>

    </form>

</body>

</html>
