<%@ Page Title="" Language="C#" MasterPageFile="~/UserMaster.Master" AutoEventWireup="true" CodeBehind="userprofile.aspx.cs" Inherits="MiniProject.WebForm2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link href="Style/userprofiles.css" rel="stylesheet" />
     <div>
            <br /><br /><br /><br /><br /><br /><br /><br /><br />
            <div class="rectangle" >
                <br />
                    <asp:TextBox ID="txtName" runat="server" CssClass="TextBox" Placeholder="   Name...." ForeColor="White"></asp:TextBox>
                <br /><br />
                    <asp:TextBox ID="txtEmail" runat="server" CssClass="TextBox" Placeholder="   Email...." ForeColor="White"></asp:TextBox>
                <br /><br />
                    <asp:TextBox ID="txtPhoneNumber" runat="server" CssClass="TextBox" Placeholder="   PhoneNumber...." ForeColor="White"></asp:TextBox>
                <br /><br />
                    <asp:TextBox ID="txtDistrict" runat="server" CssClass="TextBox" Placeholder="   District...." ForeColor="White"></asp:TextBox>
                <br /><br />
                    <asp:TextBox ID="txtPincode" runat="server" CssClass="TextBox" Placeholder="   Pincode...." ForeColor="White"></asp:TextBox>
                <br /><br />
                    <asp:TextBox ID="txtPswd" runat="server" CssClass="TextBox" Placeholder="   Password...." ForeColor="White"></asp:TextBox>
                <br /><br />
                <asp:Button ID="btnSubmit" runat="server" Text="Submit" CssClass="btnSubmit" OnClick="btnSubmit_Click" />
                <asp:Button ID="btnClear" runat="server" Text="Clear" CssClass="btnClear" OnClick="btnClear_Click" />
                <br /><br />
                <asp:Button ID="btnDelete" runat="server" Text="Delete Account" CssClass="btnDelete" OnClick="btnDelete_Click" />            
            </div>
            <asp:HiddenField ID="Hidden" runat="server" />
        </div>


      
    </asp:Content>



