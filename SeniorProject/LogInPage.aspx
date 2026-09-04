<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LogInPage.aspx.cs" Inherits="SeniorProject.LogInPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">
    <link rel="stylesheet" href="StyleSheet.css" />
    <title>Login to Your Account</title>
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

            <br />

            <label for="txtUsername">
                Username:
            </label>

            <br />

            <asp:TextBox
                ID="txtUsername"
                runat="server"
                Width="100%"
                style="padding: 8px; border-radius: 8px; border: 1px solid #ccc;">
            </asp:TextBox>

            <br />
            <br />

            <label for="txtPassword">
                Password:
            </label>

            <br />

            <asp:TextBox
                ID="txtPassword"
                runat="server"
                TextMode="Password"
                Width="100%"
                style="padding: 8px; border-radius: 8px; border: 1px solid #ccc;">
            </asp:TextBox>

            <br />

            <div style="text-align: center; margin-top: 10px;">

                <asp:HyperLink
                    ID="lnkForgotPassword"
                    runat="server"
                    NavigateUrl="~/ForgotResetPassword.aspx"
                    Text="Forgot your password?"
                    style="color: #b565a7;">
                </asp:HyperLink>

            </div>

            <br />

            <asp:Button
                ID="btnLogin"
                runat="server"
                Text="Log In"
                OnClick="btnLogin_Click"
                Width="100%"
                style="
                    padding: 10px;
                    border: none;
                    border-radius: 8px;
                    background-color: #d46a92;
                    color: white;
                    font-size: 16px;
                    cursor: pointer;
                " />

            <br />
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
