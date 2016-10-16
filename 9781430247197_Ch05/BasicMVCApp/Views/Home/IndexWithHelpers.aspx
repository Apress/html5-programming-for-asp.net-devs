<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<!DOCTYPE html>

<html>
<head runat="server">
    <meta name="viewport" content="width=device-width" />
    <title>IndexWithHelpers</title>
</head>
<body>
  <% using(Html.BeginForm("IndexWithHelpers","Home","POST")) %>
  <% { %>
  <%= Html.Label("Enter your Name :") %>
  <br />
  <%= Html.TextBox("txtName") %>
  <br /><br />
  <input type="submit" value="Submit" />
  <% } %>
</body>
</html>
