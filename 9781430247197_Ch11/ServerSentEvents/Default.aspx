<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="ServerSentEvents.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script type="text/javascript" src="jquery-1.7.2.min.js"></script>
    <script type="text/javascript" src="modernizr-2.5.3.js"></script>

  <script type="text/javascript">
    var source;

    $(document).ready(function () {
      if (window.EventSource == undefined) {
        alert("This browser doesn't support HTML5 Server Sent Events.");
        return;
      }
      $("#btnListen").click(function () {
        source = new EventSource('ClientNotifier.ashx');
        source.addEventListener("open", function (event) {
          $('#targetDiv').append('<h3>Connection Opened.</h3>');
        },false);
        source.addEventListener("error", function (event) {
          if (event.eventPhase == EventSource.CLOSED) {
            $('#targetDiv').append('<h3>Connection Closed.</h3>');
            source = null;
          }
        },false);
        source.addEventListener("message",function (event) {
          $('#targetDiv').append('<h3>' + event.data + '</h3>');
        },false);
    });

      $("#btnStop").click(function () {
        alert(source);
      source.close();
    });

    });
  </script>
</head>
<body>
    <form id="form1" runat="server">
    <input id="btnListen" type="button" value="Start Listening" />
    <input id="btnStop" type="button" value="Stop Listening" />

    <div id="targetDiv"></div>
    </form>
</body>
</html>
