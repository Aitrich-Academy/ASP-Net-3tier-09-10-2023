<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AboutUs.aspx.cs" Inherits="MiniProject.AboutUs" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="Style/AboutUssheet.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
      <div class="label1">   
          <div>
          <asp:Image ID="Image1" runat="server"  CssClass="logo-1" src="Image/Logo.png" Height="116px" Width="363px"/>    

              <br />

          </div>  
            
               <asp:Label ID="Label1" runat="server"  Text="There are many variations of passages of Lorem Ipsum available, 
but the majority have suffered alteration in some form, 
by injected humour, or randomized words which don't look even slightly believable. 
If you are going to use a passage of Lorem Ipsum, 
you need to be sure there isn't anything embarrassing hidden in the middle of text."></asp:Label>   
            <br />
            <br />
                
            <asp:Button ID="Button1" runat="server" Text="Read More" CssClass="read-more "  />       

           
            

</div>
    </form>
</body>
</html>
