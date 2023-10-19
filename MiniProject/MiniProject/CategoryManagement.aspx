<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMaster.Master" AutoEventWireup="true" CodeBehind="CategoryManagement.aspx.cs" Inherits="MiniProject.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="Style/CategoryManagement.css" rel="stylesheet" />    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="rectangle">
            <br /><br /><br />
            <asp:Label ID="Label1" runat="server" Text="Category Management" CssClass="label"></asp:Label>
    </div>
    <br />
    <div class="dishid ">          
            <asp:Label ID="Label5" runat="server" Text="Category Id" Font-Bold="True"  CssClass="text" ></asp:Label>
            <asp:Label ID="Label4" runat="server" Text="Category" CssClass="categry" Font-Bold="True" ></asp:Label>
            <br />
            <asp:TextBox ID="CategoryId" runat="server" CssClass="txtbox2"></asp:TextBox>
             <asp:DropDownList ID="DropDownList1" runat="server" CssClass="textbox1" Height="40px" >
                    <asp:ListItem Value="0">select category</asp:ListItem>
                    <asp:ListItem Value="101">veg</asp:ListItem>
                    <asp:ListItem Value="102">non-veg</asp:ListItem>
                    <asp:ListItem Value="103">Drinks</asp:ListItem>
                </asp:DropDownList>
            <asp:Button ID="Btncategory" runat="server" Text="Submit" CssClass="btnsbmit" OnClick="Btncategory_Click" />
            <asp:Label ID="lblmsg" runat="server"></asp:Label>
            <br />
            <br />
            <br />
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
           
                <div class="dishlabel">
                    <asp:Label ID="Label6" runat="server" Text="Category" CssClass="text" Font-Bold="True"></asp:Label>
                    <asp:Label ID="dishlbl" runat="server" Text="Dish Name" Font-Bold="True"  CssClass="dishnme" ></asp:Label>     
                    <asp:Label ID="Label2" runat="server"  Text="Price" CssClass="pricelbl" Font-Bold="True"></asp:Label>
                    <asp:Label ID="Label3" runat="server" Text="Image" CssClass="fileimage" Font-Bold="True" ></asp:Label>
                </div>
                <%--<asp:TextBox ID="category" runat="server" CssClass="textbox1"></asp:TextBox>--%>
        <asp:DropDownList ID="categorydropdown" runat="server" CssClass="textbox1">
            <asp:ListItem Value="0">------Select Category-----</asp:ListItem>
                    <asp:ListItem Value="101">veg</asp:ListItem>
                    <asp:ListItem Value="102">non-veg</asp:ListItem>
                    <asp:ListItem Value="103">Drinks</asp:ListItem>
        </asp:DropDownList>
                    <asp:TextBox ID="Dishname" runat="server" CssClass="textbox1"></asp:TextBox>
                    <asp:TextBox ID="price" runat="server" CssClass="textbox1"></asp:TextBox>
                    <asp:FileUpload ID="FileUpload1" runat="server" CssClass="textbox1" Height="40px" />
                <asp:ImageMap ID="map1" runat="server" Height="51px" Width="64px"></asp:ImageMap>
           
        </div>
            <asp:Button ID="submitbtn" runat="server" Text="Submit" CssClass="btn" OnClick="submitbtn_Click" />
            &nbsp;
            <asp:Button ID="clerbtn" runat="server" Text="Clear" CssClass="clrbtn"/>
    <asp:Label ID="Lblmessage" runat="server"  CssClass="Lblmessage"></asp:Label>
             <br /><br /><br /><br />
            <asp:HiddenField ID="Hiddenval" runat="server" Value="-1"   />
            <div class="grid3">
                <br />
                <br />
                <asp:GridView ID="GridView3" runat="server" DataKeyNames="Dish_Id,Category_Id" AutoGenerateColumns="False" BackColor="White" BorderColor="black" BorderStyle="Double" BorderWidth="1px" CellPadding="3" GridLines="Vertical" Height="215px" Width="772px" >
                    <AlternatingRowStyle BackColor="#B6B6B4" />
                    <Columns>
                        <asp:BoundField DataField="Category_Id" HeaderText="Category_Id" />
                        <asp:BoundField DataField="Dish_Name" HeaderText="Dish_Name" />
                        <asp:ImageField DataImageUrlField="Image" HeaderText="Image">
                            <ControlStyle Height="100px" Width="100px" />
                        </asp:ImageField>
                        <asp:BoundField DataField="Price" HeaderText="Price" >
                        <ControlStyle Font-Names="Footlight MT Light" />
                        <HeaderStyle Font-Bold="True" />
                        </asp:BoundField>
                        <asp:TemplateField HeaderText="EDIT">
                            <ItemTemplate>
                                <asp:ImageButton ID="ImageButton1" runat="server" CausesValidation="False" Height="45px" ImageUrl="~/Image/Edit.png" OnClick="ImageButton1_Click" Width="42px" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="DELETE">
                            <ItemTemplate>
                                <asp:ImageButton ID="ImageButton2" runat="server" Height="45px" ImageUrl="~/Image/Delete.png" Width="51px" OnClick="ImageButton2_Click" />
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
