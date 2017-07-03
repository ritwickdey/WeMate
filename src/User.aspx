<%@ Page Language="C#" AutoEventWireup="true" CodeFile="User.aspx.cs" Inherits="User" MasterPageFile="~/MasterPage.master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MenuContentHolder" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContentHolder" runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div>
                <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
                <br />
                <br />
                <br />
                <asp:Button ID="Button1" runat="server" Text="logout" OnClick="Button1_Click" />
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

 