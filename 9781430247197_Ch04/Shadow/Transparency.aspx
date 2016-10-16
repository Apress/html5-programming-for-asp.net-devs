<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Transparency.aspx.cs" Inherits="SpecialEffects.Transparency" %>

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

        context.fillStyle = "black";
        context.fillRect(20, 20, 150, 80);
        context.fillStyle = "rgb(255, 0, 0)";
        context.fillRect(40, 40, 150, 80);

        context.fillStyle = "black";
        context.fillRect(20, 150, 150, 80);
        context.fillStyle = "rgba(255, 0, 0,0.5)";
        context.fillRect(40, 170, 150, 80);

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
      <canvas id="MyCanvas" height="300" width="200"></canvas>
    </form>
</body>
</html>
