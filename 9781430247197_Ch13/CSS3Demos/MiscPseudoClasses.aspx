<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MiscPseudoClasses.aspx.cs" Inherits="CSS3Demos.MiscPseudoClasses" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
      input:not([type="submit"]) {
        background-color:#808080;
      }
      div ~ ul {
        background-color:#ff6a00;
      }
    </style>
</head>
<body>
    <form id="form1" runat="server">
      <input type="text" />
      <br /><br />
      <input type="text" disabled="disabled" />
      <br /><br />
      <input type="checkbox" value="USA" checked="checked" />United States
      <input type="checkbox" value="UK" />United Kingdom
      <input type="checkbox" value="IN" checked="checked"/>India
      <br /><br />
      <input type="submit" value="Submit" />
      <div>
      <ul>
        <li>One</li>
        <li>Two</li>
      </ul>
      </div>
      <ul>
        <li>Three</li>
        <li>Four</li>
      </ul>
    </form>
</body>
</html>
