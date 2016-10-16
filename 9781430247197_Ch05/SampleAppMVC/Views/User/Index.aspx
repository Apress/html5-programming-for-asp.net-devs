<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage<SampleAppMVC.Models.User>"  %>

<!DOCTYPE html>

<html>
<head runat="server">
    <title>User Registration</title>
    <link rel="stylesheet" type="text/css" href="../../Content/Site.css" />
    <script src="<%= Url.Content("~/Scripts/jquery-1.6.2.js") %>" type="text/javascript"></script>
    <script type="text/javascript">
      $(document).ready(function () {
        $("input").bind("invalid",OnInvalid);

        $("#btnSubmit").click(function (evt) {
          $("#divErr").empty();
          if ($("#Email").val() != "") {
            var data = '{ "email" : "' + $("#Email").val() + '"}';
            $.ajax({
              url: '/User/IsDuplicateEmail',
              type: 'post',
              data: data,
              dataType: 'json',
              contentType: "application/json; charset=utf-8",
              async: false,
              success: function (result) {
                var email = $("#Email").get(0);
                if (result == true) {
                  $("#divErr").append("* Duplicate Email Address!<br/>");
                  //evt.preventDefault();
                }
              },
              error: function (err) { alert(err.status + " - " + err.statusText); }
            });
          }

        if ($("#DisplayName").val() != "") {
          var data = '{ "displayname" : "' + $("#DisplayName").val() + '"}';
          $.ajax({
            url: '/User/IsDuplicateDisplayName',
            type: 'post',
            data: data,
            dataType: 'json',
            contentType: "application/json; charset=utf-8",
            async: false,
            success: function (result) {
              var displayname = $("#DisplayName").get(0);
              if (result == true) {
                $("#divErr").append("* Duplicate Display Name!<br/>");
                //evt.preventDefault();
              }
            },
            error: function (err) { alert(err.status + " - " + err.statusText); }
          });
        }

          //password and confirm password matching
          if ($("#Password").val() != $("#ConfirmPassword").val()) {
            $("#divErr").append("Password mismatch!<br/>");
            evt.preventDefault();
          }
  
        });

      });

      function OnInvalid(evt) {
        var input = evt.target;
        var validity = input.validity;
        if (!validity.valid) {
          if (input.id == "DisplayName") { $("#divErr").append("* Please enter Display Name!<br/>"); }
          if (input.id == "Email") { $("#divErr").append("* Please enter Email Address!<br/>"); }
          if (input.id == "Password") { $("#divErr").append("* Please enter Password!<br/>"); }
          if (input.id == "ConfirmPassword") { $("#divErr").append("* Please enter Password Again!<br/>"); }
          if (input.id == "Age") {
            if (validity.valueMissing) {
              $("#divErr").append("* Please specify age!<br/>");
            }
            if (validity.rangeUnderflow) {
              $("#divErr").append("* Age must be between 18 and 100!<br/>");
            }
            if (validity.rangeOverflow) {
              $("#divErr").append("* Age must be between 18 and 100!<br/>");
            }
          }
        }
        evt.preventDefault();
      }
    </script>
</head>
<body>
  <h2>User Registration</h2>
  <% using (Html.BeginForm("Index","User","POST")) { %>
  <table cellpadding="5" cellspacing="0" class="style1" width="300px">
    <tr>
        <td nowrap="nowrap" width="5%" align="right">
            <%= Html.LabelFor(model => model.DisplayName)%>
        </td>
        <td width="50%">
            <%= Html.TextBoxFor(model=>model.DisplayName, new {required="required"})%>
            <%= Html.ValidationMessageFor(model=>model.DisplayName,"*")%>
        </td>
    </tr>
    <tr>
        <td nowrap="nowrap" width="5%" align="right">
            <%= Html.LabelFor(model=>model.Email)%>
        </td>
        <td width="50%">
            <%= Html.TextBoxFor(model=>model.Email, new {required="required",type="email"})%>
            <%= Html.ValidationMessageFor(model=>model.Email,"*")%>
        </td>
    </tr>
    <tr>
        <td nowrap="nowrap" width="5%" align="right">
            <%= Html.LabelFor(model=>model.Password)%>
        </td>
        <td width="50%">
            <%= Html.PasswordFor(model=>model.Password,new {required="required"})%>
            <%= Html.ValidationMessageFor(model=>model.Password,"*")%>
        </td>
    </tr>
    <tr>
        <td nowrap="nowrap" width="5%" align="right">
            <%= Html.Label("Confirm password")%>
        </td>
        <td width="50%">
            <%= Html.Password("ConfirmPassword", "",new {required="required"})%>
            <%= Html.ValidationMessage("ConfirmPassword","*")%>
        </td>
    </tr>
    <tr>
        <td nowrap="nowrap" width="5%" align="right">
            <%= Html.LabelFor(model=>model.BlogUrl)%>
        </td>
        <td width="50%">
            <%= Html.TextBoxFor(model=>model.BlogUrl, new {type="url"})%>
            <%= Html.ValidationMessageFor(model=>model.BlogUrl,"*")%>
        </td>
    </tr>
    <tr>
        <td nowrap="nowrap" width="5%" align="right">
            <%= Html.LabelFor(model=>model.Age)%>
        </td>
        <td width="50%">
            <%= Html.TextBoxFor(model=>model.Age, new {required="required",type="number",min="18",max="100"})%>
            <%= Html.ValidationMessageFor(model=>model.Age,"*")%>
        </td>
    </tr>
    <tr>
        <td nowrap="nowrap" width="5%" align="right">
            <%= Html.LabelFor(model=>model.Income)%>
        </td>
        <td width="50%">
            <%= Html.TextBoxFor(model=>model.Income, new {type="range",min="2",max="20",step="4"})%>
            <%= Html.ValidationMessageFor(model=>model.Income,"*")%>
        </td>
    </tr>
    <tr>
        <td nowrap="nowrap" width="5%"  valign="top" align="right">
            <%= Html.LabelFor(model=>model.Bio)%>
        </td>
        <td width="50%">
            <%= Html.TextAreaFor(model=>model.Bio, new {spellcheck="true",rows="3",cols="30"})%>
            <%= Html.ValidationMessageFor(model=>model.Bio,"*")%>
        </td>
    </tr>
    <tr>
        <td colspan="3" align="center">
          <input id="btnSubmit" type="submit" value="Submit" />
        </td>
    </tr>
    <tr>
        <td colspan="3" align="left">
          <%= Html.ValidationSummary() %>
          <div id="divErr" class="validation-summary-errors"></div>
        </td>
    </tr>
</table>
<%}%>
</body>
</html>
