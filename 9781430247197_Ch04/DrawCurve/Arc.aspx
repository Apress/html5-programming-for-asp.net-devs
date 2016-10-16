<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Arc.aspx.cs" Inherits="DrawCurve.Arc" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
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
        var x = canvas.width / 2;
        var y = canvas.height / 2;
        var radius = 100;
        var start_angle = 0.5 * Math.PI;
        var end_angle = 1.75 * Math.PI;
        context.arc(x, y, 75, start_angle, end_angle, false);
        context.lineWidth = 20;
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
