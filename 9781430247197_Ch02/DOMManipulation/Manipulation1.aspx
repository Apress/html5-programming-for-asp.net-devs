<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Manipulation1.aspx.cs" Inherits="Chapter02.Manipulation.Manipulation1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
  <title></title>
  <script type="text/javascript" src="../Scripts/jquery-1.7.2.min.js"></script>
  <script type="text/javascript">
    $(document).ready(function () {

      $("#container").append("<div>Hello</div>");
      $("<div>Hello</div>").appendTo("#container");
      $("span").replaceWith("<div class='class1'>Hello Universe!</div>");
      $("<div class='class2'>Hello World!</div>").replaceAll("div.class1");

      alert($("#box").html());
    });
  </script>
</head>
<body>
    <form id="form1" runat="server">
      <div id="container"></div>
      <div id="box">
      <span>Hello World!</span>
      <div class="class1">Hello World!</div>
      </div>
    </form>
</body>
</html>
