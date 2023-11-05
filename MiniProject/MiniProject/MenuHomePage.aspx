<%@ Page Title="" Language="C#" MasterPageFile="~/UserMaster.Master" AutoEventWireup="true" CodeBehind="MenuHomePage.aspx.cs" Inherits="MiniProject.MenuHomePage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="Style/MenuHomePage.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="flex-container">
          <div>
              <asp:Image ID="imgStarter" runat="server" src="Image/MenuItems/Starter.jpeg" CssClass="starter"/>
              <asp:ImageButton ID="ImageButton1" runat="server" src="Image/MenuItems/ARROW.png" CssClass="arrow" PostBackUrl="~/MenuListStarter.aspx" />
              <asp:Label ID="Label1" runat="server" Text="Starter" CssClass="label"></asp:Label>
          </div>
          <div>
              <asp:Image ID="imgBrakfast" runat="server" src="Image/MenuItems/Brakfast.jpg" CssClass="brakfast" />
              <asp:ImageButton ID="ImageButton2" runat="server" src="Image/MenuItems/ARROW.png" CssClass="arrow" PostBackUrl="~/MenuListBrakfast.aspx"/>
              <asp:Label ID="Label2" runat="server" Text="Brakfast" CssClass="label"></asp:Label>
          </div>
          <div>
              <asp:Image ID="imgLunch" runat="server" src="Image/MenuItems/Lunch.jpg" CssClass="lunch" />
              <asp:ImageButton ID="ImageButton3" runat="server" src="Image/MenuItems/ARROW.png" CssClass="arrow" PostBackUrl="~/MenuListLunch.aspx"/>
              <asp:Label ID="Label3" runat="server" Text="Lunch" CssClass="label"></asp:Label>
          </div>
          <div>
              <asp:Image ID="imgDinner" runat="server" src="Image/MenuItems/Dinner.jpg" CssClass="dinner" />
              <asp:ImageButton ID="ImageButton4" runat="server" src="Image/MenuItems/ARROW.png" CssClass="arrow" PostBackUrl="~/MenuListDinner.aspx"/>
              <asp:Label ID="Label4" runat="server" Text="Dinner" CssClass="label"></asp:Label>
          </div>
          <div>
              <asp:Image ID="imgDrinks" runat="server" src="Image/MenuItems/Drinks.jpeg" CssClass="drinks" />
              <asp:ImageButton ID="ImageButton5" runat="server" src="Image/MenuItems/ARROW.png" CssClass="arrow" PostBackUrl="~/MenuListDrinks.aspx"/>
              <asp:Label ID="Label5" runat="server" Text="Drinks" CssClass="label"></asp:Label>
          </div>
    </div>
</asp:Content>
