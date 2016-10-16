<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="BasicWebFormApp.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
  <style>
    .textbox {
      border: 1px solid #808080;
    }
    .label {
      padding: 3px 3px 3px 3px;
      font-family: Arial;
      font-size: 12px;
    }
  </style>
</head>
<body>
<form id="form1" runat="server">
<asp:Label ID="Label1" runat="server" Text="Enter your Name : " CssClass="label"></asp:Label>
<br />
<asp:TextBox ID="TextBox1" runat="server" CssClass="textbox"></asp:TextBox>
<br /><br />
<asp:Button ID="Button1" runat="server" Text="Submit" />
</form>
</body>
</html>
