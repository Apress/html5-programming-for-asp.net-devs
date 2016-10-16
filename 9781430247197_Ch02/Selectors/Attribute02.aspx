<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Attribute02.aspx.cs" Inherits="Example_03.WebForm2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script type="text/javascript" src="Scripts/jquery-1.7.2.min.js"></script>

<script type="text/javascript">
      $(document).ready(function () {
        $("#DropDownList1").change(function () {
          switch ($("#DropDownList1").val()) {
            case "A":
              $("#GridView1 tr a").parent().css("display", "block");
              break;
            case "P":
              $("#GridView1 tr a[href *= 'products/']").parent().css("display", "block");
              $("#GridView1 tr a[href |= 'Paper']").parent().css("display", "none");
              $("#GridView1 tr a[href $= '-comp.zip']").parent().css("display", "none");
              break;
            case "WP":
              $("#GridView1 tr a[href *= 'products/']").parent().css("display", "none");
              $("#GridView1 tr a[href |= 'Paper']").parent().css("display", "block");
              $("#GridView1 tr a[href $= '-comp.zip']").parent().css("display", "none");
              break;
            case "C":
              $("#GridView1 tr a[href *= 'products/']").parent().css("display", "none");
              $("#GridView1 tr a[href |= 'Paper']").parent().css("display", "none");
              $("#GridView1 tr a[href $= '-comp.zip']").parent().css("display", "block");
              break;
          }
        })
      })
    </script>

</head>
<body>
    <form id="form1" runat="server">
    <span><strong>Show :</strong></span><br />
    <asp:DropDownList ID="DropDownList1" runat="server">
        <asp:ListItem Value="A">All Downloads</asp:ListItem>
        <asp:ListItem Value="P">Products</asp:ListItem>
        <asp:ListItem Value="WP">White Papers</asp:ListItem>
        <asp:ListItem Value="C">Components</asp:ListItem>
    </asp:DropDownList>
    <br /><br />
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
      CellPadding="6" ForeColor="#333333" GridLines="None" Width="100%" 
      BorderColor="#003300" BorderStyle="Solid" BorderWidth="1px">
      <AlternatingRowStyle BackColor="White" />
      <Columns>
        <asp:HyperLinkField DataNavigateUrlFields="URL" DataTextField="Title" 
          HeaderText="Downloads" />
      </Columns>
      <EditRowStyle BackColor="#7C6F57" />
      <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
      <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
      <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
      <RowStyle BackColor="#E3EAEB" />
      <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
      <SortedAscendingCellStyle BackColor="#F8FAFA" />
      <SortedAscendingHeaderStyle BackColor="#246B61" />
      <SortedDescendingCellStyle BackColor="#D4DFE1" />
      <SortedDescendingHeaderStyle BackColor="#15524A" />
    </asp:GridView>
    </form>
</body>
</html>
