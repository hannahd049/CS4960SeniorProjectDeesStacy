﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ForgotResetPassword.aspx.cs" Inherits="SeniorProject.ForgotResetPassword" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">
    <link rel="stylesheet" href="StyleSheet.css" />
    <title>Reset Password</title>

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
            Reset Your Password
        </h2>

        <label for="txtEmail" style="display:block; margin-top: 15px;">Email:</label>
        <asp:TextBox
            ID="txtEmail"
            runat="server"
            Width="100%"
            onkeyup="clearError()"
            style="margin-top: 5px; padding: 10px; border-radius: 8px; border: 1px solid #ccc;">
        </asp:TextBox>

        <label for="txtNewPassword" style="display:block; margin-top: 15px;">New Password:</label>
        <asp:TextBox
            ID="txtNewPassword"
            runat="server"
            TextMode="Password"
            Width="100%"
            onkeyup="clearError()"
            style="margin-top: 5px; padding: 10px; border-radius: 8px; border: 1px solid #ccc;">
        </asp:TextBox>

        <label for="txtConfirmPassword" style="display:block; margin-top: 15px;">Confirm Password:</label>
        <asp:TextBox
            ID="txtConfirmPassword"
            runat="server"
            TextMode="Password"
            Width="100%"
            onkeyup="clearError()"
            style="margin-top: 5px; padding: 10px; border-radius: 8px; border: 1px solid #ccc;">
        </asp:TextBox>

        <asp:Label
            ID="lblMessage"
            runat="server"
            ForeColor="Red"
            style="display:block; margin-top: 10px;">
        </asp:Label>

        <asp:Button
            ID="btnReset"
            runat="server"
            Text="Reset Password"
            OnClick="btnReset_Click"
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

    </div>

</form>

</body>
</html>