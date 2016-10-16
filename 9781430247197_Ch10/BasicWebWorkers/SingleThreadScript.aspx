<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SingleThreadScript.aspx.cs" Inherits="BasicWebWorkers.SingleThreadScript" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script type="text/javascript" src="Scripts/jquery-1.7.2.min.js"></script>
    <script type="text/javascript">
      $(document).ready(function () {
        $("#button1").click(function () {
          alert("Processing started!");
          var date = new Date();
          var currentDate = null;
          do {
            currentDate = new Date();
          }
          while (currentDate - date < 10000);
          alert("Processing done!");
        });
      });
    </script>
</head>
<body>
    <form id="form1" runat="server">
      <input id="button1" type="button" value="Click" />
      <div id="div1"></div>
      <p>Sample Text</p>
      <p>Sample Text</p>
      <p>Sample Text</p>
      <p>Sample Text</p>
      <p>Sample Text</p>
      <p>Sample Text</p>
      <p>Sample Text</p>
      <p>Sample Text</p>
      <p>Sample Text</p>
      <p>Sample Text</p>
      <p>Sample Text</p>
      <p>Sample Text</p>
      <p>Sample Text</p>
      <p>Sample Text</p>
      <p>Sample Text</p>
      <p>Sample Text</p>
      <p>Sample Text</p>
      <p>Sample Text</p>
      <p>Sample Text</p>
      <p>Sample Text</p>
      <p>Sample Text</p>

    </form>
</body>
</html>
