<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="MiniProject.Register" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>IndianPlatter</title>
    <link rel="icon" type="image/x-icon" href="Image/Favicon.png"/>
    <link href="Style/Register.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <br />
            <div class="rectangle" >
                <br />
                    <asp:Label ID="Label1" runat="server" Text="Create an Account" CssClass="create-an-account"></asp:Label>

                <br /><br />
                    <asp:TextBox ID="txtName" runat="server" CssClass="TextBox" Placeholder="   Name...." ForeColor="White"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtName" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                <br /><br />
                    <asp:TextBox ID="txtEmail" runat="server" CssClass="TextBox" Placeholder="   Email...." TextMode="Email" ForeColor="White"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtEmail" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                <br /><br />
                    <asp:TextBox ID="txtPhone" runat="server" CssClass="TextBox" Placeholder="   PhoneNumber...." MaxLength="10" TextMode="Phone" ForeColor="White"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtPhone" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                <br /><br />
                    <asp:DropDownList ID="DistrictDropDownList" runat="server" CssClass="districtlist" DataTextField="District_Name" DataValueField="District_Name" >
                        <asp:ListItem Value="0">Select District....</asp:ListItem>
                        <asp:ListItem>Kasaragod</asp:ListItem>
                        <asp:ListItem>Kannur</asp:ListItem>
                        <asp:ListItem>Wayanad</asp:ListItem>
                        <asp:ListItem>Kozhikode</asp:ListItem>
                        <asp:ListItem>Malappuram</asp:ListItem>
                        <asp:ListItem>Palakkad</asp:ListItem>
                        <asp:ListItem>Thrissur</asp:ListItem>
                        <asp:ListItem>Eranakulam</asp:ListItem>
                        <asp:ListItem>Idukki</asp:ListItem>
                        <asp:ListItem>Kottayam</asp:ListItem>
                        <asp:ListItem>Alappuzha</asp:ListItem>
                        <asp:ListItem>Pathanamthitta</asp:ListItem>
                        <asp:ListItem>Kollam</asp:ListItem>
                        <asp:ListItem>Thiruvananthapuram</asp:ListItem>
                    </asp:DropDownList>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="DistrictDropDownList" ErrorMessage="*" ForeColor="Red" InitialValue="0" SetFocusOnError="True"></asp:RequiredFieldValidator>
                <br /><br />
                    <asp:TextBox ID="txtPincode" runat="server" CssClass="TextBox" Placeholder="   Pincode...." ForeColor="White"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtPincode" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                <br /><br />
                    <asp:TextBox ID="txtPswd" runat="server" CssClass="TextBox" Placeholder="   Password...." TextMode="Password" ForeColor="White"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txtPswd" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="pswdValidator" runat="server" ValidationExpression="^.{8,}$" Text="Password must have at least 8 characters" Display="Dynamic" CssClass="RegularExpressionValidator" ControlToValidate="txtPswd"></asp:RegularExpressionValidator>
                <br /><br />
                    <asp:TextBox ID="txtConfirmPswd" runat="server" Placeholder="   Confirm Password...." TextMode="Password" CssClass="TextBox" ForeColor="White"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="*" ControlToValidate="txtConfirmPswd" ForeColor="Red"></asp:RequiredFieldValidator>
                <asp:CompareValidator ID="confirmPswdValidator" runat="server" ControlToCompare="txtPswd" Text="Passwords do not match" Display="Dynamic" Operator="Equal" CssClass="RegularExpressionValidator" ControlToValidate="txtConfirmPswd"></asp:CompareValidator>
                <br /><br /><br />
                <asp:Button ID="btnSignUp" runat="server" Text="Sign Up" CssClass="bn54" OnClick="btnSignUp_Click" />            
                <div class="label">
                    <asp:Label ID="Label2" runat="server" Text="Already Registered?" ForeColor="White" ></asp:Label>
                </div>
                <div class="register" >
                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" ForeColor="DodgerBlue" PostBackUrl="~/Login.aspx" >Login here....</asp:LinkButton>
                </div>
            </div>
            <asp:HiddenField ID="Hidden" runat="server" Value="-1" />
        </div>
    </form>
</body>
</html>
