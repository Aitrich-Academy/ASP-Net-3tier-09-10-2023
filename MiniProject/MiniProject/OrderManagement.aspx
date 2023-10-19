<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMaster.Master" AutoEventWireup="true" CodeBehind="OrderManagement.aspx.cs" Inherits="MiniProject.OrderManagement" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="Style/OrderManagement.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <div class="rectangle">
            <br /><br /><br />
            <asp:Label ID="Label1" runat="server" Text="Order Management" CssClass="label"></asp:Label>
            <asp:GridView ID="GridView1" runat="server" BackColor="White" BorderColor="black" BorderStyle="Double" BorderWidth="1px" CellPadding="3" GridLines="Vertical" AutoGenerateColumns="False" CssClass="gridView" DataKeyNames="Order_Id" >
                <AlternatingRowStyle BackColor="#B6B6B4" />
                <Columns>
                    <asp:BoundField DataField="Order_Id" HeaderText="OrderID" />
                    <asp:BoundField DataField="Name" HeaderText="User_Name" />
                    <asp:BoundField DataField="Email" HeaderText="Email" />
                    <asp:BoundField DataField="PhoneNumber" HeaderText="PhoneNumber" />
                    <asp:BoundField DataField="District" HeaderText="District" />
                    <asp:BoundField DataField="Pincode" HeaderText="Pincode" />
                    <asp:BoundField DataField="Dish_Name" HeaderText="Dish_Name" />
                    <asp:BoundField DataField="Price" HeaderText="Price" />
                    <asp:BoundField DataField="Quantity" HeaderText="Quantity" />
                    <asp:ImageField DataImageUrlField="Image" HeaderText="Image">
                        <ControlStyle Height="100px" Width="100px" />
                    </asp:ImageField>
                    <asp:TemplateField HeaderText="Status">
                        <ItemTemplate>
                            <asp:Button ID="btnAcceptOrder" runat="server" Text="Accept Order" CssClass="btnOrder" OnClick="btnAcceptOrder_Click" />
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
