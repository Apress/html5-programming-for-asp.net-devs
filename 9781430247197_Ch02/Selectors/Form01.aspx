<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Form01.aspx.cs" Inherits="Chapter02.Selectors.Form01" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
  <title></title>
  <script type="text/javascript" src="../Scripts/jquery-1.7.2.min.js"></script>
  <script type="text/javascript">
    $(document).ready(function () {
      $("#form1 :text").attr("disabled", "disabled");
      $("#form1 :checkbox").attr("checked", "checked");
      $("#Button1").click(function () {
        alert($("#form1 input[type='checkbox']:checked").length + " checkboxes are checked.");
        alert($("#Select1 option:selected").length + " options are selected.");
      });
    });
  </script>
</head>
<body>
    <form id="form1" runat="server">
    <input id="Text1" type="text" />
    <br />
    <textarea id="TextArea1" cols="20" rows="2"></textarea>
    <br />
    <input id="Checkbox1" type="checkbox" value="IE9"/>IE9
    <input id="Checkbox2" type="checkbox" value="Firefox" />Firefox
    <input id="Checkbox3" type="checkbox" value="Opera" />Opera
    <br />
      <select id="Select1" multiple size="3">
      <option>ASP.NET</option>
      <option>Visual C#</option>
      <option>Visual Basic</option>
    </select>
      <br />
      <input id="Button1" type="button" value="button" />
    </form>
</body>
</html>
