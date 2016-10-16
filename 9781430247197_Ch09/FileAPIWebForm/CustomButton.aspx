<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CustomButton.aspx.cs" Inherits="FileAPIWebForm.CustomButton" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" type="text/css" href="StyleSheet.css" />
    <script type="text/javascript" src="Scripts/jquery-1.7.2.min.js"></script>
    <script type="text/javascript">
      $(document).ready(function () {
        $("#FileUpload1").change(function (evt) {
          alert(evt.target.files.length + " file(s) were selected!");
        });
        $("#ImageButton1").click(function (evt) {
          $("#FileUpload1").click();
          evt.preventDefault();
        });
      });

    </script>
</head>
<body>
  <center>
    <form id="form1" runat="server">
      <asp:FileUpload ID="FileUpload1" runat="server" AllowMultiple="true" CssClass="hidden" />
      <asp:Label ID="Label1" runat="server" Text="Click the image below to select files" CssClass="message"></asp:Label>
      <br />
      <asp:ImageButton ID="ImageButton1" runat="server" 
        ImageUrl="~/Images/UploadFile.jpg" OnClick="ImageButton1_Click" />
    </form>
  </center>
</body>
</html>
