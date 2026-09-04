<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EmailVeri2.aspx.cs" Inherits="SeniorProject.EmailVeri2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
     <link rel="stylesheet" href="StyleSheet.css?v=4" />
    <title>Verify Your Email</title>
</head>
<body>
    <form id="form1" runat="server">
        <div class="bubble-section">
            <asp:Panel ID="EmailPanel" runat="server">

                <label for="EmailTB">Enter Your Email:</label>
                <asp:TextBox ID="EmailTB" runat="server"></asp:TextBox>

                <asp:RegularExpressionValidator
                    ID="EmailValidator"
                    runat="server"
                    ControlToValidate="EmailTB"
                    ErrorMessage="Please enter a valid .edu, .org, or .net email."
                    ValidationExpression="^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.(edu|org|net)$"
                    ForeColor="Red" />

                <asp:Button ID="SendCodeBtn" runat="server" Text="Send Verification Code" CssClass="btn" OnClick="SendCodeBtn_Click" />
                <asp:Label ID="EmailMessage" runat="server" ForeColor="Green"></asp:Label>
                </asp:Panel>


                <!-- STEP 2: Enter Code -->
                <asp:Panel ID="CodePanel" runat="server" Visible="false">

                    <label for="CodeTB">Enter the Code Sent to Your Email:</label>
                    <asp:TextBox ID="CodeTB" runat="server"></asp:TextBox>

                <asp:Button ID="VeriCodeBtn" runat="server" Text="Verify Code" cssclass="btn" OnClick="VeriCodeBtn_Click" /> <br /><br />
                  <asp:Label ID="CodeMessage" runat="server" ForeColor="Red"></asp:Label>
                    <asp:Button ID="ResendBtn" runat="server" Text="Resend Code" CssClass="btn" OnClick="ResendBtn_Click" />
                    </asp:Panel>
        </div>
    </form>
</body>
</html>
