<%@ Page Language="C#" AutoEventWireup="true"
    CodeBehind="AccountSettings.aspx.cs"
    Inherits="SeniorProject.AccountSettings" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="stylesheet" href="StyleSheet.css?v=5" />
    <title>Account Settings</title>

    <script>
        function clearNameError() {
            const el = document.getElementById('<%= lblNameError.ClientID %>');
            if (el) el.innerText = "";
        }

        function clearEmailError() {
            const el = document.getElementById('<%= lblEmailError.ClientID %>');
            if (el) el.innerText = "";
        }

        function clearPassError() {
            const el = document.getElementById('<%= lblPassError.ClientID %>');
            if (el) el.innerText = "";
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

        <h2 style="text-align:center; color:#d46a92;">
            Account Settings
        </h2>

        <label for="txtName" style="display:block; margin-top: 15px;">
            Your Name:
        </label>

        <asp:TextBox
            ID="txtName"
            runat="server"
            Width="100%"
            onkeyup="clearNameError()"
            style="margin-top: 5px; padding: 8px; border-radius: 8px; border: 1px solid #ccc;">
        </asp:TextBox>

        <asp:Label
            ID="lblNameError"
            runat="server"
            ForeColor="Red"
            style="font-size: 13px; display:block; margin-top: 4px; margin-bottom: 8px;" />

        <label for="txtEmail" style="display:block; margin-top: 5px;">
            Email Address:
        </label>

        <asp:TextBox
            ID="txtEmail"
            runat="server"
            Width="100%"
            onkeyup="clearEmailError()"
            style="margin-top: 5px; padding: 8px; border-radius: 8px; border: 1px solid #ccc;">
        </asp:TextBox>

        <asp:Label
            ID="lblEmailError"
            runat="server"
            ForeColor="Red"
            style="font-size: 13px; display:block; margin-top: 4px; margin-bottom: 8px;" />

        <label for="txtPassword" style="display:block; margin-top: 5px;">
            Password:
        </label>

        <asp:TextBox
            ID="txtPassword"
            runat="server"
            Width="100%"
            onkeyup="clearPassError()"
            style="margin-top: 5px; padding: 8px; border-radius: 8px; border: 1px solid #ccc;">
        </asp:TextBox>

        <asp:Label
            ID="lblPassError"
            runat="server"
            ForeColor="Red"
            style="font-size: 13px; display:block; margin-top: 4px; margin-bottom: 8px;" />

        <div style="text-align:center; margin-top:20px;">

            <asp:Image
                ID="imgProfile"
                runat="server"
                Width="120px"
                Height="120px"
                ImageUrl="~/Images/default-avatar.png"
                style="border-radius:50%; border:2px solid #f3c6d3;" />

            <br />

            <asp:Button
                ID="btnUploadPic"
                runat="server"
                Text="Upload a picture"
                style="
                    margin-top: 10px;
                    padding: 10px;
                    border: none;
                    border-radius: 8px;
                    background-color: #d46a92;
                    color: white;
                    font-size: 14px;
                    cursor: pointer;
                " />

        </div>

        <asp:HyperLink
            ID="lnkDeleteAccount"
            runat="server"
            NavigateUrl="#"
            Text="Delete Your Account"
            style="color:#FA4616; display:block; margin-top:20px; text-align:center;">
        </asp:HyperLink>

        <p style="font-size:13px; color:#555; text-align:center;">
            We will send you an email confirmation. All boards you created will be permanently erased.
        </p>

        <asp:Button
            ID="btnSave"
            runat="server"
            Text="Save Changes"
            OnClick="btnSave_Click"
            style="
                margin-top: 15px;
                padding: 10px;
                width: 100%;
                border: none;
                border-radius: 8px;
                background-color: #d46a92;
                color: white;
                font-size: 16px;
                cursor: pointer;
            " />

        <asp:Label
            ID="lblMessage"
            runat="server"
            ForeColor="Red"
            style="font-size: 14px; display:block; margin-top:10px;" />

    </div>

</form>

</body>
</html>