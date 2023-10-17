<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMaster.Master" AutoEventWireup="true" CodeBehind="OrderManagement.aspx.cs" Inherits="MiniProject.OrderManagement" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="Style/OrderManagement.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <div class="rectangle">
            <br /><br /><br />
            <asp:Label ID="Label1" runat="server" Text="Order Management" CssClass="label"></asp:Label>
            <asp:GridView ID="GridView1" runat="server" BackColor="White" BorderColor="#5E597F" BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Vertical" AutoGenerateColumns="False" CssClass="gridView" DataKeyNames="OrderID" >
                <AlternatingRowStyle BackColor="#DCDCDC" />
                <Columns>
                    <asp:BoundField DataField="OrderID" HeaderText="OrderID" ReadOnly="True" SortExpression="OrderID" />
                    <asp:BoundField DataField="User_Name" HeaderText="User_Name" SortExpression="User_Name" />
                    <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
                    <asp:BoundField DataField="PhoneNumber" HeaderText="PhoneNumber" SortExpression="PhoneNumber" />
                    <asp:BoundField DataField="District" HeaderText="District" SortExpression="District" />
                    <asp:BoundField DataField="Pincode" HeaderText="Pincode" SortExpression="Pincode" />
                    <asp:BoundField DataField="Category" HeaderText="Category" SortExpression="Category" />
                    <asp:BoundField DataField="Dish_Name" HeaderText="Dish_Name" SortExpression="Dish_Name" />
                    <asp:BoundField DataField="Dish_Price" HeaderText="Dish_Price" SortExpression="Dish_Price" />
                    <asp:BoundField DataField="Dish_Image" HeaderText="Dish_Image" SortExpression="Dish_Image" />
                    <asp:BoundField DataField="Total_Price" HeaderText="Total_Price" SortExpression="Total_Price" />
                    <asp:TemplateField HeaderText="Status">
                        <ItemTemplate>
                            <asp:Button ID="btnAcceptOrder" runat="server" Text="Accept Order" CssClass="btnOrder" OnClick="btnAcceptOrder_Click" />
                        </ItemTemplate>
                    </asp:TemplateField>                
                </Columns>
                <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
                <HeaderStyle BackColor="#5E597F" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
                <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
                <SortedAscendingCellStyle BackColor="#F1F1F1" />
                <SortedAscendingHeaderStyle BackColor="#0000A9" />
                <SortedDescendingCellStyle BackColor="#CAC9C9" />
                <SortedDescendingHeaderStyle BackColor="#000065" />
            </asp:GridView>
        </div>
</asp:Content>
