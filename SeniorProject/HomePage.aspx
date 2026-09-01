<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="HomePage.aspx.cs" Inherits="SeniorProject.HomePage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="stylesheet" href="StyleSheet.css" />
    <title>Home Page</title>

</head>
<body>
    <form id="form1" runat="server">
        <div>
            <div>
            <asp:Label ID="greeting" runat="server" Text="Please Login or Sign Up"></asp:Label> <br />
            <asp:Button ID="loginbutton" runat="server" Text="Login" OnClick="loginbutton_Click"></asp:Button><br />
            <asp:Button ID="signupbutton" runat="server" Text="Sign Up" OnClick="signupbutton_Click" ></asp:Button><br />
               
                <div>
                    <a href="Channels.aspx" >Channels</a>
                    <a href="UserProfile.aspx">Profile</a> 
                </div>

            </div>
        </div>
    </form>
</body>
</html>
