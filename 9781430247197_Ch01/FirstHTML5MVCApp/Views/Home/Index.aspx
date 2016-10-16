<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<!DOCTYPE html>
<html>
<head runat="server">
  <meta name="viewport" content="width=device-width" />
  <title>Index</title>
  <script type="text/javascript" src="../../Scripts/jquery-1.6.2.min.js"></script>
  <script type="text/javascript" src="../../Scripts/modernizr-2.0.6-development-only.js"></script>
  <script type="text/javascript">
    $(document).ready(function () {
      if (!Modernizr.canvas) {
        alert('Your browser does not support the HTML5 canvas tag.');
      }
      $("#Button1").click(function () {
        var canvas = document.getElementById('myCanvas');
        var context = canvas.getContext("2d");
        context.fillStyle = 'silver';
        context.fillRect(0, 0, 500, 200);
        context.fillStyle = 'Black';
        context.lineWidth = 10;
        context.font = '20pt Arial';
        var x = canvas.width / 2;
        var y = canvas.height / 2;
        context.textAlign = "center";
        context.fillText($("#Text1").val(), x, y);
      });

      $("#Button2").click(function () {
        var data = '{ "data" : "' + $("#Text1").val() + '"}';
        $.ajax({
          type: "POST",
          url: '/home/SaveCanvas',
          data: data,
          contentType: "application/json; charset=utf-8",
          dataType: "json",
          success: function (result) {
            alert(result);
          },
          error: function (err) {
            alert(err.status + " - " + err.statusText);
          }
        })
      });

    });

  </script>
</head>
<body>
  <span>Enter Text : </span>
  <input type="text" id="Text1" value="<%= Session["canvas_data"] %>" required />
  <input type="button" id="Button1" value="Draw" />
  <input type="button" id="Button2" value="Save" />
  <br />
  <br />
  <canvas id="myCanvas" width="500" height="200"></canvas>
</body>
</html>
