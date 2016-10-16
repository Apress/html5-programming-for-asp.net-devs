<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Target.aspx.cs" Inherits="PostMessage2.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script type="text/javascript" src="jquery-1.7.2.min.js"></script>
    <script type="text/javascript" src="modernizr-2.5.3.js"></script>

    <script type="text/javascript">
      var targetOrigin = "http://localhost:1050";
      $(document).ready(function () {
        if (!Modernizr.postmessage) {
          alert("This browser doesn't support the HTML5 postMessage API!");
          return;
        }
        window.addEventListener("message", ReceiveMessage, false);
      });

      function ReceiveMessage(evt) {
        if (evt.origin != targetOrigin)
          return;
        $("#divReceived").append(evt.origin + " : " + evt.data + "<br/>");
        evt.source.postMessage("Data received successfully!", evt.origin);
      }

    </script>
</head>
<body>
    <form id="form1" runat="server">
      <div>Data Received from Main Web Form :</div>
      <div id="divReceived"></div>
    </form>
</body>
</html>
