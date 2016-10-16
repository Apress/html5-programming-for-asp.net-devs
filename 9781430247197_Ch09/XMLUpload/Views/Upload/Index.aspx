<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<!DOCTYPE html>

<html>
<head runat="server">
    <title>Index</title>
    <script type="text/javascript" src="../../Scripts/jquery-1.6.2.js"></script>
    <link rel="stylesheet" type="text/css" href="../../Content/Site.css" />
    
  <script type="text/javascript">
      var files;
      $(document).ready(function () {
        $("#file1").change(OnChange);
        var basket;
        basket = document.getElementById("basket");
        basket.addEventListener("dragenter", OnDragEnter, false);
        basket.addEventListener("dragleave", OnDragLeave, false);
        basket.addEventListener("dragover", OnDragOver, false);
        basket.addEventListener("drop", OnDrop, false);

        $("#upload").click(UploadFiles);
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

      function OnChange(evt) {
        files = evt.target.files;
        ShowFileDetails();
      }

      function OnDrop(e) {
        e.stopPropagation();
        e.preventDefault();
        files = e.dataTransfer.files;
        ShowFileDetails();
      }

      function ShowFileDetails() {
        var html = "";
        html += files.length + " files selected!";
        html += "<div class='fileName'>"
        for(var i=0;i<files.length;i++)
        {
          if (files[i].type == "text/xml") {
            html += "<a href='#' data-file-index='" + i + "'>" + files[i].name + "</a>  ";
          }
          else {
            html += "<span data-file-index='" + i + "'>" + files[i].name + "</span>  ";
          }
        }
        html += "</div>";
        $("#filecount").html(html);
        $("a").hover(ShowPreview,HidePreview);
      }

      function ShowPreview(evt) {
        evt.stopPropagation();
        evt.preventDefault();

        var reader = new FileReader();
        $(reader).bind("load", function (e) {
          var xmlData = e.target.result;
          if (xmlData.length > 500) {
            xmlData = xmlData.substr(0, 500);
          }
          $(evt.target).attr('title', xmlData);
        });
        var fileIndex = $(evt.target).attr('data-file-index');
        reader.readAsText(files[fileIndex]);
      }

      function HidePreview() {
      }

      function UploadFiles() {
        var data = new FormData();
        for (var i = 0; i < files.length; i++) {
          if (files[i].type == "text/xml") {
            data.append(files[i].name, files[i]);
          }
        }
        $.ajax({
          type: "POST",
          url: "/Upload/UploadFiles",
          contentType: false,
          processData: false,
          data: data,
          success: function (result) {
            $("#errors").empty();
            $("#errors").html(result);
          },
          error: function () {
            alert("There was error uploading files!");
          }
        });
      }
    </script>
</head>
<body>
    <center>
      <% using (Html.BeginForm()) { %>
        <div class="message">Select files using a file field or drop them on the basket</div>
        <%= Html.TextBox("file1", "",new {type="file",multiple="multiple"})%>
        <div class="message">OR</div>
        <div id="basket" class="dropDiv"></div>
        <div id="filecount" class="message"></div>
        <div id="errors" class="error"></div>
        <input id="upload" type="button" value="Upload" />
      <%}%>
  </center>
</body>
</html>
