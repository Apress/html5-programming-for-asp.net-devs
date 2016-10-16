<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SaveAsServerSideImg.aspx.cs" Inherits="SaveCanvas.SaveAsServerSideImg" %>

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
        context.fillRect(20, 20, 160, 160);

        $('#btnSave').click(function () {
          var data = canvas.toDataURL();
          data = data.replace('data:image/png;base64,', '');
          alert(data);
          $.ajax({
            type: 'POST',
            url: '/SaveAsServerSideImg.aspx/SaveAsImageFile',
            data: '{ "data" : "' + data + '" }',
            contentType: 'application/json; charset=utf-8',
            dataType: 'json',
            success: function (msg) {
              alert('Image saved on the server!');
            }
          });
        });


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
      <br /><br />
      <input id="btnSave" type="button" value="Save As Server Side Image" />
    </form>
</body>
</html>

