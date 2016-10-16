<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="StructuralPseudoClasses.aspx.cs" Inherits="CSS3Demos.StructuralPseudoClasses" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
  <style>
    /*
    tr:last-child {
      background-color:#808080;
      font-size:20px;
    }*/
    tr:nth-child(odd) {
      background-color:#fff;
    }
    tr:nth-child(even) {
      background-color:#808080;
    }
    p:first-of-type::first-letter {
      font-size:50px;
      float:left; 
      line-height:1;
      margin-right:5px;
    }
  </style>
</head>
<body>
    <form id="form1" runat="server">
      <table border="1" cellpadding="5">
        <tr><td>Hello</td><td>world!</td></tr>
        <tr><td>Hello</td><td>world!</td></tr>
        <tr><td>Hello</td><td>world!</td></tr>
        <tr><td>Hello</td><td>world!</td></tr>
      </table>
      <p>
        Hello world! Hello world! Hello world! Hello world! Hello world! Hello world! Hello world! 
        Hello world! Hello world! Hello world! Hello world! Hello world! Hello world! Hello world! 
        Hello world! Hello world! Hello world! Hello world! Hello world! Hello world! Hello world! 
      </p>
      <p>
        Hello world! Hello world! Hello world! Hello world! Hello world! Hello world! Hello world! 
        Hello world! Hello world! Hello world! Hello world! Hello world! Hello world! Hello world! 
        Hello world! Hello world! Hello world! Hello world! Hello world! Hello world! Hello world! 
      </p>

    </form>
</body>
</html>
