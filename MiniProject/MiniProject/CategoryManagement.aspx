<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMaster.Master" AutoEventWireup="true" CodeBehind="CategoryManagement.aspx.cs" Inherits="MiniProject.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="Style/CategoryManagement.css" rel="stylesheet" />    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="rectangle">
        <br /><br /><br />
        <asp:Label ID="Label1" runat="server" Text="Category Management" CssClass="label"></asp:Label>
        <br />
        <div class="dishid ">          
            <asp:Label ID="Label5" runat="server" Text="Category Id" Font-Bold="True"  CssClass="categryid" ></asp:Label>
            <asp:Label ID="Label4" runat="server" Text="Category" Font-Bold="True" CssClass="categry" ></asp:Label>
            <br />
            <asp:TextBox ID="CategoryId" runat="server" CssClass="txtbox1" ForeColor="White"></asp:TextBox>
            <asp:DropDownList ID="DropDownList1" runat="server" CssClass="dropDown" Font-Size="16px" ForeColor="White">
                <asp:ListItem Value="0">Select Category</asp:ListItem>
                <asp:ListItem Value="101">Veg</asp:ListItem>
                <asp:ListItem Value="102">Non-veg</asp:ListItem>
                <asp:ListItem Value="103">Drinks</asp:ListItem>
            </asp:DropDownList>
            <asp:Button ID="Btncategory" runat="server" Text="Submit" CssClass="btnSubmit1" OnClick="Btncategory_Click" ForeColor="White" />
            <asp:Label ID="lblmsg" runat="server"></asp:Label>
            <br /><br /><br />
            <asp:GridView ID="GridView2" runat="server" DataKeyNames="Category_Id" AutoGenerateColumns="False" BackColor="White" BorderColor="black" BorderStyle="Double" BorderWidth="1px" CellPadding="3" GridLines="Vertical" Width="350px">
                <AlternatingRowStyle BackColor="#B6B6B4" />
                <Columns>
                    <asp:BoundField DataField="Category_Name" HeaderText="Category_Name" />
                    <asp:BoundField DataField="Category_Id" HeaderText="Category_Id" />
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
            <br /><br /><br />
            <div>
                <asp:Label ID="Label6" runat="server" Text="Category" CssClass="categoryTxt" Font-Bold="True"></asp:Label>
                <asp:Label ID="dishlbl" runat="server" Text="Dish Name" CssClass="dishName" Font-Bold="True" ></asp:Label>     
                <asp:Label ID="Label2" runat="server"  Text="Price" CssClass="price" Font-Bold="True"></asp:Label>
                <asp:Label ID="Label7" runat="server" Text="Meals" CssClass="meals" Font-Bold="True"></asp:Label>
            </div>

            <div>
            <asp:DropDownList ID="categorydropdown" runat="server" CssClass="dropDown" Font-Size="16px" ForeColor="White">
                <asp:ListItem Value="0">Select Category</asp:ListItem>
                    <asp:ListItem Value="101">Veg</asp:ListItem>
                    <asp:ListItem Value="102">Non-veg</asp:ListItem>
                    <asp:ListItem Value="103">Drinks</asp:ListItem>        
            </asp:DropDownList>
            <asp:TextBox ID="Dishname" runat="server" CssClass="textbox2" ForeColor="White"></asp:TextBox>
            <asp:TextBox ID="price" runat="server" CssClass="textbox2" ForeColor="White"></asp:TextBox>
            <asp:TextBox ID="meals" runat="server" CssClass="textbox2" ForeColor="White"></asp:TextBox>
            </div>
            <br />
            <div>
                <asp:Label ID="Label3" runat="server" Text="Image" CssClass="image" Font-Bold="True" ></asp:Label>
            </div>
                <asp:FileUpload ID="FileUpload1" runat="server" Width="210px" CssClass="file" ForeColor="White" />
            <asp:ImageMap ID="map1" runat="server" CssClass="mapPIC" ></asp:ImageMap>
            <br /><br /><br />
            <div>
                <asp:Button ID="submitbtn" runat="server" Text="Submit" CssClass="btnSubmit" ForeColor="White" OnClick="submitbtn_Click" />
                <asp:Button ID="clerbtn" runat="server" Text="Clear" CssClass="btnClear" ForeColor="White" OnClick="clerbtn_Click"/>
                <asp:Label ID="Lblmessage" runat="server"  CssClass="Lblmessage"></asp:Label>
            </div>
            <asp:HiddenField ID="Hiddenval" runat="server" Value="-1" />
            <br /><br /><br />
            <div class="grid3">
                <asp:GridView ID="GridView3" runat="server" DataKeyNames="Dish_Id,Category_Id" AutoGenerateColumns="False" BackColor="White" BorderColor="Black" BorderStyle="Double" BorderWidth="1px" CellPadding="3" GridLines="Vertical" Height="215px" Width="772px" >
                    <AlternatingRowStyle BackColor="#B6B6B4" />
                    <Columns>
                        <asp:BoundField DataField="Dish_Id" HeaderText="Dish_ID" />
                        <asp:BoundField DataField="Category_Id" HeaderText="Category_Id" />
                        <asp:BoundField DataField="Dish_Name" HeaderText="Dish_Name" />
                        <asp:ImageField DataImageUrlField="Image" HeaderText="Image">
                            <ControlStyle Height="100px" Width="100px" />
                        </asp:ImageField>
                        <asp:BoundField DataField="Price" HeaderText="Price" >
                        <ControlStyle Font-Names="Footlight MT Light" />
                        <HeaderStyle Font-Bold="True" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Meals" HeaderText="Meals" />
                        <asp:TemplateField HeaderText="EDIT">
                            <ItemTemplate>
                                <asp:ImageButton ID="ImageButton1" runat="server" CausesValidation="False" ImageUrl="~/Image/Edit.png" OnClick="ImageButton1_Click" Height="45px" Width="42px" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="DELETE">
                            <ItemTemplate>
                                <asp:ImageButton ID="ImageButton2" runat="server" ImageUrl="~/Image/Delete.png" OnClick="ImageButton2_Click" Height="45px" Width="51px" />
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
         </div>
     </div>
</asp:Content>
