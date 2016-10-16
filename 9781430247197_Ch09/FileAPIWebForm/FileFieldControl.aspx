<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FileFieldControl.aspx.cs" Inherits="FileAPIWebForm.FileFieldControl" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script type="text/javascript" src="Scripts/jquery-1.7.2.min.js"></script>
    <script type="text/javascript">
      $(document).ready(function () {
        $("#FileUpload1").change(function (evt) {
          alert(evt.target.files.length + " file(s) were selected!");
        });
      });
    </script>
</head>
<body>
    <form id="form1" runat="server">
      <asp:FileUpload ID="FileUpload1" runat="server" AllowMultiple="True" />
    </form>
</body>
</html>
