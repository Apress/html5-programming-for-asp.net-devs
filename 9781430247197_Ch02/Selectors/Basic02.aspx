<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Basic02.aspx.cs" Inherits="Example_02.WebForm2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
  <title></title>
  <script type="text/javascript" src="Scripts/jquery-1.7.2.min.js"></script>
  <link rel="stylesheet" type="text/css" href="StyleSheet.css" />
  <script type="text/javascript">
    $(document).ready(function () {
      $("#GridView1 th").parent().addClass("HeaderRow");
      $("#GridView1 tr:not(.HeaderRow):odd").addClass("Row");
      $("#GridView1 tr:not(.HeaderRow):even").addClass("AlternateRow");
      $("#GridView1 tr:not(.HeaderRow)").hover(function () {
        $(this).addClass('HoverRow');
      }, function () {
        $(this).removeClass('HoverRow');
      }).click(function () {
        if ($(this).hasClass("HeaderRow")) {
          alert("This is header row. Can't get EmployeeID!");
        }
        else {
          alert("You selected Employee ID :" + $("td:first", this).text());
        }
      });
    });
  </script>

</head>
<body>
    <form id="form1" runat="server">
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString='<%$ ConnectionStrings:NorthwindConnectionString %>'
      SelectCommand="SELECT [EmployeeID], [LastName], [FirstName], [City] FROM [Employees]">
    </asp:SqlDataSource>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="EmployeeID"
      DataSourceID="SqlDataSource1" CellPadding="6" BorderStyle="Solid" 
      BorderWidth="0px" GridLines="None">
      <Columns>
        <asp:BoundField DataField="EmployeeID" HeaderText="EmployeeID" ReadOnly="True" InsertVisible="False"
          SortExpression="EmployeeID"></asp:BoundField>
        <asp:BoundField DataField="FirstName" HeaderText="FirstName" SortExpression="FirstName">
        </asp:BoundField>
        <asp:BoundField DataField="LastName" HeaderText="LastName" SortExpression="LastName">
        </asp:BoundField>
        <asp:BoundField DataField="City" HeaderText="City" SortExpression="City"></asp:BoundField>
      </Columns>
    </asp:GridView>
    </form>
</body>
</html>
