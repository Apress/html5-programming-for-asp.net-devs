<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EmployeeForm.aspx.cs" Inherits="SampleAppWebForms.EmployeeForm" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
  <title></title>
  <link rel="stylesheet" type="text/css" href="StyleSheet.css" />
  <script type="text/javascript" src="Scripts/jquery-1.7.2.min.js"></script>
  <script type="text/javascript">
    $(document).ready(function () {
      $.ajax({
        url: 'employeeform.aspx/GetTitles',
        type: 'post',
        dataType: 'json',
        contentType: "application/json; charset=utf-8",
        success: function (results) {
          for (var i = 0; i < results.d.length; i++) {
            $("#lstTitles").append("<option label='" + results.d[i] + "' value='" + results.d[i] + "'></option>");
          }
        },
        error: function (err) { alert(err.status + " - " + err.statusText); }
      });

      $("input[name$='btnUpdate']").click(function (e) {
        var birthDate = ToDate($("input[name$='txtBirthDate']").val());
        birthDate.setFullYear(birthDate.getFullYear() + 18);
        var hireDate = ToDate($("input[name$='txtHireDate']").val());

        var txtBirthDate = $("input[name$='txtBirthDate']").get(0);
        if ((hireDate.getTime() - birthDate.getTime()) < 0) {
          txtBirthDate.setCustomValidity("Invalid Birth Date or Hire Date!");
        }
        else {
          txtBirthDate.setCustomValidity("");
        }
        var pattern = /^\(?(\d{3})\)?[- ]?(\d{3})[- ]?(\d{4})$/;
        var value = $("input[name$='txtPhone']").val();
        var txtPhone = $("input[name$='txtPhone']").get(0);
        if (!pattern.test(value)) {
          txtPhone.setCustomValidity("Invalid Telephone Number!");
        }
        else {
          txtPhone.setCustomValidity("");
        }
      });

      $("input[name$='btnInsert']").click(function (e) {
        var birthDate = ToDate($("input[name$='txtBirthDate']").val());
        birthDate.setFullYear(birthDate.getFullYear() + 18);
        var hireDate = ToDate($("input[name$='txtHireDate']").val());

        var txtBirthDate = $("input[name$='txtBirthDate']").get(0);
        if ((hireDate.getTime() - birthDate.getTime()) < 0) {
          txtBirthDate.setCustomValidity("Invalid Birth Date or Hire Date!");
        }
        else {
          txtBirthDate.setCustomValidity("");
        }
        var pattern = /^\(?(\d{3})\)?[- ]?(\d{3})[- ]?(\d{4})$/;
        var value = $("input[name$='txtPhone']").val();
        var txtPhone = $("input[name$='txtPhone']").get(0);
        if (!pattern.test(value)) {
          txtPhone.setCustomValidity("Invalid Telephone Number!");
        }
        else {
          txtPhone.setCustomValidity("");
        }
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
    <h1>Employee Data Entry</h1>
    <asp:FormView ID="FormView1" runat="server" 
      SelectMethod="GetEmployees" 
      InsertMethod="InsertEmployee"
      UpdateMethod="UpdateEmployee"
      DeleteMethod="DeleteEmployee"

      ItemType="SampleAppWebForms.Model.Employee" Width="100%" AllowPaging="True" 
      CellPadding="3" DefaultMode="Edit" OnDataBound="FormView1_DataBound" 
      OnItemUpdating="FormView1_ItemUpdating" DataKeyNames="EmployeeID"
      >
      <EditItemTemplate>
        <fieldset>
          <legend>Basic Details</legend>
          <label for="FullName">Full Name :</label><br />
          <asp:DropDownList ID="DropDownList1" runat="server" SelectedValue='<%# BindItem.TitleOfCourtesy %>'>
            <asp:ListItem>Mr.</asp:ListItem>
            <asp:ListItem>Mrs.</asp:ListItem>
            <asp:ListItem>Ms.</asp:ListItem>
            <asp:ListItem>Dr.</asp:ListItem>
          </asp:DropDownList>
          <asp:TextBox ID="txtFirstName" runat="server" required="required" Text="<%# BindItem.FirstName %>" CssClass="textbox" PlaceHolder="First Name" autofocus="autofocus"></asp:TextBox>
          <asp:TextBox ID="txtLastName" runat="server" required="required" Text="<%# BindItem.LastName %>" CssClass="textbox" PlaceHolder="Last Name"></asp:TextBox>
          <br />
          <label for="txtBirthDate">Birth Date :</label><br />
          <asp:TextBox ID="txtBirthDate" runat="server" TextMode="Date" required="required" Text="<%# BindItem.BirthDate %>" CssClass="textbox" PlaceHolder="Birth Date" ></asp:TextBox>
        </fieldset>

        <fieldset>
          <legend>Employment Details</legend>
          <label for="lblEmployeeID">Employee ID :</label>
          <asp:Label ID="lblEmployeeID" runat="server" Text="<%# BindItem.EmployeeID %>"></asp:Label>
          <br />
          <label for="txtDesig">Current Designation :</label><br />
          <asp:TextBox ID="txtDesig" runat="server" Columns="50" required="required" Text="<%# BindItem.Title %>" CssClass="textbox" PlaceHolder="Designation" list="lstTitles"></asp:TextBox>
          <datalist id="lstTitles"></datalist>
          <br />
          <label for="txtHireDate">Hire Date :</label>
          <br />
          <asp:TextBox ID="txtHireDate" runat="server" TextMode="Date" required="required" Text='<%# BindItem.HireDate %>' CssClass="textbox" PlaceHolder="Hire Date" ></asp:TextBox>
        </fieldset>

        <fieldset>
          <legend>Contact Details</legend>
          <label for="address">Address :</label><br />
          <asp:TextBox ID="txtAddress" runat="server" TextMode="MultiLine" Columns="50" required="required" Text="<%# BindItem.Address %>" CssClass="textbox" PlaceHolder="Street Address"></asp:TextBox>
          <br />
          <asp:TextBox ID="txtCity" runat="server" required="required" Text='<%# BindItem.City %>' CssClass="textbox" PlaceHolder="City" ></asp:TextBox>
          <br />
          <asp:TextBox ID="txtCountry" runat="server" required="required" Text='<%# BindItem.Country %>' CssClass="textbox" PlaceHolder="Country" ></asp:TextBox>
          <br />
          <asp:TextBox ID="txtPostalCode" runat="server" pattern="\d{5}(-\d{4})?" required="required" Text='<%# BindItem.PostalCode %>' CssClass="textbox" PlaceHolder="Postal Code" ></asp:TextBox>
          <br />
          <label for="txtPhone">Home Phone :</label><br />
          <asp:TextBox ID="txtPhone" runat="server" TextMode="Phone" Text='<%# BindItem.HomePhone %>' CssClass="textbox" PlaceHolder="(123) 123-1234" ></asp:TextBox>
        </fieldset>

        <asp:Button ID="btnUpdate" runat="server" Text="Save" CommandName="Update" CssClass="button" />
        <asp:Button ID="btnNew" runat="server" Text="Add New" CommandName="New" CssClass="button" formnovalidate="formnovalidate" />
        <asp:Button ID="btnDelete" runat="server" Text="Delete" CommandName="Delete" CssClass="button" formnovalidate="formnovalidate" />
      </EditItemTemplate>

      <InsertItemTemplate>
        <fieldset>
          <legend>Basic Details</legend>
          <label for="FullName">Full Name :</label><br />
          <asp:DropDownList ID="DropDownList1" runat="server" SelectedValue='<%# BindItem.TitleOfCourtesy %>'>
            <asp:ListItem>Mr.</asp:ListItem>
            <asp:ListItem>Mrs.</asp:ListItem>
            <asp:ListItem>Ms.</asp:ListItem>
            <asp:ListItem>Dr.</asp:ListItem>
          </asp:DropDownList>
          <asp:TextBox ID="txtFirstName" runat="server" required="required" Text="<%# BindItem.FirstName %>" CssClass="textbox" PlaceHolder="First Name"></asp:TextBox>
          <asp:TextBox ID="txtLastName" runat="server" required="required" Text="<%# BindItem.LastName %>" CssClass="textbox" PlaceHolder="Last Name"></asp:TextBox>
          <br />
          <label for="txtBirthDate">Birth Date :</label><br />
          <asp:TextBox ID="txtBirthDate" runat="server" TextMode="Date" required="required" Text="<%# BindItem.BirthDate %>" CssClass="textbox" PlaceHolder="Birth Date" ></asp:TextBox>
        </fieldset>

        <fieldset>
          <legend>Employment Details</legend>
          <label for="lblEmployeeID">Employee ID :</label>
          <asp:Label ID="lblEmployeeID" runat="server" Text="<%# BindItem.EmployeeID %>"></asp:Label>
          <br />
          <label for="txtDesig">Current Designation :</label><br />
          <asp:TextBox ID="txtDesig" runat="server" Columns="50" required="required" Text="<%# BindItem.Title %>" CssClass="textbox" PlaceHolder="Designation" list="lstTitles"></asp:TextBox>
          <datalist id="lstTitles"></datalist>
          <br />
          <label for="txtHireDate">Hire Date :</label>
          <br />
          <asp:TextBox ID="txtHireDate" runat="server" TextMode="Date" required="required" Text='<%# BindItem.HireDate %>' CssClass="textbox" PlaceHolder="Hire Date" ></asp:TextBox>
        </fieldset>

        <fieldset>
          <legend>Contact Details</legend>
          <label for="address">Address :</label><br />
          <asp:TextBox ID="txtAddress" runat="server" TextMode="MultiLine" Rows="3" Columns="50" required="required" Text="<%# BindItem.Address %>" CssClass="textbox" PlaceHolder="Street Address"></asp:TextBox>
          <br />
          <asp:TextBox ID="txtCity" runat="server" required="required" Text='<%# BindItem.City %>' CssClass="textbox" PlaceHolder="City" ></asp:TextBox>
          <br />
          <asp:TextBox ID="txtCountry" runat="server" required="required" Text='<%# BindItem.Country %>' CssClass="textbox" PlaceHolder="Country" ></asp:TextBox>
          <br />
          <asp:TextBox ID="txtPostalCode" runat="server" pattern="\d{5}(-\d{4})?" required="required" Text='<%# BindItem.PostalCode %>' CssClass="textbox" PlaceHolder="Postal Code" ></asp:TextBox>
          <br />
          <label for="txtPhone">Home Phone :</label><br />
          <asp:TextBox ID="txtPhone" runat="server" TextMode="Phone" Text='<%# BindItem.HomePhone %>' CssClass="textbox" PlaceHolder="(123) 123-1234" ></asp:TextBox>
        </fieldset>

        <asp:Button ID="btnInsert" runat="server" Text="Save" CommandName="Insert" CssClass="button" />
        <asp:Button ID="btnCancel" runat="server" Text="Cancel" CommandName="Cancel" CssClass="button" formnovalidate="formnovalidate" />
      </InsertItemTemplate>

    </asp:FormView>
    </form>
</body>
</html>

