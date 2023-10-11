<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="MiniProject.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>IndianPlatter</title>
    <link rel="icon" type="image/x-icon" href="Image/Favicon.png"/>
    <link href="Style/Login.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <div class="rectangle" >
                <br />              
                <asp:Image ID="Image1" runat="server" src="Image/Logo.png" CssClass="logo"/>               
                <br /><br />

                <asp:TextBox ID="txtEmail" runat="server" CssClass="TextBox" Placeholder="   Email...." TextMode="Email" ForeColor="White"></asp:TextBox>
                <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtEmail" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>--%>
                <br /><br />

                <asp:TextBox ID="txtPswd" runat="server" CssClass="TextBox" Placeholder="   Password...." TextMode="Password" ForeColor="White"></asp:TextBox>
                <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtPswd" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>--%>
                <br /><br /><br />

                <asp:Button ID="btnLogin" runat="server" Text="Log In" CssClass="bn54" OnClick="btnLogin_Click" />
            </div>
        </div>
    </form>
</body>
</html>
