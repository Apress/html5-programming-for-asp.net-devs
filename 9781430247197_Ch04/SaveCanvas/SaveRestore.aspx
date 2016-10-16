<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SaveRestore.aspx.cs" Inherits="SaveCanvas.SaveRestore" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <script type="text/javascript" src="Script/jquery-1.7.2.min.js"></script>
    <script type="text/javascript" src="Script/modernizr-2.5.3.js"></script>
    <script type="text/javascript">
      $(document).ready(function () {
        if (!Modernizr.canvas) {
          alert("This browser doesn't support HTML5 Canvas!");
        }
        var canvas = $("#MyCanvas").get(0);
        var context = canvas.getContext("2d");

        context.lineWidth = 5;
        context.fillStyle = 'blue';
        context.fillRect(10, 10, 150, 50);
        context.lineWidth = 10;
        context.fillStyle = 'red';
        context.fillRect(20, 20, 150, 50);
        context.fillRect(30, 30, 150, 50);

        //default state
        context.lineWidth = 5;
        context.fillStyle = 'blue';
        context.fillRect(10, 120, 150, 50);
        context.save();
        //change state
        context.lineWidth = 10;
        context.fillStyle = 'red';
        context.fillRect(20, 130, 150, 50);
        //restore state
        context.restore();
        context.fillRect(30, 140, 150, 50);


      });
     </script>
    <style>
      canvas {
        border: 2px solid #808080;
      }
    </style>
</head>
<body>
    <form id="form1" runat="server">
      <canvas id="MyCanvas" height="200" width="200"></canvas>
    </form>
</body>
</html>
