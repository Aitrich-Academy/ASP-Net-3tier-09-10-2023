<%@ Page Title="" Language="C#" MasterPageFile="~/UserMaster.Master" AutoEventWireup="true" CodeBehind="MenuList.aspx.cs" Inherits="MiniProject.MenuList" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
            <asp:DataList ID="DataList2" runat="server" DataKeyField="DishID" DataSourceID="SqlDataSource1" CellPadding="4" Font-Bold="False" Font-Italic="False" Font-Names="Segoe UI Semibold" Font-Overline="False" Font-Size="Medium" Font-Strikeout="False" Font-Underline="False" ForeColor="#333333" RepeatDirection="Horizontal">
                <AlternatingItemStyle BackColor="White" />
                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <ItemStyle BackColor="#EFF3FB" />
                <ItemTemplate>
                      <br />
                    Image:
                   <asp:Image ID="Image2" runat="server" ImageUrl='<%# Eval("Image") %>'  ImageAlign="Middle" Height="70px" Width="70px" />
                    <br />
                    
                    DishID:
                    <asp:Label ID="DishIDLabel" runat="server" Text='<%# Eval("DishID") %>' />
                    <br />
                    Dishe_Name:
                    <asp:Label ID="Dishe_NameLabel" runat="server" Text='<%# Eval("Dishe_Name") %>' />
                    <br />
                    Price:
                    <asp:Label ID="PriceLabel" runat="server" Text='<%# Eval("Price") %>' />
                  
                    <br />
                    Category_id:
                    <asp:Label ID="Category_idLabel" runat="server" Text='<%# Eval("Category_id") %>' />
                    <br />
                    Status:
                    <asp:Label ID="StatusLabel" runat="server" Text='<%# Eval("Status") %>' ForeColor="#99ff99" />
                    <br />
<br />
                </ItemTemplate>
                <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
            </asp:DataList>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ProjectConnectionString %>" SelectCommand="SELECT * FROM [Dishes]"></asp:SqlDataSource>
        </div>
</asp:Content>
