<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Booking.aspx.cs" Inherits="MiniProject.Booking" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>IndianPlatter</title>
    <link rel="icon" type="image/x-icon" href="Image/Favicon.png"/>
    <link href="Style/Booking.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Image ID="Logo" runat="server" src="Image/Logo.png" CssClass="logo" />
            <br />
            <asp:TextBox ID="txtName" runat="server" CssClass="textbox1" ForeColor="White"></asp:TextBox>
            <br />
            <asp:TextBox ID="txtEmail" runat="server" CssClass="textbox2" ForeColor="White"></asp:TextBox>
            <br />
            <asp:TextBox ID="txtPhone" runat="server" CssClass="textbox2" ForeColor="White"></asp:TextBox>
            <br />
            <asp:TextBox ID="district" runat="server" CssClass="textbox2" ForeColor="White"></asp:TextBox>
            <br />
            <asp:TextBox ID="pinCode" runat="server" CssClass="textbox2" ForeColor="White"></asp:TextBox>
            <br />
            <asp:TextBox ID="pswd" runat="server" CssClass="textbox2" ForeColor="White"></asp:TextBox>
            <br />
            <div class="details">
                <br />
                <asp:Label ID="DishName" runat="server" CssClass="label" Text="DishName :"></asp:Label>
                <asp:Label ID="txtDishName" runat="server" ></asp:Label>
                <br />
                <asp:Label ID="Price" runat="server" CssClass="label" Text="Price :"></asp:Label>
                <asp:Label ID="txtPrice" runat="server" ></asp:Label>
                <br />
                <asp:Label ID="Quantity" runat="server" CssClass="label" Text="Quantity :"></asp:Label>
                <asp:Label ID="txtQuantity" runat="server" ></asp:Label>
            </div>
            <div class="totalPrice">
                <br />
                <asp:Label ID="TotalPrice" runat="server" Text="TotalPrice :" CssClass="label"></asp:Label>
                <asp:Label ID="txtTotal" runat="server" ></asp:Label>
            </div>
            <asp:Button ID="btnCancel" runat="server" Text="CANCEL" CssClass="btnCancel" />
            <asp:Button ID="btnConfirm" runat="server" Text="CONFIRM" CssClass="btnConfirm" />
        </div>
    </form>
</body>
</html>
