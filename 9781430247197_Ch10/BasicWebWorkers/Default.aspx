<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="BasicWebWorkers.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
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
          worker = new Worker("scripts/Processing.js");
          worker.addEventListener("message", ReceiveMessageFromWorker, true);
          worker.addEventListener("error", HandleError, true);
          worker.postMessage("Hello Worker!");
        });

        $("#btnStop").click(function () {
            worker.terminate();
        });

      });


      function ReceiveMessageFromWorker(evt) {
        alert(evt.data);
      }

      function HandleError(evt) {
        var msg="There was an error in the worker thread!\r\n";
        msg += "Message : " + evt.message + "\r\n";
        msg += "Source : " + evt.filename + "\r\n";
        msg += "Line No. : " + evt.lineno;
        alert(msg);
      }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <input id="btnStart" type="button" value="Start Work" />
        <input id="btnStop" type="button" value="Stop Work" />
    </form>
</body>
</html>
