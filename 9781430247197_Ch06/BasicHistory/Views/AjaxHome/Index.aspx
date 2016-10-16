<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage<BasicHistory.Models.Image>" %>

<!DOCTYPE html>

<html>
<head id="Head1" runat="server">
    <title>Slide Show - <%= Model.Title %></title>
    <script type="text/javascript" src="../../Scripts/jquery-1.6.2.min.js"></script>
    <link rel="stylesheet" type="text/css" href="../../Content/StyleSheet.css" />

  <script type="text/javascript">
    $(document).ready(function () {

      $("#btnBackward").click(function () {
        window.history.back();
      });
      $("#btnForward").click(function () {
        window.history.forward();
      });

      $("#prev").click(function () {
        $.ajax({
          type: "POST",
          url: "/AjaxHome/GetImage",
          data:'{ id : "' + $("#id").val() + '", direction : "P"}',
          contentType: "application/json; charset=utf-8",
          dataType: "json",
          success: OnSuccess,
          error: OnError
        })
      });

      $("#next").click(function () {
        $.ajax({
          type: "POST",
          url: "/AjaxHome/GetImage",
          data: '{ id : "' + $("#id").val() + '", direction : "N"}',
          contentType: "application/json; charset=utf-8",
          dataType: "json",
          success: OnSuccess,
          error: OnError
        })
      });

    });

    function OnSuccess(image) {
      $("#id").val(image.Id);
      $("#title").html(image.Title);
      $("#desc").html(image.Description);
      $("#img").attr("src",image.ImageUrl);
      $("#divMsg").html("History Length : " + history.length);
    }

    function OnError(err) {
      alert(err.status + " - " + err.statusText);
    }


  </script>
</head>
<body>
  <form id="form1" method="get" action="/home/index">
    <h1 id="title" class="Title"><%= Model.Title %></h1>
    <div><img id="img" src="<%= Page.ResolveUrl(Model.ImageUrl) %>" class="Image" /></div>
    <p id="desc" class="Description">
      <%= Model.Description %>
    </p>
    <div>
      <input id="id" type="hidden" value="<%= Model.Id %>" />
      <input id="prev" type="button" value="Previous" />
      <input id="next" type="button" value="Next" />
    </div>
    <div>
      <input id="btnBackward" type="button" value="<" />
      <input id="btnForward" type="button" value=">" />
    </div>
    <div id="divMsg"></div>
  </form>
</body>
</html>
