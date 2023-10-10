<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMaster.Master" AutoEventWireup="true" CodeBehind="OrderManagement.aspx.cs" Inherits="MiniProject.OrderManagement" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="Style/OrderManagement.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <div class="rectangle">
            <br /><br /><br />
            <asp:Label ID="Label1" runat="server" Text="Order Management" CssClass="label"></asp:Label>
        </div>
</asp:Content>
