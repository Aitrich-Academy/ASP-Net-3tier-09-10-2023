<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Search.aspx.cs" Inherits="MiniProject.Search" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>IndianPlatter</title>
    <link rel="icon" type="image/x-icon" href="Image/Favicon.png"/>
    <link href="Style/UserMaster.css" rel="stylesheet" />
    <link href="Style/MenuList.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Image ID="Logo" runat="server" src="Image/Logo.png" CssClass="logo" />
            <asp:ImageButton ID="ImageButton" runat="server" src="Image/Search.png" CssClass="imgBtn" OnClick="ImageButton_Click" />
            <asp:TextBox ID="TextBox1" runat="server" Placeholder="   Search...." CssClass="textBox" ></asp:TextBox>
            <asp:Menu ID="Menu1" runat="server" Orientation="Horizontal" CssClass="menu" ForeColor="White" RenderingMode="Table">
                <Items>
                    <asp:MenuItem Text="CATEGORIES" Value="CATEGORIES" NavigateUrl="~/MenuHomePage.aspx"></asp:MenuItem>
                    <asp:MenuItem Text="ACCOUNT" Value="ACCOUNT" NavigateUrl="~/UserProfile.aspx"></asp:MenuItem>
                 </Items>
                    <StaticMenuItemStyle HorizontalPadding="20px" />
             </asp:Menu>
            <asp:Button ID="btnLogOut" runat="server" Text="LogoOut" CssClass="logout" PostBackUrl="~/Login.aspx" />
            <asp:ImageButton ID="ImageButton1" runat="server" src="Image/Order_View.png" CssClass="icon" PostBackUrl="~/OrderView.aspx"/>
            <asp:ImageButton ID="ImageButton2" runat="server" src="Image/UserHome.png" CssClass="icon" PostBackUrl="~/UserWebForm.aspx"/>

             <br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br />
            <asp:DataList ID="DataList1" runat="server"  RepeatColumns="5" ForeColor="Black" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" CellSpacing="2" GridLines="Both" OnItemCommand="DataList1_ItemCommand">
                <FooterStyle BackColor="#CCCCCC" />
                <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
                <ItemStyle BackColor="White" />
                <ItemTemplate>
                    <table height="200">
                        <tr>
                            <td width="500px" align="center" >
                                <asp:Image ID="imgDish" runat="server" ImageUrl='<%# Eval("Image") %>' style="Width :100px; Height: 100px" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <span style="color:darkred; font-weight: bold;"> </span>
                                <asp:Label ID="lb1" runat="server" Text='<%#Eval("Dish_Name") %>'></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <span style="color:darkred; font-weight: bold;">₹</span>
                                <asp:Label ID="lbl2" runat="server" Text='<%#Eval("Price") %>'></asp:Label>  
                                <asp:Button ID="decrement" runat="server" Text="-" Width="24px" CssClass="btnquantity" CommandName="Decrement" CommandArgument='<%# Container.ItemIndex %>'/>                                
                                <asp:Label ID="quantitylabl" runat="server" CssClass="lblquantity" Text="1" ></asp:Label>
                                <asp:Button ID="increment" runat="server" Text="+" Width="24px" CssClass="btnquantity" CommandName="Increment" CommandArgument='<%# Container.ItemIndex %>' />
                            </td>
                        </tr>
                        <tr>
                            <td align="center">
                                <asp:Button ID="btnbuynow" runat="server" Text="Buy Now" align="center"  CssClass="buy-now"  CommandName="BuyNow" CommandArgument='<%# Container.ItemIndex %>'  />
                            </td>
                        </tr>
                    </table>
            </ItemTemplate>
            <SelectedItemStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
        </asp:DataList>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ProjectConnectionString4 %>" ProviderName="<%$ ConnectionStrings:ProjectConnectionString4.ProviderName %>" SelectCommand="SELECT [Dishe_Name], [Price], [Image], [Status] FROM [Dishes]"></asp:SqlDataSource>
        </div>
    </form>
</body>
</html>
