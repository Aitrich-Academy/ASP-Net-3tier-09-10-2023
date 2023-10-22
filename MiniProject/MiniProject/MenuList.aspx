<%@ Page Title="" Language="C#" MasterPageFile="~/UserMaster.Master" AutoEventWireup="true" CodeBehind="MenuList.aspx.cs" Inherits="MiniProject.MenuList" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:DataList ID="DataList1" runat="server" onitemcommand="DataList1_ItemCommand" RepeatColumns="8" Width="1000px" ForeColor="Red">
    <ItemTemplate>
        <asp:Panel ID="Panel1" runat="server">
            <table height="200">
                <tr>
                    <td width="85%" align="center" style="font-weight: bold">
                  <asp:Image ID="imgDish" runat="server" ImageUrl='<%# Eval("Image") %>' style="max-width: 200px; max-height: 150px" />

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
                        <span style="color:darkred; font-weight: bold;">Price: </span><br />
                        <asp:Label ID="lbl2" runat="server" Text='<%#Eval("Price") %>'></asp:Label>
                    </td>
                </tr>
                <tr>

                </tr>
            </table>
        </asp:Panel>
    </ItemTemplate>
</asp:DataList>

</asp:Content>