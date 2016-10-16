<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AttributeSubstringSelectors.aspx.cs" Inherits="CSS3Demos.AttributeSubstringSelectors" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
  <style>
    a[href^="http://"] {
      color:red;
      font-size:30px;
    }
    a[href^="mailto:"] {
      color:blue;
      font-size:30px;
    }
    a[href$=".pdf"] {
      color:green;
      font-size:30px;
    }
    a[href*="google"] {
      color:orange;
      font-size:30px;
    }    
  </style>
</head>
<body>
    <form id="form1" runat="server">
      <a href="http://www.microsoft.com">Go to Microsoft's website.</a>
      <br />
      <a href="mailto:tom@jerry.com">Contact us here.</a>
      <br />
      <a href="ebook.pdf">Download eBook here.</a>
      <br />
      <a href="http://www.somedomain.com/google/html5">Go to Google Tips & Tricks.</a>
    </form>
</body>
</html>
