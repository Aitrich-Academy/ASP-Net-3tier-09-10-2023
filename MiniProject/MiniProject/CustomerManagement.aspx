<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMaster.Master" AutoEventWireup="true" CodeBehind="CustomerManagement.aspx.cs" Inherits="MiniProject.WebForm3" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="Style/CustomerManagement.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="rectangle">
         <br /><br /><br /> 
            <asp:Label ID="Label1" runat="server" Text="Customer Management" CssClass="label"></asp:Label>
            <asp:Label ID="LblMsg" runat="server" CssClass="label2" Visible="False"></asp:Label>
            <asp:GridView ID="GridView1" runat="server" BackColor="White" BorderColor="Black" BorderStyle="Double" BorderWidth="1px" CellPadding="3" GridLines="Vertical" AutoGenerateColumns="False" CssClass="GridView1" DataKeyNames="Id" >
                <AlternatingRowStyle BackColor="#B6B6B4" />
                <Columns>
                    <asp:BoundField DataField="Id" HeaderText="UserID" />
                    <asp:BoundField DataField="Name" HeaderText="Name" />
                    <asp:BoundField DataField="Email" HeaderText="Email" />
                    <asp:BoundField DataField="PhoneNumber" HeaderText="PhoneNumber" />
                    <asp:BoundField DataField="District" HeaderText="District" />
                    <asp:BoundField DataField="Pincode" HeaderText="Pincode" />                                                     
                    <asp:BoundField DataField="Status" HeaderText="Status" />
                    <asp:TemplateField HeaderText="Block">
                        <ItemTemplate>
                            <asp:Button ID="btnBlockuser" runat="server" Text="Block User" CssClass="btnBlock" ForeColor="White" OnClick="btnBlockuser_Click" CommandName="DeleteUser" CommandArgument='<%# Eval("Id") %>' />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
                <HeaderStyle BackColor="#5E597F" Font-Bold="True" ForeColor="White" Height="50px" HorizontalAlign="Center" Font-Size="20px" />
                <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                <RowStyle BackColor="#EEEEEE" ForeColor="Black" Font-Size="18px"/>
                <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
                <SortedAscendingCellStyle BackColor="#F1F1F1" />
                <SortedAscendingHeaderStyle BackColor="#0000A9" />
                <SortedDescendingCellStyle BackColor="#CAC9C9" />
                <SortedDescendingHeaderStyle BackColor="#000065" />
            </asp:GridView>
        </div>
</asp:Content>