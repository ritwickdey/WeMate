 <%@ Page Language="C#" Title="Registration" AutoEventWireup="true" CodeFile="Registration.aspx.cs" Inherits="Registration" MasterPageFile="~/MasterPage.master" %>

<%@ Register Src="~/Banner.ascx" TagPrefix="uc1" TagName="Banner" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="style/bootstrap-3.3.6-dist/css/bootstrap.min.css" rel="stylesheet" />

    <script>
        function loadingIconVisible() {
            if (Page_ClientValidate("AllValidationGroup"))
            {
                document.getElementById('<%=LoadingImage.ClientID%>').style.opacity = 1;
               document.getElementById('<%=submit.ClientID%>').style.cursor = "not-allowed";
            }
            
                
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MenuContentHolder" Runat="Server">
    <uc1:Banner runat="server" ID="Banner" />
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContentHolder" runat="Server">
    <asp:updatepanel id="UpdatePanel1" runat="server">
        <ContentTemplate>
            <asp:Panel ID="Panel1" runat="server">
                <div>
                    <table class="modal-content">
                        <tr>
                            <td class="modal-header" colspan="3"><strong>Registration Form</strong></td>
                        </tr>
                        <tr class="form-group">
                            <td class="control-label col-sm-2">Username:</td>
                            <td>
                                <asp:TextBox ID="TextBoxUN" runat="server" CssClass="form-control col-sm-10"></asp:TextBox>
                            </td>
                            <td>
                               <div> <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server"  CssClass="alert-danger" ErrorMessage="Username is invalid. A-Z , 0-9 , Underscore &amp; hyphen allowed" ControlToValidate="TextBoxUN" ValidationExpression="^[a-z0-9_-]+$" ValidationGroup="AllValidationGroup" ></asp:RegularExpressionValidator></div>
                                
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBoxUN" CssClass="alert-danger" ErrorMessage="Username is requried" ValidationGroup="AllValidationGroup"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr class="form-group">
                            <td class="control-label col-sm-2">E-mail:</td>
                            <td class="auto-style9">
                                <asp:TextBox ID="TextBoxEmail" runat="server" CssClass="form-control col-sm-10"></asp:TextBox>
                            </td>
                            <td>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBoxEmail" CssClass="alert-danger" ErrorMessage="Email is requried" ValidationGroup="AllValidationGroup"></asp:RequiredFieldValidator>
                                <br />
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="TextBoxEmail" CssClass="alert-danger" ErrorMessage="Enter a valid Email address" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ValidationGroup="AllValidationGroup"></asp:RegularExpressionValidator>
                            </td>
                        </tr>
                        <tr class="form-group">
                            <td class="control-label col-sm-2">Password:</td>
                            <td class="auto-style9">
                                <asp:TextBox ID="TextBoxPass" runat="server" CssClass="form-control col-sm-10" TextMode="Password"></asp:TextBox>
                            </td>
                            <td class="auto-style7">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TextBoxPass" CssClass="alert-danger" ErrorMessage="Password is requried" ValidationGroup="AllValidationGroup"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr class="form-group">
                            <td class="control-label col-sm-2">Confirm Password:</td>
                            <td class="auto-style9">
                                <asp:TextBox ID="TextBoxRPass" runat="server" CssClass="form-control col-sm-10" TextMode="Password"></asp:TextBox>
                            </td>
                            <td class="auto-style7">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="TextBoxRPass" CssClass="alert-danger" ErrorMessage="Confirm Password is required" ValidationGroup="AllValidationGroup"></asp:RequiredFieldValidator>
                                <br />
                                <asp:CompareValidator ID="CompareValidator1" runat="server" CssClass="alert-danger" ErrorMessage="Both password should be same" ControlToCompare="TextBoxPass" ControlToValidate="TextBoxRPass" ValidationGroup="AllValidationGroup"></asp:CompareValidator>
                            </td>
                        </tr>
                        <tr class="form-group">
                            <td class="control-label col-sm-2">Country:</td>
                            <td>
                                <asp:DropDownList ID="DropDownListCountry" runat="server" CssClass="form-control">
                                    <asp:ListItem>Select Country</asp:ListItem>
                                    <asp:ListItem>India</asp:ListItem>
                                    <asp:ListItem>USA</asp:ListItem>
                                    <asp:ListItem>UK</asp:ListItem>
                                    <asp:ListItem>Others</asp:ListItem>
                                </asp:DropDownList>
                            </td>
                            <td class="auto-style7">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="DropDownListCountry" CssClass="alert-danger" ErrorMessage="Country is requried" InitialValue="Select Country" ValidationGroup="AllValidationGroup"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr class="form-group">
                            <td class="auto-style3">
                            </td>
                            <td class="auto-style13" style="padding:7px">
                                <asp:Button ID="submit" runat="server" OnClick="submit_Click" Text="Submit" CssClass="btn btn-default"  OnClientClick="loadingIconVisible()"/>
                                <span style="margin-left:20px"><asp:Image ID="LoadingImage" runat="server" ImageUrl="~/icon/loadingIcon.gif" /></span>
                            </td>
                            <td class="auto-style14"><a href="login.aspx">Already have a account?</a></td>
                        </tr>
                        <tr class="form-group">
                            <td class="auto-style4"></td>
                            <td class="auto-style12">
                                <asp:Label ID="InfoLabel" runat="server"></asp:Label>
                            </td>
                            <td class="auto-style5"></td>
                        </tr>
                    </table>

                </div>
            </asp:Panel>
            <asp:Panel ID="Panel2" runat="server" Visible="false">
                <div class="alert alert-success">
                    <asp:Label ID="ConfirmationLevel" runat="server" Text="<p style='text-align: center'>Registration Successfully Done...!!! <br /><a href='login.aspx'>Login from here</a></p>" Visible="true" Font-Size="X-Large" Font-Bold="True"></asp:Label>
                </div>
            </asp:Panel>
        </ContentTemplate>
    </asp:updatepanel>

</asp:Content>
