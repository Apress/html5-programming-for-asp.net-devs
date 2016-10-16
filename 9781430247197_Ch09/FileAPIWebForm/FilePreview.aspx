<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FilePreview.aspx.cs" Inherits="FileAPIWebForm.FilePreview" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" type="text/css" href="StyleSheet.css" />
    <script type="text/javascript" src="Scripts/jquery-1.7.2.min.js"></script>
    <script type="text/javascript" src="Scripts/modernizr-2.5.3.js"></script>

    <script type="text/javascript">
      var files;

      $(document).ready(function () {

        if (!Modernizr.draganddrop) {
          alert("This browser doesn't support File API and Drag & Drop features of HTML5!");
          return;
        }

        if (window.File && window.FileReader && window.FileList && window.Blob) {
        } else {
          alert("This browser doesn't support HTML5 File API");
          return;
        }

        $("#FileUpload1").change(OnChange);
        $("#FileUpload2").change(OnChange);

        $("#ImageButton1").click(function (evt) {
          $("#FileUpload2").click();
          evt.preventDefault();
        });

        var basket;
        basket = document.getElementById("divBasket");
        basket.addEventListener("dragenter", OnDragEnter, false);
        basket.addEventListener("dragover", OnDragOver, false);
        basket.addEventListener("drop", OnDrop, false);

      });

      function OnDragEnter(e) {
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
        files = e.dataTransfer.files;
        ShowFileDetails(files);
      }

      function OnChange(evt) {
        files = evt.target.files;
        ShowFileDetails(files);
      }

      function ShowFileDetails(files) {
        $("#Table1").empty();
        $("#Table1").append("<tr><th>File Name</th><th>Size</th><th>MIME Type</th><th>Preview</th></tr>");
        for (var i = 0; i < files.length; i++) {
          if (files[i].type == "image/jpeg" || files[i].type == "image/png" || files[i].type == "image/gif") {
            $("#Table1").append("<tr><td>" + files.item(i).name +
                                "</td><td>" + files[i].size +
                                "</td><td>" + files[i].type +
                                "</td><td><a href='#' data-file-index='" + i + "'>Show</a></td></tr>");
          }
          else {
            alert("Only image files are allowed. Other files will be ignored!");
          }
        }
        $("#Table1").append("<tr><td colspan='4'><input type='button' id='btnUpload' value='Upload Files' /></td></tr>");
        $("#btnUpload").click(UploadFiles);

        $("a").hover(ShowPreview, HidePreview);
      }

      function ShowPreview(evt) {
        var reader = new FileReader();
        $(reader).bind("load",function (e) {
          var imgSrc = e.target.result;
          alert(imgSrc);
          $("#filePreview").attr('src',imgSrc);
        });
        var fileIndex = $(evt.target).attr('data-file-index');
        reader.readAsDataURL(files[fileIndex]);
      }

      function HidePreview(evt) {
        $("#imgPreview").attr('src', '');
      }

      function UploadFiles() {
        var data = new FormData();
        for (var i = 0; i < files.length; i++) {
          data.append(files[i].name, files[i]);
        }
        $.ajax({
          type: "POST",
          url: "UploadFiles.ashx",
          contentType: false,
          processData: false,
          data: data,
          success: function (result) {
            alert(result);
          },
          error: function () {
            alert("There was error uploading files!");
          }
        });

      }

    </script>
</head>
<body id="body">
<form id="form1" runat="server" enctype="multipart/form-data">
<div>
  <table>
    <tr>
      <th>
        <asp:Label ID="Label1" runat="server" Text="1. File Field" CssClass="message"></asp:Label>
      </th>
      <th>
        <asp:Label ID="Label2" runat="server" Text="2. Custom Button" CssClass="message"></asp:Label>
      </th>
      <th>
        <asp:Label ID="Label3" runat="server" Text="3. Drag & Drop" CssClass="message"></asp:Label>
      </th>
    </tr>
    <tr>
      <td>
        <asp:FileUpload ID="FileUpload1" runat="server" AllowMultiple="True" />
      </td>
      <td>
        <asp:FileUpload ID="FileUpload2" runat="server" AllowMultiple="true" CssClass="hidden" />
        <asp:ImageButton ID="ImageButton1" runat="server" 
          ImageUrl="~/Images/UploadFile.jpg"/>
      </td>
      <td>
        <div id="divBasket" class="dropDiv"></div>
      </td>
    </tr>
  </table>
</div>
<div class="divBlock">
  <table id="Table1" border="1" cellPadding="3"></table>
</div>
<div class="divBlock">
  <img id="filePreview" />
</div>
</form>
</body>
</html>
