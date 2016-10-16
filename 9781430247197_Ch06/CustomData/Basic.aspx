<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Basic.aspx.cs" Inherits="CustomData.Basic" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script type="text/javascript" src="Scripts/jquery-1.7.2.min.js"></script>
    <script type="text/javascript" src="Scripts/modernizr-2.5.3.js"></script>

  <script type="text/javascript">

    $(document).ready(function () {
      /*
      //Using JavaScript getAttribute() and setAttribute()
      var emp = document.getElementById('emp1');
      alert('Employee ID : ' + emp.getAttribute('data-employeeid'));
      alert('Title : ' + emp.getAttribute('data-title'));
      emp.setAttribute('data-employeeid', '100');
      emp.setAttribute('data-title', 'Senior Manager');
      alert('New Employee ID : ' + emp.getAttribute('data-employeeid'));
      alert('New Title : ' + emp.getAttribute('data-title'));

      //using dataset property
      var emp = document.getElementById('emp1');
      alert('Employee ID : ' + emp.dataset.employeeid);
      alert('Title : ' + emp.dataset.title);
      emp.dataset.employeeid = '200';
      emp.dataset.title = 'Junior Manager';
      alert('New Employee ID : ' + emp.dataset.employeeid);
      alert('New Title : ' + emp.dataset.title);

      //Using camel casing
      var emp = document.getElementById('emp1');
      alert('Employee ID : ' + emp.dataset.employeeBirthdate);
      */

      //Using jQuery
      alert('Employee ID : ' + $("#emp1").data('employeeid'));
      alert('Title : ' + $("#emp1").data('title'));

      $("#emp1").data('employeeid', '100');
      $("#emp1").data('title', 'Senior Manager');

      alert('Employee ID : ' + $("#emp1").data('employeeid'));
      alert('Title : ' + $("#emp1").data('title'));
      alert('Title : ' + $("#emp1").data('employeeBirthdate'));

      var obj = $("#emp1").data();
      alert('Employee ID : ' + obj.employeeid);
      alert('Title : ' + obj.title);
      alert('Birth Date : ' + obj.employeeBirthdate);


    });


  </script>

</head>
<body>
    <form id="form1" runat="server">
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString='<%$ ConnectionStrings:NorthwindConnectionString %>'
      SelectCommand="SELECT * FROM [Employees]"></asp:SqlDataSource>
    <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1">
      <HeaderTemplate>
        <table border="1" cellpadding="3">
      </HeaderTemplate>
      <ItemTemplate>
        <tr id='<%# Eval("EmployeeID","emp{0}") %>' data-employeeid='<%# Eval("EmployeeID") %>' data-title='<%# Eval("Title") %>' data-employee-birthdate='<%# Eval("BirthDate") %>'>
          <td><%# Eval("FirstName") %></td>
          <td><%# Eval("LastName") %></td>
        </tr>
      </ItemTemplate>
      <FooterTemplate>
        </table>
      </FooterTemplate>
    </asp:Repeater>
    </form>
</body>
</html>
