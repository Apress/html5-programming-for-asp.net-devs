<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SharedWorker2.aspx.cs" Inherits="BasicWebWorkers.SharedWorker2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <script type="text/javascript" src="Scripts/jquery-1.7.2.min.js"></script>
    <script type="text/javascript" src="Scripts/modernizr-2.5.3.js"></script>


    <script type="text/javascript">
      var worker;
      $(document).ready(function () {
        if (!Modernizr.webworkers) {
          alert("This browser doesn't support HTML5 Web Workers!");
          return;
        }
        $("#btnStart").click(function () {
          worker = new SharedWorker("scripts/SharedProcessing2.js");
          worker.port.addEventListener("message", ReceiveMessageFromWorker, false);
          worker.port.start();
          worker.port.postMessage("Hello Shared Worker!");
        });
      });

      function ReceiveMessageFromWorker(evt) {
        alert(evt.data);
      }

    </script>
</head>
<body>
    <form id="form1" runat="server">
        <input id="btnStart" type="button" value="Start Work" />
    </form>
</body>
</html>
