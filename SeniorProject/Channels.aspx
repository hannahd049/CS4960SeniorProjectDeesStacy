<%@ Page Language="C#" AutoEventWireup="true"
    CodeBehind="Channels.aspx.cs"
    Inherits="SeniorProject.Channels" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">
    <title>Channels</title>

    <link rel="stylesheet"
          href="StyleSheet.css?v=10" />
</head>

<body>

<form id="form1" runat="server">

<div class="channels-layout">

    <div class="channels-sidebar">

        <div class="sidebar-title">
            CHANNELS
        </div>

        <asp:Repeater ID="rptChannels"
            runat="server">

            <ItemTemplate>

                <div class="channel-item">

                    # <%# Eval("ChannelName") %>

                </div>

            </ItemTemplate>

        </asp:Repeater>

    </div>

    <div class="chat-section">

        <div class="chat-header">

    Community Chat

    <div class="current-user">

        Logged in as:
        <strong><%= Session["Username"] %></strong>

    </div>

</div>

        <div id="messages">

            <asp:Repeater ID="rptMessages"
                runat="server">

                <ItemTemplate>

                    <div class="message-card">

                        <div class="message-user">

                            <%# Eval("Username") %>

                        </div>

                        <div class="message-text">

                            <%# Eval("MessageText") %>

                        </div>

                    </div>

                </ItemTemplate>

            </asp:Repeater>

        </div>

        <div class="chat-input">

    <asp:TextBox
        ID="txtMessage"
        runat="server"
        CssClass="message-box"
        placeholder="Type a message...">
    </asp:TextBox>

    <asp:Button
        ID="btnSend"
        runat="server"
        Text="Send"
        CssClass="send-button"
        OnClick="btnSend_Click" />

</div>

    </div>

    <div class="members-sidebar">

        <div class="sidebar-title">
            ONLINE NOW
        </div>

        <asp:Repeater ID="rptUsers"
            runat="server">

            <ItemTemplate>

                <div class="online-user">

                    ● <%# Eval("Username") %>

                </div>

            </ItemTemplate>

        </asp:Repeater>

    </div>

</div>

</form>

</body>

</html>