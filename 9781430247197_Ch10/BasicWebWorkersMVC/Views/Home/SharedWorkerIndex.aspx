<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<!DOCTYPE html>

<html>
<head id="Head1" runat="server">
    <title>Index</title>
    <script type="text/javascript" src="../../Scripts/jquery-1.6.2.js"></script>
    <script type="text/javascript" src="../../Scripts/modernizr-2.0.6-development-only.js"></script>


    <script type="text/javascript">
      var worker;

      $(document).ready(function () {
        $("#btnStart").click(function () {
          worker = new SharedWorker("../../scripts/sharedworker1.js");
          worker.port.addEventListener("message", ReceiveDataFromWorker, false);
          worker.port.start();
          worker.port.postMessage("BERGS");
        });
      });

      function ReceiveDataFromWorker(evt) {
        var data = JSON.parse(evt.data);
        for (var i = 0; i < data.length; i++) {
          alert(data[i].OrderID);
        }

      }
    </script>
</head>
<body>
  <form id="form1" runat="server">
        <input id="btnStart" type="button" value="Start Work" />
  </form>
</body>
</html>
