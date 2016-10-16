<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CustomValidationMessages.aspx.cs" Inherits="CustomData.CustomValidationMessages" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script type="text/javascript" src="Scripts/jquery-1.7.2.min.js"></script>
    <script type="text/javascript" src="Scripts/modernizr-2.5.3.js"></script>

    <script type="text/javascript">
      $(document).ready(function () {

        $("input[value='Save']").click(function () {
          var birthDateTxtbox = $(this).closest('tr').children().eq(1).children().eq(0);
          var hireDateTxtbox = $(this).closest('tr').children().eq(2).children().eq(0);
          var birthDate = ToDate($(birthDateTxtbox).val());
          var hireDate = ToDate($(hireDateTxtbox).val());
          birthDate.setFullYear(birthDate.getFullYear() + 18);

          if ((hireDate.getTime() - birthDate.getTime()) < 0) {
            alert($(birthDateTxtbox).data('errorInvaliddate'));
            return;
          }

          //make $.ajax() request to update the database
          alert('Data saved!');
        });
      });

      function ToDate(input) {
        var parts = input.match(/(\d+)/g);
        return new Date(parts[0], parts[1] - 1, parts[2]);
      }

    </script>
</head>
<body>
    <form id="form1" runat="server">
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString='<%$ ConnectionStrings:NorthwindConnectionString %>'
      SelectCommand="SELECT * FROM [Employees]"></asp:SqlDataSource>
    <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1" 
      OnItemDataBound="Repeater1_ItemDataBound">
      <HeaderTemplate>
        <h3>List of Employees</h3>
        <table border="1" cellpadding="3">
          <tr>
            <th>Employee Name</th>
            <th>Birth Date</th>
            <th>Hire Date</th>
            <th>Save</th>
          </tr>
      </HeaderTemplate>
      <ItemTemplate>
        <tr id='<%# Eval("EmployeeID","emp{0}") %>' data-employeeid='<%# Eval("EmployeeID") %>'>
          <td><%# Eval("FirstName") %> <%# Eval("LastName") %></td>
          <td><asp:TextBox ID="txtBirthDate" runat="server" TextMode="Date" Text='<%# Eval("BirthDate") %>' data-error-invaliddate='<%# GetValidationMessage("INVALIDDATE") %>'></asp:TextBox></td>
          <td><asp:TextBox ID="txtHireDate" runat="server" TextMode="Date" Text='<%# Eval("HireDate") %>' data-error-nodata='<%# GetValidationMessage("INVALIDDATE") %>'></asp:TextBox></td>
          <td><input type="button" value="Save"/></td>
        </tr>
      </ItemTemplate>
      <FooterTemplate>
        </table>
      </FooterTemplate>
    </asp:Repeater>
    </form>
</body>
</html>
