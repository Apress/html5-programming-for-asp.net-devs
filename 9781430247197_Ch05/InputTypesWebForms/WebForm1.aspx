<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="InputTypesWebForms.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <asp:Label ID="Label1" runat="server" Text="Enter your email :"></asp:Label>
    <br />
      <asp:TextBox ID="TextBox1" runat="server" TextMode="Number" min="18" Max="100" step="2"></asp:TextBox>
    </form>
</body>
</html>
