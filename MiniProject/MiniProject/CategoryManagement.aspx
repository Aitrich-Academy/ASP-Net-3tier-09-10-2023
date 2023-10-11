<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMaster.Master" AutoEventWireup="true" CodeBehind="CategoryManagement.aspx.cs" Inherits="MiniProject.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="Style/categorysheet.css" rel="stylesheet" />
    
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
        <asp:TextBox ID="TextBox3" runat="server" CssClass="txtbox2"></asp:TextBox>
         <asp:DropDownList ID="DropDownList1" runat="server" CssClass="textbox1" Height="40px" >
                <asp:ListItem Value="0">select category</asp:ListItem>
                <asp:ListItem>veg</asp:ListItem>
                <asp:ListItem>non-veg</asp:ListItem>
            </asp:DropDownList>
        <br />
        
        
    <div class="dishlabel">
        <asp:Label ID="dishlbl" runat="server" Text="Dish Name" Font-Bold="True"  CssClass="text" ></asp:Label>     
     <asp:Label ID="Label2" runat="server"  Text="Price" CssClass="pricelbl" Font-Bold="True"></asp:Label>
        <asp:Label ID="Label3" runat="server" Text="Image" CssClass="fileimage" Font-Bold="True" ></asp:Label>
        </div>
            <asp:TextBox ID="TextBox1" runat="server" CssClass="textbox1"></asp:TextBox>
            <asp:TextBox ID="TextBox2" runat="server" CssClass="textbox1"></asp:TextBox>
            <asp:FileUpload ID="FileUpload1" runat="server" CssClass="textbox1" Height="40px" />
           
        </div>
            <asp:Button ID="submitbtn" runat="server" Text="Submit" CssClass="btn" />
        <asp:Button ID="clerbtn" runat="server" Text="Clear" CssClass="clrbtn"/>
        <br />
        <br />
        <br />
        <br />
        <div>
            <asp:GridView ID="GridView1" runat="server" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Vertical" AutoGenerateColumns="False" Height="89px" Width="358px">
                <AlternatingRowStyle BackColor="#DCDCDC" />
                <Columns>
                    <asp:BoundField HeaderText="Category Id" DataField=" CategoryID" />
                    <asp:BoundField HeaderText="Dish Id" DataField="  DishID " />
                    <asp:BoundField HeaderText="Dish Name" DataField="Dish_Name" />
                    <asp:BoundField DataField="Price" HeaderText="Price" SortExpression="Price" />
                    <asp:ImageField HeaderText="Image" DataImageUrlField="Image">
                    </asp:ImageField>
                    <asp:BoundField HeaderText="Category" DataField="Category_Name" />
                </Columns>
                <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
                <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />
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
