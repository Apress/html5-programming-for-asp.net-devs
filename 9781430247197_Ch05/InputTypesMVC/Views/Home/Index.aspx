<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<!DOCTYPE html>

<html>
<head runat="server">
    <title>Index</title>
</head>
<body>
  <form method="post" action="/Home/Index">
    <%= Html.Label("Enter your age :") %>
    <br />
    <%= Html.TextBox("txtNumber","18",new {type="number",min="18",max="100"}) %>
   
  </form>
</body>
</html>
