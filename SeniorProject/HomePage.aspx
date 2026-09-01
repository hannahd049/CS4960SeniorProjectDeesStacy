<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="HomePage.aspx.cs" Inherits="SeniorProject.HomePage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <div>
            <asp:Label ID="greeting" runat="server" Text="Please Login or Sign Up"></asp:Label> <br />
            <asp:Button ID="loginbutton" runat="server" Text="Login" OnClick="loginbutton_Click"></asp:Button><br />
                <asp:Button ID="loginbutton" runat="server" Text="Login" OnClick="loginbutton_Click"></asp:Button><br />
                <div>
                    <a href="Channels.aspx" class="nav-link">Channels</a>
                    <a href="UserProfile.aspx" class="nav-link">Profile</a> 
                </div>

            </div>
        </div>
    </form>
</body>
</html>
