<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CustomerForm.aspx.cs" Inherits="XmlHttpRequest.CustomerForm" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script type="text/javascript" src="jquery-1.7.2.min.js"></script>
    <script type="text/javascript" src="modernizr-2.5.3.js"></script>

    <script type="text/javascript">
      $(document).ready(function () {
        GetCustomers();
      });

      function GetCustomers() {
        $("#tblCustomers").empty();
        $("#tblCustomers").append("<tr><th>CustomerID</th><th>Company Name</th><th>Contact Name</th><th>Country</th><th>Actions</th></tr>");
        var emptyRow = "<tr>";
        emptyRow += "<td><input size='5' type='text'/></td>";
        emptyRow += "<td><input type='text'/></td>";
        emptyRow += "<td><input type='text'/></td>";
        emptyRow += "<td><input type='text'/></td>";
        emptyRow += "<td><input type='button' value='Insert'/></td>";
        emptyRow += "</tr>";
        $("#tblCustomers").append(emptyRow);

        var xhr = new XMLHttpRequest();
        xhr.open("GET", "api/Customer");
        xhr.setRequestHeader('Accept', 'application/json');
        xhr.setRequestHeader('Content-Type', 'application/json');
        xhr.onreadystatechange= function () {
          if (xhr.readyState == 4) {
            var data = JSON.parse(xhr.responseText);
            for (var i = 0; i < data.length; i++) {
              var row = "<tr>";
              row += "<td><input size='5' type='text' value='" + data[i].CustomerID + "' readonly='readonly'/></td>";
              row += "<td><input type='text' value='" + data[i].CompanyName + "'/></td>";
              row += "<td><input type='text' value='" + data[i].ContactName + "'/></td>";
              row += "<td><input type='text' value='" + data[i].Country + "'/></td>";
              row += "<td><input type='button' value='Update'/>";
              row += "<input type='button' value='Delete'/></td>";
              row += "</tr>";
              $("#tblCustomers").append(row);
            }
            $("#tblCustomers input[value='Insert']").click(InsertCustomer);
            $("#tblCustomers input[value='Update']").click(UpdateCustomer);
            $("#tblCustomers input[value='Delete']").click(DeleteCustomer);
          }
        }
        xhr.send();
      }

      function InsertCustomer(evt) {
        var customerID = $(this).closest('tr').children().eq(0).children().eq(0).val();
        var companyName = $(this).closest('tr').children().eq(1).children().eq(0).val();
        var contactName = $(this).closest('tr').children().eq(2).children().eq(0).val();
        var country = $(this).closest('tr').children().eq(3).children().eq(0).val();
        var obj = { "CustomerID": customerID, "CompanyName": companyName, "ContactName": contactName, "Country": country };

        var xhr = new XMLHttpRequest();
        xhr.open("POST", "api/Customer");
        xhr.setRequestHeader('Content-Type', 'application/json');
        xhr.onreadystatechange = function () {
          if (xhr.readyState == 4) {
            alert("Customer Inserted!");
            GetCustomers();
          }
        }
        var param = JSON.stringify(obj);
        xhr.send(param);
      }

      function UpdateCustomer(evt) {
        var customerID=$(this).closest('tr').children().eq(0).children().eq(0).val();
        var companyName =$(this).closest('tr').children().eq(1).children().eq(0).val();
        var contactName = $(this).closest('tr').children().eq(2).children().eq(0).val();
        var country = $(this).closest('tr').children().eq(3).children().eq(0).val();
        var obj = { "CustomerID": customerID, "CompanyName": companyName, "ContactName": contactName, "Country": country };

        var xhr = new XMLHttpRequest();
        xhr.open("PUT", "api/Customer/" + customerID);
        xhr.setRequestHeader('Content-Type', 'application/json; charset=utf-8');
        xhr.onreadystatechange = function () {
          if (xhr.readyState == 4) {
            alert("Customer Updated!");
          }
        }
        var param = JSON.stringify(obj);
        xhr.send(param);
      }

      function DeleteCustomer(evt) {
        var customerID = $(this).closest('tr').children().eq(0).children().eq(0).val();
        var xhr = new XMLHttpRequest();
        xhr.open("DELETE", "api/Customer/" + customerID);
        xhr.setRequestHeader('Content-Type', "application/x-www-form-urlencoded");
        xhr.onreadystatechange = function () {
          if (xhr.readyState == 4) {
            alert("Customer Deleted!");
            GetCustomers();
          }
        }
        xhr.send();
      }

    </script>

    <style type="text/css">
      .auto-style1 {
        width: 100%;
      }
    </style>
</head>
<body>
    <h3>Customer List</h3>
    <form id="form1" runat="server">
    <table id="tblCustomers">
    </table>
    </form>
</body>
</html>

