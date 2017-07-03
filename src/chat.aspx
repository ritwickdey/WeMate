<%@ Page Language="C#" AutoEventWireup="true"  CodeFile="chat.aspx.cs" Inherits="chat" MasterPageFile="~/MasterPage.master" MaintainScrollPositionOnPostback="true" ValidateRequest="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .OnlineCSS {
            position: relative;
            border: 0px solid #079404;
            height: 7px;
            width: 7px;
            border-radius: 50%;
            background-color: #079404;
            float: right;
            margin-top: 3%;
        }

        .OfflineCSS {
            position: relative;
            border: 0px solid #878080;
            height: 7px;
            width: 7px;
            border-radius: 50%;
            background-color: #c2bbbb;
            float: right;
            margin-top: 3%;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MenuContentHolder" runat="Server">
    <script>
        function playSound() {
            document.getElementById("audioId").play();
        }
    </script>
    <audio id="audioId" src="Sound/tone.wav" style="display: none" controls="controls" preload="auto"></audio>
    <asp:UpdatePanel ID="UpdatePanel2" runat="server">
        <ContentTemplate>
            <asp:Timer ID="Timer1" runat="server" Interval="3000" OnTick="Timer1_Tick">
            </asp:Timer>
            <asp:Panel ID="Panel2" runat="server">
                <div>
                    <h5 class="alert alert-success" style="text-align: center">
                        <span>Hello <%=Server.HtmlEncode(CurrentSender.Text).ToUpper()%> !!</span>
                        <asp:Button ID="Logout" runat="server" Text="logout" OnClick="logout_Click" CssClass="btn btn-warning" Height="30px" />
                    </h5>
                </div>
            </asp:Panel>
            <asp:Panel ID="Panel1" runat="server">
                <div style="max-height: 520px; padding: 5px" class="col-lg-12 pre-scrollable">
                    <asp:Label ID="CurrentSender" runat="server" Text="" Visible="false"></asp:Label>
                    <asp:Label ID="CurrentRecevier" runat="server" Text="" Visible="false"></asp:Label>

                    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString='<%$ ConnectionStrings:RegistrationConnectionString %>' SelectCommand="SELECT [MsgSender] FROM [MsgTable] WHERE (([RecevierSeen] = 0) AND ([MsgReceiver] = @MsgReceiver))">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="CurrentSender" PropertyName="Text" Name="MsgReceiver" Type="String"></asp:ControlParameter>
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <div class="panel panel-danger">
                        <div class="panel-heading">
                            <span>Unread Messages </span>
                            <span>
                                <asp:Label ID="UnreadMsgCountLabel" runat="server" CssClass="badge"></asp:Label>
                            </span>
                        </div>
                        <div class="list-group">
                            <asp:DataList ID="DataList4" runat="server" DataSourceID="SqlDataSource3" Width="100%">
                                <ItemTemplate>
                                    <asp:LinkButton Text='<%# Eval("MsgSender") %>' runat="server" ID="MsgSenderLabel" OnClick="UsernameLabel_Click" CssClass="list-group-item" />
                                </ItemTemplate>
                            </asp:DataList>
                        </div>
                    </div>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString='<%$ ConnectionStrings:RegistrationConnectionString %>' SelectCommand="SELECT [Username] FROM [UserDatabase] WHERE ([Username] <> @Username) AND OnlineStatus = 1">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="CurrentSender" PropertyName="Text" Name="Username" Type="String"></asp:ControlParameter>
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <div class="panel panel-success">
                        <div class="panel-heading">Online Users</div>
                        <asp:DataList ID="DataList1" runat="server" DataSourceID="SqlDataSource1" Width="100%">
                            <ItemTemplate>
                                <div class="list-group-item">
                                    <asp:LinkButton Text='<%# Eval("Username") %>' runat="server" ID="UsernameLabel" OnClick="UsernameLabel_Click" CssClass=" " />
                                    <div class="OnlineCSS" />
                                </div>
                            </ItemTemplate>
                        </asp:DataList>
                    </div>

                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString='<%$ ConnectionStrings:RegistrationConnectionString %>' SelectCommand="SELECT [Username] FROM [UserDatabase] WHERE ([Username] <> @Username) AND (OnlineStatus = 0  or OnlineStatus is null)">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="CurrentSender" PropertyName="Text" Name="Username" Type="String"></asp:ControlParameter>
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <div class="panel panel-info">
                        <div class="panel-heading">Offline Users</div>
                        <asp:DataList ID="DataList3" runat="server" DataSourceID="SqlDataSource2" Width="100%">
                            <ItemTemplate>
                                <div class="list-group-item">
                                    <asp:LinkButton Text='<%# Eval("Username") %>' runat="server" ID="UsernameLabel" OnClick="UsernameLabel_Click" />
                                    <div class="OfflineCSS"></div>
                                </div>
                            </ItemTemplate>
                        </asp:DataList>
                    </div>
                </div>
            </asp:Panel>
        </ContentTemplate>
        <Triggers>
            <asp:AsyncPostBackTrigger EventName="Tick" ControlID="Timer1" />
        </Triggers>
    </asp:UpdatePanel>
</asp:Content>


<asp:Content ID="Content3" ContentPlaceHolderID="MainContentHolder" runat="Server">
    <style>
        .SenderClass {
            left: 55%;
            background: #0b59ce;
            color: #ffffff;
            border: 1px solid #0b59ce;
        }

        .ReceiverClass {
            left: -55%;
            background: #c46909;
            color: #ffffff;
            border: 1px solid #c46909;
        }

        .MainChatListClass {
            padding: 5px;
            width: 250px;
            position: relative;
            border-radius: 5px;
            word-wrap: break-word;
            margin-top: 5px;
        }

        .SenderClass::after {
            content: ' ';
            position: absolute;
            width: 0;
            height: 0;
            left: 243px;
            top: 0px;
            border: 10px solid;
            border-color: transparent transparent #0b59ce #0b59ce;
        }

        .ReceiverClass::after {
            content: ' ';
            position: absolute;
            width: 0;
            height: 0;
            right: 243px;
            top: 3px;
            border: 10px solid;
            border-color: #c46909 #c46909 transparent transparent;
        }
    </style>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div>
                <h4 style="text-align: center" class="alert alert-info"><%= GetWelcomeBanner(CurrentRecevier.Text)%></h4>
                <span style="float: right"></span>
            </div>
            <asp:Panel runat="server" ID="chatPanel">
                <div style="vertical-align: middle; min-height: 480px;" class="pre-scrollable">
                    <div>
                        <asp:DataList ID="DataList2" runat="server" Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False" Font-Underline="False" HorizontalAlign="Center" RepeatLayout="Table">
                            <ItemTemplate>
                                <div class="<%# GetStyleForMsgList(Eval("MsgSender").ToString()) %>  MainChatListClass">
                                    <asp:Label ID="Label1" runat="server" Text='<%# GetPerfactName(Eval("MsgSender").ToString()) %>'></asp:Label>
                                    <asp:Label ID="Label2" runat="server" Text='<%# Eval("ChatMsg") %>'></asp:Label>
                                </div>
                            </ItemTemplate>
                        </asp:DataList>
                    </div>
                </div>
            </asp:Panel>

        </ContentTemplate>
    </asp:UpdatePanel>
    <div style="padding: 5px 15px 5px 5px">
        <asp:Panel ID="MsgPanel" runat="server" DefaultButton="sendBTN">
            <asp:UpdatePanel runat="server" UpdateMode="Conditional">
                <ContentTemplate>
                    <script>
                        function loadingIconVisible() {
                            document.getElementById('<%=LoadingImage.ClientID%>').style.opacity = 1;
                        }
                    </script>
                    <div>
                        <table style="width: 120%">
                            <tr>
                                <td>
                                    <asp:TextBox ID="MSGTextBox" runat="server" placeholder="Enter message" CssClass="form-control" Width="100%"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:Button ID="sendBTN" runat="server" Text="Send" OnClick="sendBTN_Click" CssClass="btn btn-default" Width="30%" OnClientClick="loadingIconVisible()" />
                                </td>
                            </tr>
                        </table>
                        <asp:Image ID="LoadingImage" runat="server" ImageUrl="~/icon/loadingIcon.gif" ImageAlign="Right" />
                    </div>

                </ContentTemplate>
            </asp:UpdatePanel>
        </asp:Panel>
    </div>
</asp:Content>