<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ArcTo.aspx.cs" Inherits="DrawCurve.ArcTo" %>

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
        var x = 25;
        var y = 50;
        var width = 150;
        var height = 100;
        var radius = 20;
        context.lineWidth = 10;
        // top and top right corner
        context.moveTo(x + radius, y);
        context.arcTo(x + width, y, x + width, y + radius, radius);
        // right side and bottom right corner
        context.arcTo(x + width, y + height, x + width - radius, y + height, radius);
        // bottom and bottom left corner
        context.arcTo(x, y + height, x, y + height - radius, radius);
        // left and top left corner
        context.arcTo(x, y, x + radius, y, radius);
        context.stroke();
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

