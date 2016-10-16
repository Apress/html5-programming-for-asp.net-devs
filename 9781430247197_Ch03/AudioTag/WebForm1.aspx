<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="AudioTag.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
  <title></title>
  <script type="text/javascript" src="scripts/jquery-1.7.2.min.js"></script>
  <script type="text/javascript" src="scripts/modernizr-2.5.3.js"></script>
  <script type="text/javascript">
    $(document).ready(function () {
      if (!Modernizr.audio) {
        alert("This browser doesn't support HTML5 audio!");
      }
    });
  </script>
</head>
<body>
    <form id="form1" runat="server">
      <audio src="media/Audio1.mp3" controls="controls"></audio>
    </form>
</body>
</html>
