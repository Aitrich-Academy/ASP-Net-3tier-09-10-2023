<%@ Page Title="" Language="C#" MasterPageFile="~/UserMaster.Master" AutoEventWireup="true" CodeBehind="UserWebForm.aspx.cs" Inherits="MiniProject.UserWebForm" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="Style/UserWebForm.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <asp:Label ID="Label1" runat="server" Text="Creamy Hot and Ready to Serve" CssClass="label"></asp:Label>
        <asp:Button ID="btnMenu" runat="server" Text="Menu" CssClass="buttonMenu" PostBackUrl="~/MenuHomePage.aspx" />
        <asp:Button ID="btnOrderNow" runat="server" Text="Order Now" CssClass="buttonOrderNow" />
    </div>
</asp:Content>
