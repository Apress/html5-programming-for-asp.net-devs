<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<!DOCTYPE html>

<html>
<head runat="server">
    <title>Index</title>
    <script type="text/javascript" src="../../Scripts/jquery-1.6.2.min.js"></script>
    <script type="text/javascript">
      $(document).ready(function () {
        $("#btnSubmit").click(OnSubmit);
      });
      function OnSubmit(evt) {
        $.ajax({
            url: '/home/ValidateCustomerID',
            type:'post',
            data: { id: $("#txtCustId").val() },
            dataType: 'json',
            async:false,
            success: function (result) {
              var textbox = $("#txtCustId").get(0);
              if (result == false) {
                textbox.setCustomValidity("Customer ID was not found in the database!");
              }
              else {
                textbox.setCustomValidity("");
              }
            }
          });
      }
    </script>
</head>
<body>
  <form id="form1">
    <label for="txtCustId">Enter Customer ID :</label><br />
    <input id="txtCustId" type="text" /><br />
    <input id="btnSubmit" type="submit" value="Submit"/>
  </form>
</body>
</html>
