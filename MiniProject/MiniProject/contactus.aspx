<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ContactUS.aspx.cs" Inherits="MiniProject.ContactUS" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>IndianPlatter</title>
    <link rel="icon" type="image/x-icon" href="Image/Favicon.png"/>
    <link href="Style/ContactUS.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Image ID="Image1" runat="server"  CssClass="logo-1" src="Image/Logo.png" Height="116px" Width="363px"/>
            <br /><br />
            <div class="details1">
                <div class="contactus">
                    Contact Us
                </div>
                <br />Location <br />+0123456789<br />haiindianplatter@gmail.com
            </div>
            <div class="content">
                Necessary, making this the first true generator <br/>on the Internet. It uses a dictionary of over 200 <br/>Latin words, combined with
                <br /><br /><br />
                <asp:Button ID="btnBack" runat="server" Text="Back" CssClass="back" PostBackUrl="~/IndianPlatterWebForm.aspx"  />
            </div>
            <div class="details2">
                <div class="openinghours">
                    Opening Hours
                </div>
                <br />Everyday <br />10.00 Am - 10.00 Pm
            </div>
        </div>
    </form>
</body>
</html>
