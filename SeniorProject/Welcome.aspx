<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Welcome.aspx.cs" Inherits="SeniorProject.Welcome" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="stylesheet" href="StyleSheet.css?v=4" />
    <title>Login or Sign Up</title>
</head>
<body>
    <form id="form1" runat="server">
            <asp:Label ID="gametitle" runat="server" Text="WEB TITLE WHEN WE HAVE ONE" CssClass="title-container"></asp:Label><br />
                <div class="welcome-container">
                    <div class="bubble-section">

                        <asp:Label ID="greeting" runat="server" Text="Please Login or Sign Up"></asp:Label><br />
                        <asp:Label for="loginbutton" runat="server" Text="Already have an account? Please Log In"></asp:Label><br />
                        <asp:Button ID="loginbutton" runat="server" Text="Login" OnClick="loginbutton_Click" CssClass="btn" /><br />
                        <asp:Label for="signupbutton" runat="server" Text="Don't have an account with us? Create one here!"></asp:Label><br />
                        <asp:Button ID="signupbutton" runat="server" Text="Sign Up" OnClick="signupbutton_Click" CssClass="btn" /><br />
                    </div>
            </div>
    </form>
</body>
</html>
