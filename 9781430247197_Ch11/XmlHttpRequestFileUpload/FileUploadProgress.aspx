<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FileUploadProgress.aspx.cs" Inherits="XmlHttpRequest.FileUploadProgress" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <link rel="stylesheet" type="text/css" href="StyleSheet.css" />
    <script type="text/javascript" src="jquery-1.7.2.min.js"></script>
    <script type="text/javascript" src="modernizr-2.5.3.js"></script>

    <script type="text/javascript">
      var files;
      var xhr = new XMLHttpRequest();

      $(document).ready(function () {
        var container;
        container = document.getElementById("container");
        container.addEventListener("dragenter", OnDragEnter, false);
        container.addEventListener("dragover", OnDragOver, false);
        container.addEventListener("drop", OnDrop, false);
        $("#btnUpload").click(UploadFiles);
        $("#btnCancel").click(CancelUpload);
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
        $("#fileInfo").html(files.length + " file(s) selected!");
      }


      function UploadFiles() {
        var data = new FormData();
        for (var i = 0; i < files.length; i++) {
            data.append(files[i].name, files[i]);
        }
        xhr.upload.addEventListener("progress", OnProgress, false);
        xhr.addEventListener("load", OnComplete, false);
        xhr.addEventListener("error", OnError, false);
        xhr.addEventListener("abort", OnAbort, false);
        xhr.open("POST", "UploadHandler.ashx");
        xhr.send(data);
      }

      function CancelUpload() {
        xhr.abort();
      }

      function OnProgress(evt) {
        if (evt.lengthComputable) {
          var progress = Math.round(evt.loaded * 100 / evt.total);
          $("#uploadProgress").attr("value", progress);
        }
      }

      function OnComplete(evt) {
        alert(evt.target.responseText);
      }

      function OnError(evt) {
        alert("Error Uploading File(s)!");
      }

      function OnAbort(evt) {
        alert("File Upload Aborted!");
      }
    </script>
</head>
<body>
  <center>
    <form id="form1" runat="server" enctype="multipart/form-data">
      <asp:Label ID="Label1" runat="server" Text="Drag files from Windows Explorer and Drop them on the following image" CssClass="message"></asp:Label>
      <br />
      <div id="container" class="dropDiv"></div>
      <div id="fileInfo"></div>
      <input id="btnUpload" type="button" value="Upload" />
      <input id="btnCancel" type="button" value="Cancel" />
      <br />
      <progress id="uploadProgress" value="1" max="100"></progress>
    </form>
  </center>
</body>
</html>




