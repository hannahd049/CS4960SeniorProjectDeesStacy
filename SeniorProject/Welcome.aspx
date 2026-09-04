<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Welcome.aspx.cs" Inherits="SeniorProject.Welcome" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="stylesheet" href="StyleSheet.css?v=5" />
    <title>Login or Sign Up</title>
</head>
<body>
    <form id="form1" runat="server">
            <div class="welcome-container">
                <div class="bubble-section">

                    <asp:Label ID="greeting" runat="server" Text="Please Login or Sign Up"></asp:Label><br />
                    <asp:Button ID="loginbutton" runat="server" Text="Login" OnClick="loginbutton_Click" CssClass="btn" /><br />
                    <asp:Button ID="signupbutton" runat="server" Text="Sign Up" OnClick="signupbutton_Click" CssClass="btn" /><br />
                </div>
            </div>
    </form>
</body>
</html>
