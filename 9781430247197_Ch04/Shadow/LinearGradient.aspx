<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LinearGradient.aspx.cs" Inherits="SpecialEffects.LinearGradient" %>

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
        //var linearGradient = context.createLinearGradient(0, 100, 200, 100);
        var linearGradient = context.createLinearGradient(50, 10, 200, 100);
        linearGradient.addColorStop(0, "blue");
        linearGradient.addColorStop(0.5, "green");
        linearGradient.addColorStop(1, "red");
        context.fillStyle = linearGradient;
        context.fillRect(0, 0, 200, 200);

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

