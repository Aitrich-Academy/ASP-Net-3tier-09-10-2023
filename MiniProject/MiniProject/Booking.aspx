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
        <asp:Image ID="Image1" runat="server" CssClass="img" />    
        <asp:TextBox ID="txtName" runat="server" CssClass="textbox1" ForeColor="White"></asp:TextBox>
        <br />
        <asp:TextBox ID="txtEmail" runat="server" CssClass="textbox2" ForeColor="White"></asp:TextBox>
        <br />
        <asp:TextBox ID="txtPhoneNumber" runat="server" CssClass="textbox2" ForeColor="White"></asp:TextBox>
        <br />
        <asp:TextBox ID="txtDistrict" runat="server" CssClass="textbox2" ForeColor="White"></asp:TextBox>
        <br />
        <asp:TextBox ID="txtPincode" runat="server" CssClass="textbox2" ForeColor="White"></asp:TextBox>
        <br />
        <div class="details">
            <br />
            <asp:Label ID="DishName" runat="server" CssClass="label" Text="DishName :"></asp:Label>
            <asp:Label ID="txtDishName" runat="server" CssClass="result" ></asp:Label>
            <br />
            <asp:Label ID="Price" runat="server" CssClass="label" Text="Price :"></asp:Label>
            <span style = "color:dodgerblue; font-size: 20px; font-weight: bold;">₹</span>
            <asp:Label ID="txtPrice" runat="server" CssClass="result" ></asp:Label>
            <br />
            <asp:Label ID="Quantity" runat="server" CssClass="label" Text="Quantity :"></asp:Label>
            <asp:Label ID="txtQuantity" runat="server" CssClass="result" ></asp:Label>
        </div>
        <div class="totalPrice">
            <br />
            <asp:Label ID="TotalPrice" runat="server" Text="TotalPrice :" CssClass="label"></asp:Label>
            <span style="color:dodgerblue; font-size: 20px; font-weight: bold;">₹</span>
            <asp:Label ID="txtTotal" runat="server" CssClass="result" ></asp:Label>
        </div>
        <asp:Button ID="btnCancel" runat="server" Text="CANCEL" CssClass="btnCancel" OnClick="btnCancel_Click" />
        <asp:Button ID="btnConfirm" runat="server" Text="CONFIRM" CssClass="btnConfirm" OnClick="btnConfirm_Click" />
        <asp:HiddenField ID="Hidden" runat="server"/>
        </div>
    </form>
</body>
</html>