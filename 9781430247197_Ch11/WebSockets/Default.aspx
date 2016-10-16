<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="WebSocketDemo.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script type="text/javascript" src="jquery-1.7.2.min.js"></script>
    <script type="text/javascript" src="modernizr-2.5.3.js"></script>

    <script type="text/javascript">
      $(document).ready(function () {
        $("#btnSend").click(function () {
          alert('1');
          var socket = new WebSocket("ws://localhost:1046/WebSocketGenericHandler.ashx");
          alert(socket);
          socket.onmessage = function (evt) {
            $("#divHistory").append(evt.data);
          };
          socket.send($("#txtMsg").val());
        });
      });
    </script>
</head>
<body>
    <form id="form1" runat="server">
      <input type="text" id="txtMsg"/>    
      <input type="button" id="btnSend" value="Send" />
      <div id="divHistory"></div>
    </form>
</body>
</html>
