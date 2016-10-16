<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WindowOpen.aspx.cs" Inherits="PostMessage1.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script type="text/javascript" src="jquery-1.7.2.min.js"></script>
    <script type="text/javascript" src="modernizr-2.5.3.js"></script>

    <script type="text/javascript">
      var targetOrigin = "http://localhost:1052";
      $(document).ready(function () {
        if (!Modernizr.postmessage) {
          alert("This browser doesn't support the HTML5 postMessage API!");
          return;
        }
        var targetWindow = window.open(targetOrigin + "/Target.aspx");
        window.addEventListener("message", ReceiveMessage, false);
        $("#btnSend").click(function () {
          targetWindow.postMessage($("#txtData").val(), targetOrigin);
        });
      });

      function ReceiveMessage(evt) {
        if (evt.origin != targetOrigin)
          return;
        $("#divReceived").append(evt.origin + " : " + evt.data + "<br/>");
      }

    </script>
</head>
<body>
    <form id="form1" runat="server">
      <div>Send Data :</div>
      <input id="txtData" type="text" /><input id="btnSend" type="button" value="Send" />
      <div>Data Received :</div>
      <div id="divReceived"></div>
    </form>
</body>
</html>
