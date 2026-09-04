<%@ Page Language="C#" AutoEventWireup="true"
    Async="true"
    CodeBehind="ForgotPassword.aspx.cs"
    Inherits="SeniorProject.ForgotPassword" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">

    <title>Forgot Password - GirlTalk Meets STEM</title>

    <style>

        body {
            font-family: Arial, sans-serif;
            background-color: #f5f5f5;
            text-align: center;
            padding-top: 100px;
        }

        .box {
            width: 400px;
            margin: auto;
            background-color: white;
            padding: 35px;
            border-radius: 15px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.15);
        }

        h1 {
            color: #FA4616;
            margin-bottom: 10px;
        }

        p {
            color: #555;
        }

        .input {
            width: 90%;
            padding: 12px;
            margin: 15px 0;
            border: 1px solid #ccc;
            border-radius: 8px;
            font-size: 15px;
        }

        .button {
            background-color: #FA4616;
            color: white;
            border: none;
            padding: 12px 25px;
            border-radius: 8px;
            cursor: pointer;
            font-size: 15px;
        }

        .button:hover {
            background-color: #d93c0c;
        }

        .message {
            display: block;
            margin-top: 15px;
            color: #FA4616;
        }

    </style>

</head>

<body>

<form id="form1" runat="server">

    <div class="box">

        <h1>Forgot Password?</h1>

        <p>
            Enter your email address and we'll send you
            a link to reset your password.
        </p>

        <asp:TextBox
            ID="txtEmail"
            runat="server"
            CssClass="input"
            placeholder="Email Address">
        </asp:TextBox>

        <br />

        <asp:Button
            ID="btnSendEmail"
            runat="server"
            Text="Send Reset Email"
            CssClass="button"
            OnClick="btnSendEmail_Click" />

        <asp:Label
            ID="lblMessage"
            runat="server"
            CssClass="message">
        </asp:Label>

    </div>

</form>

</body>

</html>
