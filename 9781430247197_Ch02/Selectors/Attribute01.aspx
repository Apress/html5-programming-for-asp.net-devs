<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Attribute01.aspx.cs" Inherits="Example_03.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
  <title></title>
  <script type="text/javascript" src="Scripts/jquery-1.7.2.min.js"></script>
  <script type="text/javascript">
    $(document).ready(function () {
    //select anchor elements whose href is http://www.asp.net
    alert($("a[href = 'http://www.microsoft.com']").length);

    //select anchor elements whose href attribute contains microsoft.com
    alert($("a[href *= 'microsoft.com']").length);

    //select img elements whose src attribute starts with product
    alert($("img[src ^= 'product']").length);

    //select img elements whose src attribute ends with .gif
    alert($("img[src $= '.gif']").length);

    //select div elements who have lang attribute set
    alert($("div[lang]").length);
    });

  </script>
</head>
<body>
    <form id="form1" runat="server">
      <a href="http://www.microsoft.com">Microsoft</a>
      <a href="http://msdn.microsoft.com">MSDN</a>
      <img src="product101.jpg" />
      <img src="animateddemo.gif" />
      <div lang="hi"></div>
    </form>
</body>
</html>
