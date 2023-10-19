<%@ Page Title="" Language="C#" MasterPageFile="~/UserMaster.Master" AutoEventWireup="true" CodeBehind="userprofile.aspx.cs" Inherits="MiniProject.WebForm2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link href="Style/userprofiles.css" rel="stylesheet" />
     <div>
            <div class="DIV">
                <asp:TextBox ID="TxtName" runat="server" CssClass="Textbox1" Height="52px" Width="353px" BackColor="#999999" placeholder="Name"></asp:TextBox>
                <br />
                <asp:TextBox ID="TxtEmail" runat="server" CssClass="Textbox1" Height="52px" Width="353px" BackColor="#999999" placeholder="Email"></asp:TextBox>
                <br />
                <asp:TextBox ID="TxtPhonenumber" runat="server" CssClass="Textbox1" Height="52px" Width="353px" BackColor="#999999" placeholder="Phone Number"></asp:TextBox>
                <br />
                <asp:TextBox ID="TxtDistrict" runat="server" CssClass="Textbox1" Height="52px" Width="353px" BackColor="#999999" placeholder="District"></asp:TextBox>
                <br />
                <asp:TextBox ID="TxtPincode" runat="server" CssClass="Textbox1" Height="52px" Width="353px" BackColor="#999999" placeholder="Pincode"></asp:TextBox>
                <br />
                <asp:TextBox ID="TxtPassword" runat="server" CssClass="Textbox1" Height="52px" Width="353px" BackColor="#999999" placeholder="Password"></asp:TextBox>
                <link href="Style/userprofile.css" rel="stylesheet" />
                <asp:Button ID="Button1" runat="server" BackColor="#FF3300" CssClass="auto-style5" ForeColor="White" Text="Submit" Height="38px" Width="186px" OnClick="Button1_Click" />
                <asp:Button ID="Button2" runat="server" BackColor="#FF3300" CssClass="Clear" ForeColor="White" Height="40px" Text="Clear" Width="105px" OnClick="Button2_Click" />
                <asp:HiddenField ID="HiddenId" runat="server" />
                <asp:Button ID="Button3" runat="server" BackColor="#FF3300" CssClass="auto-style6" ForeColor="White" Text="Delete Account" Width="212px" OnClick="Button3_Click" />
                <br />
                <br />
                
&nbsp;&nbsp;
                                
                <br />
                <br />
                <br />
                <br />
            </div>
        </div>
        <p>
            <br />
        </p>
        <p>
            &nbsp;</p>
        <p>
            &nbsp;</p>
        <p>
            &nbsp;</p>
        <p>
            &nbsp;</p>
        <p>
            &nbsp;</p>
        <p>
            &nbsp;</p>
        <p>
            &nbsp;</p>
        <p>
            &nbsp;</p>
        <p>
            &nbsp;</p>
        <p>
            &nbsp;</p>
        <p>
            &nbsp;</p>
 
    <asp:Label ID="Submitmsg" runat="server" Text="Label" Visible="False"></asp:Label>
&nbsp;&nbsp;
    <asp:Label ID="Delmsg" runat="server" Text="Label" Visible="False"></asp:Label>
  
    </asp:Content>



