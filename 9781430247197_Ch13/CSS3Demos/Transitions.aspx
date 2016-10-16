<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Transitions.aspx.cs" Inherits="CSS3Demos.Transitions" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" type="text/css" href="StyleSheet.css" />
</head>
<body>
    <form id="form1" runat="server">
<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString='<%$ ConnectionStrings:NorthwindConnectionString %>'
      SelectCommand="SELECT * FROM [Employees] ORDER BY [EmployeeID]"></asp:SqlDataSource>

  <div class="employeeData">
  <asp:FormView ID="FormView1" runat="server" DataKeyNames="EmployeeID" DataSourceID="SqlDataSource1"
    AllowPaging="True">
    <ItemTemplate>
      <asp:Label Text='<%# Eval("EmployeeID") %>' runat="server" ID="EmployeeIDLabel" />.
      <asp:Label Text='<%# Bind("TitleOfCourtesy") %>' runat="server" ID="TitleOfCourtesyLabel" /> 
      <asp:Label Text='<%# Bind("FirstName") %>' runat="server" ID="FirstNameLabel" /> 
      <asp:Label Text='<%# Bind("LastName") %>' runat="server" ID="LastNameLabel" /> 
      (<asp:Label Text='<%# Bind("Title") %>' runat="server" ID="TitleLabel" />)<br />
      <asp:Label Text='<%# Bind("Notes") %>' runat="server" ID="NotesLabel" /><br />
    </ItemTemplate>
  </asp:FormView>
        </div>
 <br />
    </form>
</body>
</html>
