<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="contactme.aspx.cs" Inherits="MiniProject.contactme" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">
    <title></title>
    <link href="Style/ContactUS.css" rel="stylesheet" />
</head>
<body>
   
    <form id="form1" runat="server">
  
        <p>
         
            <asp:Label ID="Label8" runat="server" CssClass="Label8" Text="Contact Us"></asp:Label>
         
            <img alt="" class="img" src="Image/Logo.png" />
           
            <asp:Label ID="Label7" runat="server" CssClass="Label7" Text="Opening Hours"></asp:Label>
           
        </p>
    <div class="container">
       
            &nbsp;
       
        <asp:Label ID="Label5" runat="server" Height="128px" Text="Location Call +0123456789 IndianPlatter@gmail.com" Width="169px" CssClass="Label5"></asp:Label>
       
        <asp:Label ID="Label4" runat="server" Height="124px" Text="Necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with" Width="376px" CssClass="Label4"></asp:Label>
        
        
        <asp:Label ID="Label6" runat="server" Height="115px" Text=" Everyday 10.00 Am -10.00 Pm" Width="186px" CssClass="Label6"></asp:Label>
    </div>
        <p>
            <asp:Button ID="Button1" runat="server" CssClass="Button1" Text="BACK" BackColor="Orange" ForeColor="White" OnClick="Button1_Click" PostBackUrl="~/UserWebForm.aspx" />
        </p>
    </form>
    </body>
</html>

