<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AccountRegistration.aspx.cs" Inherits="SeniorProject.AccountRegistration" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="stylesheet" href="StyleSheet.css?v=5" />
    <title>Create Your Account</title>
</head>

<body>
    <form id="form1" runat="server">
        <div>

            <asp:Label ID="createtitle" runat="server" Text="Create Your Account"  CssClass="title-container"></asp:Label>

            <div class="bubble-section">

                <label for="FnameTB">First Name:</label>
                <asp:TextBox ID="FnameTB" runat="server" ></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                    ControlToValidate="FnameTB" 
                    ErrorMessage="First name is required!" 
                    ForeColor="Red"
                    Display="Dynamic"></asp:RequiredFieldValidator>
                <br /><br />

                <label for="LnameTB">Last Name:</label>
                <asp:TextBox ID="LnameTB" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                    ControlToValidate="LnameTB" 
                    ErrorMessage="Last name is required!" 
                    ForeColor="Red"
                    Display="Dynamic"></asp:RequiredFieldValidator>
                <br /><br />

                <label for="txtUsername">Create a Username:</label>
                <asp:TextBox ID="txtUsername" runat="server" ></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                    ControlToValidate="txtUsername" 
                    ErrorMessage="Username is required!" 
                    ForeColor="Red"
                    Display="Dynamic"></asp:RequiredFieldValidator>
                <br /><br />

                <label for="txtPassword">Set Your Password:</label>
                <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" ></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                    ControlToValidate="txtPassword" 
                    ErrorMessage="Password is required!" 
                    ForeColor="Red"
                    Display="Dynamic"></asp:RequiredFieldValidator>
                <br /><br />
                <asp:Button ID="registerbutton" runat="server" Text="Register"  OnClick="registerbutton_Click"  CssClass="btn" />

            </div>
        </div>
    </form>
</body>
</html>
