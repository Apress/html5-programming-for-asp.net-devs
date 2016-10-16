<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Shadow.aspx.cs" Inherits="SpecialEffects.Shadow" %>

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

        context.shadowColor = "#808080";
        context.shadowBlur = 5;
        context.shadowOffsetX = 10;
        context.shadowOffsetY = 10;
        context.fillRect(20, 20, 150, 80);

        context.shadowColor = "red";
        context.shadowBlur = 15;
        context.shadowOffsetX = -5;
        context.shadowOffsetY = 5;
        context.fillStyle = "blue";
        context.textAlign = "center";
        context.font = "bold 30px Arial";
        context.fillText("Hello Canvas!",100,150);
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
