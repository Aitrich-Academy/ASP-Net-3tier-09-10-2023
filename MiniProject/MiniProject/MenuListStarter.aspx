<%@ Page Title="" Language="C#" MasterPageFile="~/UserMaster.Master" AutoEventWireup="true" CodeBehind="MenuListStarter.aspx.cs" Inherits="MiniProject.MenuListStarter" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="Style/MenuList.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="flex-container">
        <div>
            <asp:DataList ID="DataList1" runat="server" RepeatColumns="5" ForeColor="Black" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" CellSpacing="2" GridLines="Both" OnItemCommand="DataList1_ItemCommand" DataSourceID="SqlDataSource1">
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
                                <asp:Label ID="lb1" runat="server" Text='<%#Eval("Dishe_Name") %>'></asp:Label>
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
        </div>
    </div>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ProjectConnectionString5 %>" ProviderName="<%$ ConnectionStrings:ProjectConnectionString5.ProviderName %>" SelectCommand="GetDishesByStarter" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
</asp:Content>
