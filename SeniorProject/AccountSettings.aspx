<%@ Page Language="C#" AutoEventWireup="true"
    CodeBehind="AccountSettings.aspx.cs"
    Inherits="SeniorProject.AccountSettings" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">

    <link rel="stylesheet" href="StyleSheet.css?v=5" />

    <title>Account Settings</title>

    <script>

        function showPasswordSection() {
            var section = document.getElementById("passwordSection");

            if (section.style.display === "none") {
                section.style.display = "block";
            } else {
                section.style.display = "none";
            }
        }


        function showPictureSection() {
            var section = document.getElementById("pictureSection");

            if (section.style.display === "none") {
                section.style.display = "block";
            } else {
                section.style.display = "none";
            }
        }


        function clearNameError() {
            const el =
                document.getElementById('<%= lblNameError.ClientID %>');

            if (el) {
                el.innerText = "";
            }
        }


        function clearPasswordErrors() {
            const el =
                document.getElementById('<%= lblPassError.ClientID %>');

            if (el) {
                el.innerText = "";
            }
        }


        function showDeletePopup() {
            document.getElementById("deletePopup").style.display = "flex";
        }


        function closeDeletePopup() {
            document.getElementById("deletePopup").style.display = "none";
        }

    </script>

</head>


<body>

<form id="form1" runat="server">


    <!-- ACCOUNT SETTINGS BOX -->

    <div style="
        margin: 60px auto;
        width: 400px;
        padding: 35px;
        font-family: Arial, sans-serif;
        background-color: white;
        border-radius: 20px;
        box-shadow: 0 10px 25px rgba(0,0,0,0.15);
        border: 2px solid #f3c6d3;
    ">


        <!-- TITLE -->

        <h2 style="
            text-align:center;
            color:#d46a92;
            margin-bottom:25px;
        ">
            Account Settings
        </h2>


        <!-- PROFILE PICTURE -->

        <div style="
            text-align:center;
            margin-bottom:25px;
        ">

            <asp:Image
                ID="imgProfile"
                runat="server"
                Width="130px"
                Height="130px"
                ImageUrl="~/Images/default-avatar.png"
                style="
                    border-radius:50%;
                    border:3px solid #f3c6d3;
                    object-fit:cover;
                "
            />

            <br />

            <asp:Button
                ID="btnShowPicture"
                runat="server"
                Text="Change Profile Picture"
                UseSubmitBehavior="false"
                OnClientClick="showPictureSection(); return false;"
                style="
                    margin-top:12px;
                    padding:9px 15px;
                    border:none;
                    border-radius:8px;
                    background-color:#d46a92;
                    color:white;
                    font-size:14px;
                    cursor:pointer;
                "
            />

        </div>


        <!-- PROFILE PICTURE SECTION -->

        <div
            id="pictureSection"
            style="
                display:none;
                padding:15px;
                margin-bottom:20px;
                background-color:#fff5f8;
                border-radius:10px;
                border:1px solid #f3c6d3;
            ">

            <label style="
                display:block;
                margin-bottom:8px;
                font-weight:bold;
                color:#555;
            ">
                Choose a new profile picture:
            </label>


            <asp:FileUpload
                ID="fileProfilePic"
                runat="server"
                style="width:100%;"
            />


            <asp:Button
                ID="btnUploadPic"
                runat="server"
                Text="Upload Picture"
                OnClick="btnUploadPic_Click"
                style="
                    margin-top:10px;
                    padding:9px 15px;
                    border:none;
                    border-radius:8px;
                    background-color:#d46a92;
                    color:white;
                    font-size:14px;
                    cursor:pointer;
                "
            />

        </div>


        <!-- NAME -->

        <label
            for="txtName"
            style="
                display:block;
                margin-top:15px;
                margin-bottom:5px;
                font-weight:bold;
            ">
            Display Name:
        </label>


        <asp:TextBox
            ID="txtName"
            runat="server"
            Width="100%"
            onkeyup="clearNameError()"
            style="
                box-sizing:border-box;
                padding:10px;
                border-radius:8px;
                border:1px solid #ccc;
            "
        >
        </asp:TextBox>


        <asp:Label
            ID="lblNameError"
            runat="server"
            ForeColor="Red"
            style="
                font-size:13px;
                display:block;
                margin-top:4px;
            "
        />


        <!-- EMAIL -->

        <label
            style="
                display:block;
                margin-top:18px;
                margin-bottom:5px;
                font-weight:bold;
            ">
            Email Address:
        </label>


        <asp:Label
            ID="lblEmail"
            runat="server"
            style="
                display:block;
                padding:10px;
                background-color:#f5f5f5;
                border:1px solid #ddd;
                border-radius:8px;
                color:#555;
                box-sizing:border-box;
            "
        />


        <!-- PASSWORD -->

        <label
            style="
                display:block;
                margin-top:18px;
                margin-bottom:5px;
                font-weight:bold;
            ">
            Password:
        </label>


        <div style="
            display:flex;
            align-items:center;
            gap:10px;
        ">


            <span style="
                flex:1;
                padding:10px;
                background-color:#f5f5f5;
                border:1px solid #ddd;
                border-radius:8px;
                color:#555;
                letter-spacing:3px;
            ">
                ••••••••••
            </span>


            <asp:Button
                ID="btnShowPassword"
                runat="server"
                Text="Change Password"
                UseSubmitBehavior="false"
                OnClientClick="showPasswordSection(); return false;"
                style="
                    padding:10px;
                    border:none;
                    border-radius:8px;
                    background-color:#d46a92;
                    color:white;
                    cursor:pointer;
                    white-space:nowrap;
                "
            />

        </div>


        <!-- PASSWORD SECTION -->

        <div
            id="passwordSection"
            style="
                display:none;
                padding:15px;
                margin-top:15px;
                background-color:#fff5f8;
                border-radius:10px;
                border:1px solid #f3c6d3;
            ">


            <label style="
                display:block;
                margin-bottom:5px;
                font-weight:bold;
            ">
                Current Password:
            </label>


            <asp:TextBox
                ID="txtCurrentPassword"
                runat="server"
                TextMode="Password"
                Width="100%"
                style="
                    box-sizing:border-box;
                    padding:10px;
                    border-radius:8px;
                    border:1px solid #ccc;
                    margin-bottom:12px;
                "
            >
            </asp:TextBox>


            <label style="
                display:block;
                margin-bottom:5px;
                font-weight:bold;
            ">
                New Password:
            </label>


            <asp:TextBox
                ID="txtNewPassword"
                runat="server"
                TextMode="Password"
                Width="100%"
                style="
                    box-sizing:border-box;
                    padding:10px;
                    border-radius:8px;
                    border:1px solid #ccc;
                    margin-bottom:12px;
                "
            >
            </asp:TextBox>


            <label style="
                display:block;
                margin-bottom:5px;
                font-weight:bold;
            ">
                Confirm New Password:
            </label>


            <asp:TextBox
                ID="txtConfirmPassword"
                runat="server"
                TextMode="Password"
                Width="100%"
                style="
                    box-sizing:border-box;
                    padding:10px;
                    border-radius:8px;
                    border:1px solid #ccc;
                "
            >
            </asp:TextBox>


            <asp:Button
                ID="btnChangePassword"
                runat="server"
                Text="Update Password"
                OnClick="btnChangePassword_Click"
                style="
                    width:100%;
                    margin-top:12px;
                    padding:10px;
                    border:none;
                    border-radius:8px;
                    background-color:#d46a92;
                    color:white;
                    font-size:14px;
                    cursor:pointer;
                "
            />

        </div>


        <asp:Label
            ID="lblPassError"
            runat="server"
            ForeColor="Red"
            style="
                font-size:13px;
                display:block;
                margin-top:8px;
            "
        />

        <!-- DELETE ACCOUNT -->

        <div style="
            margin-top:25px;
            padding-top:18px;
            border-top:1px solid #f3c6d3;
            text-align:center;
        ">

            <asp:LinkButton
                ID="btnDeleteAccount"
                runat="server"
                Text="Delete Your Account"
                OnClientClick="showDeletePopup(); return false;"
                style="
                    background:none;
                    border:none;
                    padding:0;
                    color:#d9534f;
                    font-size:16px;
                    font-weight:bold;
                    text-decoration:none;
                    cursor:pointer;
                "
            />

        </div>

        <!-- SAVE CHANGES -->

        <asp:Button
            ID="btnSave"
            runat="server"
            Text="Save Changes"
            OnClick="btnSave_Click"
            style="
                margin-top:15px;
                padding:10px;
                width:100%;
                border:none;
                border-radius:8px;
                background-color:#d46a92;
                color:white;
                font-size:16px;
                cursor:pointer;
            "
        />


        <!-- CANCEL CHANGES -->

        <asp:Button
            ID="btnCancel"
            runat="server"
            Text="Cancel Changes"
            OnClick="btnCancel_Click"
            CausesValidation="false"
            style="
                margin-top:10px;
                padding:10px;
                width:100%;
                border:1px solid #d46a92;
                border-radius:8px;
                background-color:white;
                color:#d46a92;
                font-size:16px;
                cursor:pointer;
            "
        />


        <asp:Label
            ID="lblMessage"
            runat="server"
            style="
                font-size:14px;
                display:block;
                margin-top:10px;
                text-align:center;
            "
        />

    </div>


    <!-- DELETE ACCOUNT POPUP -->

    <div
        id="deletePopup"
        style="
            display:none;
            position:fixed;
            top:0;
            left:0;
            width:100%;
            height:100%;
            background-color:rgba(0,0,0,0.5);
            justify-content:center;
            align-items:center;
            z-index:1000;
        ">


        <div style="
            width:420px;
            background-color:white;
            border-radius:15px;
            padding:30px;
            box-shadow:0 10px 30px rgba(0,0,0,0.3);
            font-family:Arial, sans-serif;
        ">


            <!-- POPUP TITLE -->

            <h2 style="
                margin-top:0;
                margin-bottom:8px;
                color:#333;
                text-align:center;
            ">
                Delete Account
            </h2>


            <!-- POPUP SUBTITLE -->

            <p style="
                text-align:center;
                color:#555;
                font-size:16px;
                margin-bottom:20px;
            ">
                Are you sure you want to delete your account?
            </p>


            <!-- RED WARNING BOX -->

            <div style="
                background-color:#ffe5e5;
                border:1px solid #ff4d4d;
                border-radius:8px;
                padding:15px;
                margin-bottom:20px;
                color:#8b0000;
            ">


                <strong>
                    This action cannot be undone.
                </strong>


                <p style="
                    margin-bottom:0;
                    line-height:1.5;
                ">
                    Deleting your account will result in the following:
                    <br />

                    • Your account will no longer be accessible.
                    <br />

                    • Your account data will be permanently deleted.
                </p>


            </div>


            <!-- POPUP BUTTONS -->

            <div style="
                display:flex;
                gap:10px;
                justify-content:center;
            ">


                <!-- CANCEL DELETE -->

                <asp:Button
                    ID="btnCancelDelete"
                    runat="server"
                    Text="Cancel"
                    UseSubmitBehavior="false"
                    OnClientClick="closeDeletePopup(); return false;"
                    style="
                        flex:1;
                        padding:11px;
                        border:1px solid #ccc;
                        border-radius:8px;
                        background-color:white;
                        color:#555;
                        font-size:15px;
                        cursor:pointer;
                    "
                />


                <!-- PROCEED WITH DELETION -->

                <asp:Button
                    ID="btnProceedDelete"
                    runat="server"
                    Text="Proceed with Deletion"
                    OnClick="btnProceedDelete_Click"
                    style="
                        flex:1;
                        padding:11px;
                        border:none;
                        border-radius:8px;
                        background-color:#d9534f;
                        color:white;
                        font-size:15px;
                        cursor:pointer;
                    "
                />

            </div>


        </div>

    </div>


</form>

</body>
</html>