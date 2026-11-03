<%@ Page Language="C#" AutoEventWireup="true"
    CodeBehind="AccountSettings.aspx.cs"
    Inherits="SeniorProject.AccountSettings" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link rel="stylesheet" href="StyleSheet.css?v=5" />
    <title>Account Settings</title>

    <style>
        * {
            box-sizing: border-box;
        }

        body {
            margin: 0;
            background: #fff9fb;
            color: #34242f;
            font-family: Arial, sans-serif;
        }

        .settings-layout {
            max-width: 1160px;
            margin: 55px auto;
            padding: 0 22px;
            display: grid;
            grid-template-columns: 245px minmax(0, 1fr);
            gap: 28px;
            align-items: start;
        }

        .settings-sidebar {
            background: white;
            border: 1px solid #f3d5df;
            border-radius: 20px;
            padding: 24px 15px;
            box-shadow: 0 8px 30px rgba(102,43,76,.05);
        }

        .settings-title {
            font-size: 23px;
            margin: 0 10px 6px;
            color: #34242f;
        }

        .sidebar-subtitle {
            font-size: 13px;
            color: #907d89;
            margin: 0 10px 25px;
            line-height: 1.5;
        }

        .sidebar-link {
            display: flex;
            align-items: center;
            gap: 12px;
            width: 100%;
            text-align: left;
            padding: 14px 15px;
            margin: 5px 0;
            border: none;
            border-radius: 12px;
            background: transparent;
            color: #776975;
            font-size: 15px;
            font-weight: 600;
            cursor: pointer;
        }

        .sidebar-link:hover {
            background: #fff0f5;
            color: #bd4d79;
        }

        .sidebar-link.active {
            background: #fbe3ec;
            color: #bd4d79;
        }

        .settings-back-link {
            margin-top: 22px;
            text-decoration: none;
            box-sizing: border-box;
        }

        .sidebar-icon {
            font-size: 19px;
        }

        .settings-content {
            min-width: 0;
        }

        .page-heading {
            margin: 3px 0 24px;
        }

        .page-heading h1 {
            font-size: 29px;
            margin: 0 0 9px;
        }

        .page-heading p {
            margin: 0;
            color: #887783;
            font-size: 14px;
            line-height: 1.6;
        }

        .settings-card {
            background: white;
            border: 1px solid #f2d5df;
            border-radius: 20px;
            padding: 29px;
            margin-bottom: 20px;
            box-shadow: 0 8px 28px rgba(102,43,76,.045);
        }

        .card-heading {
            display: flex;
            gap: 13px;
            align-items: center;
            margin-bottom: 23px;
        }

        .card-icon {
            width: 42px;
            height: 42px;
            border-radius: 13px;
            background: #fce8ef;
            color: #bd4d79;
            display: grid;
            place-items: center;
            font-size: 21px;
            flex-shrink: 0;
        }

        .card-heading h2 {
            font-size: 18px;
            margin: 0 0 5px;
        }

        .card-heading p {
            color: #92818d;
            font-size: 13px;
            margin: 0;
            line-height: 1.5;
        }

        .avatar-row {
            display: flex;
            align-items: center;
            gap: 22px;
            padding: 4px 0 24px;
        }

        .profile-avatar {
            width: 94px;
            height: 94px;
            border-radius: 50%;
            object-fit: cover;
            border: 4px solid #fce3eb;
            background: #fbeaf0;
        }

        .avatar-copy h3 {
            margin: 0 0 7px;
            font-size: 16px;
        }

        .avatar-copy p {
            margin: 0 0 13px;
            color: #93818d;
            font-size: 13px;
            line-height: 1.5;
        }

        .field-grid {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 20px;
        }

        .field {
            margin-bottom: 20px;
            min-width: 0;
        }

        .field label {
            display: block;
            font-size: 13px;
            font-weight: 700;
            margin-bottom: 9px;
            color: #55434e;
        }

        .field input[type=text],
        .field input[type=password],
        .field textarea,
        .field select,
        .read-only {
            display: block;
            width: 100%;
            border: 1px solid #e7d6de;
            border-radius: 11px;
            background: white;
            padding: 13px 14px;
            font: 14px Arial, sans-serif;
            color: #34242f;
            outline: none;
            min-height: 45px;
        }

        .field textarea {
            resize: vertical;
            line-height: 1.6;
        }

        .field input:focus,
        .field textarea:focus,
        .field select:focus {
            border-color: #d46a92;
            box-shadow: 0 0 0 3px #fce7ef;
        }

        .read-only {
            background: #faf6f8;
            color: #82717b;
            overflow-wrap: anywhere;
        }

        .helper {
            font-size: 12px;
            color: #9a8792;
            margin: 8px 0 0;
            line-height: 1.5;
        }

        .soft-button,
        .primary-button,
        .outline-button,
        .danger-button {
            border-radius: 10px;
            padding: 12px 18px;
            font-size: 14px;
            font-weight: 700;
            cursor: pointer;
        }

        .soft-button {
            border: 1px solid #f1c9d7;
            background: #fff0f5;
            color: #b84e78;
        }

        .soft-button:hover {
            background: #fbe0e9;
        }

        .primary-button {
            border: 1px solid #d46a92;
            background: #d46a92;
            color: white;
        }

        .primary-button:hover {
            background: #bf527e;
        }

        .outline-button {
            border: 1px solid #e7b5c8;
            background: white;
            color: #b84e78;
        }

        .danger-button {
            background: #fff1f1;
            border: 1px solid #f4caca;
            color: #bd414a;
        }

        .expand-panel {
            background: #fff8fa;
            border: 1px solid #f3d4df;
            border-radius: 13px;
            padding: 21px;
            margin-top: 18px;
        }

        .password-display {
            display: flex;
            align-items: center;
            gap: 12px;
            flex-wrap: wrap;
        }

        .password-dots {
            flex: 1;
            min-width: 120px;
            background: #faf6f8;
            border: 1px solid #e7d6de;
            border-radius: 11px;
            padding: 12px 14px;
            letter-spacing: 3px;
        }

        .actions {
            display: flex;
            gap: 12px;
            justify-content: flex-end;
            margin-bottom: 22px;
        }

        .danger-row {
            display: flex;
            align-items: center;
            justify-content: space-between;
            gap: 20px;
        }

        .danger-row h3 {
            margin: 0 0 7px;
            color: #a53d48;
        }

        .danger-row p {
            margin: 0;
            color: #93818d;
            font-size: 13px;
        }

        .error-message {
            display: block;
            color: #bf3345;
            font-size: 13px;
            margin-top: 8px;
        }

        .status-message {
            display: block;
            text-align: right;
            margin: 10px 0 22px;
            font-size: 14px;
        }

        /* ACADEMIC BADGES */

        .badge-preview {
            display: flex;
            gap: 10px;
            flex-wrap: wrap;
            margin: 15px 0;
        }

        .profile-badge {
            display: inline-flex;
            align-items: center;
            padding: 9px 13px;
            border-radius: 30px;
            background: #fce7ef;
            color: #a94470;
            font-size: 13px;
            font-weight: 700;
        }

        .profile-badge.year {
            background: #f2e7f6;
            color: #87518e;
        }

        .academic-note {
            color: #93818d;
            font-size: 13px;
            line-height: 1.6;
        }

        /* DELETE POPUP */

        .popup-overlay {
            display: none;
            position: fixed;
            inset: 0;
            background: rgba(39,21,33,.58);
            align-items: center;
            justify-content: center;
            z-index: 1000;
            padding: 18px;
        }

        .popup-card {
            width: 100%;
            max-width: 450px;
            background: white;
            border-radius: 20px;
            padding: 30px;
            box-shadow: 0 18px 60px rgba(0,0,0,.18);
        }

        .popup-card h2 {
            text-align: center;
        }

        .popup-card > p {
            text-align: center;
            color: #776975;
        }

        .warning-box {
            background: #fff2f2;
            border: 1px solid #f2c4c8;
            border-radius: 12px;
            padding: 16px;
            color: #a53d48;
            font-size: 14px;
            line-height: 1.6;
            margin: 20px 0;
        }

        .popup-actions {
            display: flex;
            gap: 10px;
        }

        .popup-actions input {
            flex: 1;
            min-width: 0;
        }

        @media (max-width: 760px) {
            .settings-layout {
                display: block;
                margin: 25px auto;
                padding: 0 14px;
            }

            .settings-sidebar {
                margin-bottom: 22px;
            }

            .settings-card {
                padding: 20px;
            }

            .field-grid {
                grid-template-columns: 1fr;
                gap: 0;
            }

            .actions,
            .danger-row,
            .popup-actions {
                flex-direction: column;
            }

            .actions input {
                width: 100%;
            }
        }
        .profile-banner-preview{display:block;width:100%;height:175px;object-fit:cover;border-radius:14px;margin:0 0 20px;background:#f5dbe7}
    </style>

    <script>
        function toggleSection(id) {
            var section = document.getElementById(id);

            section.style.display =
                getComputedStyle(section).display === "none"
                    ? "block"
                    : "none";
        }

        function showPasswordSection() {
            toggleSection("passwordSection");
        }

        function showPictureSection() {
            toggleSection("pictureSection");
        }

        function showTab(tabId, button) {
            document.getElementById("accountTab").style.display =
                tabId === "accountTab" ? "block" : "none";

            document.getElementById("profileTab").style.display =
                tabId === "profileTab" ? "block" : "none";

            var buttons =
                document.querySelectorAll(".sidebar-link");

            buttons.forEach(function (item) {
                item.classList.remove("active");
            });

            button.classList.add("active");

            document.getElementById("activeTab").value = tabId;
        }

        function restoreTab() {
            var tab = document.getElementById("activeTab").value;

            if (tab === "profileTab") {
                showTab(
                    "profileTab",
                    document.getElementById("profileNav")
                );
            }
        }

        function updateBadges() {
            var major =
                document.getElementById(
                    '<%= ddlMajor.ClientID %>'
                ).value;

            var year =
                document.getElementById(
                    '<%= ddlYear.ClientID %>'
                ).value;

            document.getElementById("majorPreview").textContent =
                major || "Major not selected";

            document.getElementById("yearPreview").textContent =
                year || "Year not selected";
        }

        function clearNameError() {
            var label =
                document.getElementById(
                    '<%= lblNameError.ClientID %>'
                );

            if (label) {
                label.innerText = "";
            }
        }

        function clearPasswordErrors() {
            var label =
                document.getElementById(
                    '<%= lblPassError.ClientID %>'
                );

            if (label) {
                label.innerText = "";
            }
        }

        function showDeletePopup() {
            document.getElementById("deletePopup").style.display =
                "flex";
        }

        function closeDeletePopup() {
            document.getElementById("deletePopup").style.display =
                "none";
        }

        window.addEventListener("DOMContentLoaded", function () {
            restoreTab();
            updateBadges();
        });
    </script>
</head>

<body>
<form id="form1" runat="server">

    <input type="hidden"
        id="activeTab"
        name="activeTab"
        value="<%= Request.Form["activeTab"] == "profileTab" ? "profileTab" : "accountTab" %>" />

    <div class="settings-layout">

        <!-- SIDEBAR -->

        <aside class="settings-sidebar">

            <h2 class="settings-title">Settings</h2>

            <p class="sidebar-subtitle">
                Manage your account and profile.
            </p>

            <nav>
                <button type="button"
                    id="accountNav"
                    class="sidebar-link active"
                    onclick="showTab('accountTab', this)">
                       Account
                </button>

                <button type="button"
                    id="profileNav"
                    class="sidebar-link"
                    onclick="showTab('profileTab', this)">
                      Profile
                </button>
            </nav>

            <a href="HomePage.aspx" class="sidebar-link settings-back-link">
                Back
            </a>

        </aside>

        <main class="settings-content">

            <!-- ACCOUNT TAB -->

            <div id="accountTab">

                <div class="page-heading">
                    <h1>Account Settings</h1>
                    <p>
                        Update your personal information
                        and keep your account secure.
                    </p>
                </div>

                <!-- PERSONAL INFORMATION -->

                <section class="settings-card">

                    <div class="card-heading">
                        <span class="card-icon">✎</span>

                        <div>
                            <h2>Personal Information</h2>
                            <p>Edit your account details.</p>
                        </div>
                    </div>

                    <div class="field-grid">

                        <div class="field">
                            <label>First Name</label>

                            <asp:TextBox
                                ID="txtFirstName"
                                runat="server" />
                        </div>

                        <div class="field">
                            <label>Last Name</label>

                            <asp:TextBox
                                ID="txtLastName"
                                runat="server" />
                        </div>

                    </div>

                    <div class="field">
                        <label>Username</label>

                        <asp:TextBox
                            ID="txtUsername"
                            runat="server"
                            onkeyup="clearNameError()" />

                        <asp:Label
                            ID="lblNameError"
                            runat="server"
                            CssClass="error-message" />
                    </div>

                    <div class="field">
                        <label>Email Address</label>

                        <asp:Label
                            ID="lblEmail"
                            runat="server"
                            CssClass="read-only" />

                        <p class="helper">
                            Your email address cannot be
                            changed here.
                        </p>
                    </div>

                </section>

                <!-- PASSWORD -->

                <section class="settings-card">

                    <div class="card-heading">
                        <span class="card-icon">♢</span>

                        <div>
                            <h2>Password &amp; Security</h2>
                            <p>Keep your account protected.</p>
                        </div>
                    </div>

                    <div class="field">
                        <label>Password</label>

                        <div class="password-display">

                            <span class="password-dots">
                                ••••••••••
                            </span>

                            <asp:Button
                                ID="btnShowPassword"
                                runat="server"
                                Text="Change Password"
                                CssClass="soft-button"
                                UseSubmitBehavior="false"
                                OnClientClick="showPasswordSection(); return false;" />

                        </div>
                    </div>

                    <div id="passwordSection"
                        class="expand-panel"
                        style='display:<%= ShowPasswordSection ? "block" : "none" %>'>

                        <div class="field">
                            <label>Current Password</label>

                            <asp:TextBox
                                ID="txtCurrentPassword"
                                runat="server"
                                TextMode="Password"
                                onkeyup="clearPasswordErrors()" />
                        </div>

                        <div class="field">
                            <label>New Password</label>

                            <asp:TextBox
                                ID="txtNewPassword"
                                runat="server"
                                TextMode="Password"
                                onkeyup="clearPasswordErrors()" />
                        </div>

                        <div class="field">
                            <label>Confirm New Password</label>

                            <asp:TextBox
                                ID="txtConfirmPassword"
                                runat="server"
                                TextMode="Password"
                                onkeyup="clearPasswordErrors()" />

                            <asp:Label
                                ID="lblPassError"
                                runat="server"
                                CssClass="error-message" />
                        </div>

                        <p class="helper">
                            Click Save Account to update your password.
                        </p>

                    </div>

                </section>

                <!-- ACCOUNT BUTTONS -->

                <div class="actions">

                    <asp:Button
                        ID="btnSave"
                        runat="server"
                        Text="Save Account"
                        CssClass="primary-button"
                        OnClick="btnSave_Click" />

                </div>

                <asp:Label
                    ID="lblMessage"
                    runat="server"
                    CssClass="status-message" />

                <!-- DELETE ACCOUNT -->

                <section class="settings-card">

                    <div class="danger-row">

                        <div>
                            <h3>Delete Account</h3>

                            <p>
                                Permanently remove your account
                                and its data.
                            </p>
                        </div>

                        <asp:LinkButton
                            ID="btnDeleteAccount"
                            runat="server"
                            Text="Delete Account"
                            CssClass="danger-button"
                            OnClientClick="showDeletePopup(); return false;" />

                    </div>

                </section>

            </div>

            <!-- PROFILE TAB -->

            <div id="profileTab" style="display:none;">

                <div class="page-heading">
                    <h1>Profile Settings</h1>

                    <p>
                        Customize the information on your
                        student social profile.
                    </p>
                </div>


                <asp:Label ID="lblProfileMessage" runat="server" CssClass="status-message" />
                <!-- PROFILE PICTURE -->

                <section class="settings-card">

                    <div class="card-heading">
                        <span class="card-icon">♡</span>
                        <div>
                            <h2>Profile Picture</h2>
                            <p>Choose how your profile appears.</p>
                        </div>
                    </div>

                    <div class="avatar-row">

                        <asp:Image
                            ID="imgProfile"
                            runat="server"
                            CssClass="profile-avatar"
                            ImageUrl="~/Images/default-avatar.png" />

                        <div class="avatar-copy">
                            <h3>Your photo</h3>

                            <p>
                                Upload a picture to personalize
                                your account.
                            </p>

                            <asp:Button
                                ID="btnShowPicture"
                                runat="server"
                                Text="Change Picture"
                                CssClass="soft-button"
                                UseSubmitBehavior="false"
                                OnClientClick="showPictureSection(); return false;" />
                        </div>

                    </div>

                    <div id="pictureSection"
                        class="expand-panel"
                        style="display:none;">

                        <div class="field">
                            <label>Choose a new picture</label>

                            <asp:FileUpload
                                ID="fileProfilePic"
                                runat="server" />
                        </div>

                        <asp:Button
                            ID="btnUploadPic"
                            runat="server"
                            Text="Upload Picture"
                            CssClass="primary-button"
                            OnClick="btnUploadPic_Click" />

                    </div>

                </section>


                <!-- PROFILE BANNER -->
                <section class="settings-card">
                    <div class="card-heading"><span class="card-icon">▧</span>
                        <div><h2>Profile Banner</h2><p>This banner appears at the top of your profile in Channels.</p></div>
                    </div>
                    <asp:Image ID="imgBanner" runat="server" CssClass="profile-banner-preview" Visible="false" />
                    <div class="field"><label>Choose a banner image</label>
                        <asp:FileUpload ID="fileBanner" runat="server" />
                        <p class="helper">JPG, PNG, GIF or WebP. Maximum 5 MB.</p>
                    </div>
                    <asp:Button ID="btnUploadBanner" runat="server" Text="Upload Banner"
                        CssClass="primary-button" OnClick="btnUploadBanner_Click" />
                </section>

                <!-- ACADEMIC INFORMATION -->

                <section class="settings-card">

                    <div class="card-heading">
                        <span class="card-icon">🎓</span>

                        <div>
                            <h2>Academic Information</h2>

                            <p>
                                Add your major and academic year.
                            </p>
                        </div>
                    </div>

                    <p class="academic-note">
                        Choose your academic information below.
                        Your selections will appear as badges
                        in the preview.
                    </p>

                    <div class="field-grid">

                        <!-- MAJOR DROPDOWN -->

                        <div class="field">

                            <label>Major / Program</label>

                            <asp:DropDownList
                                ID="ddlMajor"
                                runat="server"
                                onchange="updateBadges()">

                                <asp:ListItem
                                    Text="Select your major"
                                    Value="" />

                                <asp:ListItem
                                    Text="Information Systems"
                                    Value="Information Systems" />

                                <asp:ListItem
                                    Text="Computer Science"
                                    Value="Computer Science" />

                                <asp:ListItem
                                    Text="Cybersecurity"
                                    Value="Cybersecurity" />

                                <asp:ListItem
                                    Text="Business Administration"
                                    Value="Business Administration" />

                                <asp:ListItem
                                    Text="Accounting"
                                    Value="Accounting" />

                                <asp:ListItem
                                    Text="Engineering"
                                    Value="Engineering" />

                                <asp:ListItem
                                    Text="Psychology"
                                    Value="Psychology" />

                                <asp:ListItem
                                    Text="Other"
                                    Value="Other" />

                            </asp:DropDownList>

                        </div>

                        <!-- YEAR DROPDOWN -->

                        <div class="field">

                            <label>Academic Year</label>

                            <asp:DropDownList
                                ID="ddlYear"
                                runat="server"
                                onchange="updateBadges()">

                                <asp:ListItem
                                    Text="Select your year"
                                    Value="" />

                                <asp:ListItem
                                    Text="Freshman"
                                    Value="Freshman" />

                                <asp:ListItem
                                    Text="Sophomore"
                                    Value="Sophomore" />

                                <asp:ListItem
                                    Text="Junior"
                                    Value="Junior" />

                                <asp:ListItem
                                    Text="Senior"
                                    Value="Senior" />

                                <asp:ListItem
                                    Text="Graduate Student"
                                    Value="Graduate Student" />

                            </asp:DropDownList>

                        </div>

                    </div>

                    <!-- BADGE PREVIEW -->

                    <h3 style="font-size:15px; margin-top:10px;">
                        Badge Preview
                    </h3>

                    <div class="badge-preview">

                        <span id="majorPreview"
                            class="profile-badge">
                            Major not selected
                        </span>

                        <span id="yearPreview"
                            class="profile-badge year">
                            Year not selected
                        </span>

                    </div>

                    <p class="helper">
                        This preview updates when you
                        change your selections.
                    </p>

                </section>

                <!-- BIO AND STATUS -->

                <section class="settings-card">

                    <div class="card-heading">

                        <span class="card-icon">✎</span>

                        <div>
                            <h2>About You</h2>

                            <p>
                                Tell other students a little
                                about yourself.
                            </p>
                        </div>

                    </div>

                    <div class="field">

                        <label>Bio</label>

                        <asp:TextBox
                            ID="txtBio"
                            runat="server"
                            TextMode="MultiLine"
                            Rows="6" />

                        <p class="helper">
                            Write a short introduction
                            for your profile.
                        </p>

                    </div>

                    <div class="field">

                        <label>Status</label>

                        <asp:TextBox
                            ID="txtStatus"
                            runat="server" />

                        <p class="helper">
                            Share a quick update.
                        </p>

                    </div>

                    <asp:Button
                        ID="btnSaveProfile"
                        runat="server"
                        Text="Save Profile"
                        CssClass="primary-button"
                        OnClick="btnSaveProfile_Click" />

                </section>

            </div>

        </main>

    </div>

    <!-- DELETE CONFIRMATION POPUP -->

    <div id="deletePopup"
        class="popup-overlay">

        <div class="popup-card">

            <h2>Delete Account</h2>

            <p>
                Are you sure you want to delete your account?
            </p>

            <div class="warning-box">

                <strong>
                    This action cannot be undone.
                </strong>

                <p>
                    Deleting your account will permanently
                    remove your account data.
                </p>

            </div>

            <div class="popup-actions">

                <asp:Button
                    ID="btnCancelDelete"
                    runat="server"
                    Text="Cancel"
                    CssClass="outline-button"
                    UseSubmitBehavior="false"
                    OnClientClick="closeDeletePopup(); return false;" />

                <asp:Button
                    ID="btnProceedDelete"
                    runat="server"
                    Text="Proceed with Deletion"
                    CssClass="danger-button"
                    OnClick="btnProceedDelete_Click" />

            </div>

        </div>

    </div>

</form>
</body>
</html>
