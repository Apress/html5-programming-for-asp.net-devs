<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<!DOCTYPE html>

<html>
<head runat="server">
    <meta name="viewport" content="width=device-width" />
    <title>Index</title>
</head>
<body>
<form method="post" action="/Home/Index">
  <span id="Label1" class="label">Enter your Name : </span>
  <br />
  <input name="TextBox1" type="text" id="TextBox1"/>
  <br /><br />
  <input type="submit" name="Button1" value="Submit" id="Button1" />
</form>

</body>
</html>
