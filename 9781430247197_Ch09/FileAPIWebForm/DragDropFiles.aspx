<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DragDropFiles.aspx.cs" Inherits="FileAPIWebForm.DragDropFiles" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <link rel="stylesheet" type="text/css" href="StyleSheet.css" />
    <script type="text/javascript" src="Scripts/jquery-1.7.2.min.js"></script>
    <script type="text/javascript">
      $(document).ready(function () {
        var container;
        container = document.getElementById("container");
        container.addEventListener("dragenter", OnDragEnter, false);
        container.addEventListener("dragleave", OnDragLeave, false);
        container.addEventListener("dragover", OnDragOver, false);
        container.addEventListener("drop", OnDrop, false);
      });

      function OnDragEnter(e) {
        e.stopPropagation();
        e.preventDefault();
      }

      function OnDragLeave(e) {
        e.stopPropagation();
        e.preventDefault();
      }

      function OnDragOver(e) {
        e.stopPropagation();
        e.preventDefault();
      }

      function OnDrop(e) {
        e.stopPropagation();
        e.preventDefault();
        var files = e.dataTransfer.files;
        alert(files.length + " file(s) dropped!");
      }
    </script>
</head>
<body>
  <center>
    <form id="form1" runat="server">
      <asp:Label ID="Label1" runat="server" Text="Drag files from Windows Explorer and drop them on the following image" CssClass="message"></asp:Label>
      <br />
      <div id="container" class="dropDiv"></div>
    </form>
  </center>
</body>
</html>
