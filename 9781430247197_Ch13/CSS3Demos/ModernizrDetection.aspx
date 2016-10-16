<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ModernizrDetection.aspx.cs" Inherits="CSS3Demos.ModernizrDetection" %>

<!DOCTYPE html>

<html>
<head runat="server">


  <script type="text/javascript" src="modernizr.js"></script>

  <style>
    .div {
      background-color: #d3a584;
      padding: 10px;
      text-align: center;
    }
    .borderradius .div {
      border: 2px #f00 solid;
      border-radius: 25px;
    }
    .no-borderradius .div {
      border: 2px #f00 solid;
    }

    </style>
</head>
<body>
    <form id="form1" runat="server">
      <div class="div">Hello World!</div>
    </form>
</body>
</html>
