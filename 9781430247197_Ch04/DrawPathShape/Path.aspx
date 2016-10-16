<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Path.aspx.cs" Inherits="DrawCurve.Path" %>

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
        context.beginPath();
        //face
        context.arc(100, 100, 80, 0, Math.PI * 2, false); 
        //smile
        context.moveTo(160, 100);
        context.arc(100, 100, 60, 0, Math.PI, false); 
        //left eye
        context.moveTo(75, 70);
        context.arc(65, 70, 10, 0, Math.PI * 2, true); 
        //right eye
        context.moveTo(135, 70);
        context.arc(125, 70, 10, 0, Math.PI * 2, true);
        context.stroke();

        context.lineWidth = 5;
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

