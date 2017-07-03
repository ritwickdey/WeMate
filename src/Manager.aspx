<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Manager.aspx.cs" Inherits="Manager" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Managment Tool</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:SqlDataSource ID="SqlDataSourceRegistration" runat="server" ConnectionString="<%$ ConnectionStrings:RegistrationConnectionString %>" SelectCommand="SELECT * FROM [UserDatabase]" DeleteCommand="DELETE FROM [UserDatabase] WHERE [Username] = @Username" InsertCommand="INSERT INTO [UserDatabase] ([Username], [Email], [Password], [Country], [OnlineStatus]) VALUES (@Username, @Email, @Password, @Country, @OnlineStatus)" UpdateCommand="UPDATE [UserDatabase] SET [Email] = @Email, [Password] = @Password, [Country] = @Country, [OnlineStatus] = @OnlineStatus WHERE [Username] = @Username">
            <DeleteParameters>
                <asp:Parameter Name="Username" Type="String"></asp:Parameter>
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="Username" Type="String"></asp:Parameter>
                <asp:Parameter Name="Email" Type="String"></asp:Parameter>
                <asp:Parameter Name="Password" Type="String"></asp:Parameter>
                <asp:Parameter Name="Country" Type="String"></asp:Parameter>
                <asp:Parameter Name="OnlineStatus" Type="Int32"></asp:Parameter>
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="Id" Type="Int32"></asp:Parameter>
                <asp:Parameter Name="Email" Type="String"></asp:Parameter>
                <asp:Parameter Name="Password" Type="String"></asp:Parameter>
                <asp:Parameter Name="Country" Type="String"></asp:Parameter>
                <asp:Parameter Name="OnlineStatus" Type="Int32"></asp:Parameter>
                <asp:Parameter Name="Username" Type="String"></asp:Parameter>
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="Username" DataSourceID="SqlDataSourceRegistration" ForeColor="#333333" GridLines="None">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ShowSelectButton="True" />
                <asp:BoundField DataField="Id" HeaderText="Id" ReadOnly="True" InsertVisible="False" SortExpression="Id"></asp:BoundField>

                <asp:BoundField DataField="Username" HeaderText="Username" ReadOnly="True" SortExpression="Username" />
                <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
                <asp:BoundField DataField="Password" HeaderText="Password" SortExpression="Password" />
                <asp:BoundField DataField="Country" HeaderText="Country" SortExpression="Country" />
                <asp:BoundField DataField="OnlineStatus" HeaderText="OnlineStatus" SortExpression="OnlineStatus" />
            </Columns>
            <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
            <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
            <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
            <SortedAscendingCellStyle BackColor="#FDF5AC" />
            <SortedAscendingHeaderStyle BackColor="#4D0000" />
            <SortedDescendingCellStyle BackColor="#FCF6C0" />
            <SortedDescendingHeaderStyle BackColor="#820000" />
        </asp:GridView>

        <br />
        <br />
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString='<%$ ConnectionStrings:RegistrationConnectionString %>' SelectCommand="SELECT * FROM [MsgTable]" DeleteCommand="DELETE FROM [MsgTable] WHERE [Id] = @Id" InsertCommand="INSERT INTO [MsgTable] ([ChatMsg], [MsgSender], [MsgReceiver], [RecevierSeen]) VALUES (@ChatMsg, @MsgSender, @MsgReceiver, @RecevierSeen)" UpdateCommand="UPDATE [MsgTable] SET [ChatMsg] = @ChatMsg, [MsgSender] = @MsgSender, [MsgReceiver] = @MsgReceiver, [RecevierSeen] = @RecevierSeen WHERE [Id] = @Id">
            <DeleteParameters>
                <asp:Parameter Name="Id" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="ChatMsg" Type="String" />
                <asp:Parameter Name="MsgSender" Type="String" />
                <asp:Parameter Name="MsgReceiver" Type="String" />
                <asp:Parameter Name="RecevierSeen" Type="Int32" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="ChatMsg" Type="String" />
                <asp:Parameter Name="MsgSender" Type="String" />
                <asp:Parameter Name="MsgReceiver" Type="String" />
                <asp:Parameter Name="RecevierSeen" Type="Int32" />
                <asp:Parameter Name="Id" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="SqlDataSource1" CellPadding="4" ForeColor="#333333" GridLines="None" AllowPaging="True" AllowSorting="True">
            <AlternatingRowStyle BackColor="White"></AlternatingRowStyle>
            <Columns>
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ShowSelectButton="True" />
                <asp:BoundField DataField="Id" HeaderText="Id" ReadOnly="True" InsertVisible="False" SortExpression="Id"></asp:BoundField>
                <asp:BoundField DataField="ChatMsg" HeaderText="ChatMsg" SortExpression="ChatMsg"></asp:BoundField>
                <asp:BoundField DataField="MsgSender" HeaderText="MsgSender" SortExpression="MsgSender"></asp:BoundField>
                <asp:BoundField DataField="MsgReceiver" HeaderText="MsgReceiver" SortExpression="MsgReceiver"></asp:BoundField>
                <asp:BoundField DataField="RecevierSeen" HeaderText="RecevierSeen" SortExpression="RecevierSeen"></asp:BoundField>
            </Columns>
            <EditRowStyle BackColor="#7C6F57"></EditRowStyle>

            <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White"></FooterStyle>

            <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White"></HeaderStyle>

            <PagerStyle HorizontalAlign="Center" BackColor="#666666" ForeColor="White"></PagerStyle>

            <RowStyle BackColor="#E3EAEB"></RowStyle>

            <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333"></SelectedRowStyle>

            <SortedAscendingCellStyle BackColor="#F8FAFA"></SortedAscendingCellStyle>

            <SortedAscendingHeaderStyle BackColor="#246B61"></SortedAscendingHeaderStyle>

            <SortedDescendingCellStyle BackColor="#D4DFE1"></SortedDescendingCellStyle>

            <SortedDescendingHeaderStyle BackColor="#15524A"></SortedDescendingHeaderStyle>
        </asp:GridView>
    </div>
    </form>
</body>
</html>
