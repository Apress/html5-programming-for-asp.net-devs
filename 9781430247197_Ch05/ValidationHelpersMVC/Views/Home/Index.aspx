<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<!DOCTYPE html>

<html>
<head runat="server">
  <title>Index</title>
  <link rel="stylesheet" type="text/css" href="../../Content/Site.css" />
</head>
<body>
<% using (Html.BeginForm()) { %>
<table cellpadding="3" cellspacing="0" class="style1">
    <tr>
        <td nowrap="nowrap" width="5%">
            <%= Html.Label("First Name :")%>
        </td>
        <td width="50%">
            <%= Html.TextBox("FirstName", "", new {required="required"})%>
            <%= Html.ValidationMessage("FirstName","*")%>
        </td>
    </tr>
    <tr>
        <td nowrap="nowrap" width="5%">
            <%= Html.Label("Last Name :")%>
        </td>
        <td width="50%">
            <%= Html.TextBox("LastName", "", new {required="required"})%>
            <%= Html.ValidationMessage("LastName","*")%>
        </td>
    </tr>
    <tr>
        <td nowrap="nowrap" width="5%">
            <%= Html.Label("Email Address :")%>
        </td>
        <td width="50%">
            <%= Html.TextBox("Email", "", new {type="email" })%>
            <%= Html.ValidationMessage("Email","*")%>
        </td>
    </tr>
</table>
<input id="Submit1" type="submit" value="Submit" />
<%= Html.ValidationSummary() %>
<%}%>
</body>
</html>
