<%@ Page Title="Mobile Broswer Detected" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="MobilePage.aspx.cs" Inherits="MobilePage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MenuContentHolder" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContentHolder" Runat="Server">
    <div style="text-align:center">
        <h4 class="alert alert-danger" >Mobile Broswer Detected</h4>
    </div>
    <div class="alert alert-info">
        Sorry to say that this site is not designed for mobile browser.
        For best browsing exprerience, I recommend you to use Desktop/laptop.
        <div>But if you still want to continue browsering with mobile device <a href="login.aspx" style="color:red">click here</a>. (not recommended)</div>
    </div>
</asp:Content>

