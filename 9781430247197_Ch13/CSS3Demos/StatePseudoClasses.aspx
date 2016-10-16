<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="StatePseudoClasses.aspx.cs" Inherits="CSS3Demos.StatePseudoClasses" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
  <script type="text/javascript" src="modernizr.js"></script>
    <style>
      input[type="text"]:enabled { background:#fff; }
      input[type="text"]:disabled { background:#808080; }
      input:checked { border:2px #f00 solid; }
    </style>
</head>
<body>
    <form id="form1" runat="server">
      Enabled Textbox : <input type="text" />
      <br /><br />
      Disabled Textbox : <input type="text" disabled="disabled" />
      <br /><br />
      <input type="checkbox" value="USA" checked="checked" />United States
      <input type="checkbox" value="UK" />United Kingdom
      <input type="checkbox" value="IN" checked="checked"/>India
    </form>
</body>
</html>
