<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Basic01.aspx.cs" Inherits="Selectors.Basic01" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
  <title></title>
  <script type="text/javascript" src="Scripts/jquery-1.7.2.min.js"></script>
  
  <script>
    $(document).ready(function () {
      $("#myDiv").html("<h1>Hello jQuery !</h1>");
      $("div").css("background-color", "#ded8d8");
      $(".MyClass").text("We have the same CSS class!");
    })
  </script>

  <style>
    .MyClass {
      padding: 10px;
      border: 2px solid black;
    }
  </style>
</head>
<body>
  <form id="form1" runat="server">
    <div id="myDiv"></div>
    <div></div>
    <div class="MyClass"></div>
    <br />
    <div class="MyClass"></div>
  </form>
</body>
</html>
