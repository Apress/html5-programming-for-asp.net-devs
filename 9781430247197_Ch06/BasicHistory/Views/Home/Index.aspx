<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage<BasicHistory.Models.Image>" %>

<!DOCTYPE html>

<html>
<head runat="server">
    <title>Slide Show - <%= Model.Title %></title>
    <link rel="stylesheet" type="text/css" href="../../Content/StyleSheet.css" />
    <script type="text/javascript" src="../../Scripts/jquery-1.6.2.min.js"></script>

    <script type="text/javascript">
      $(document).ready(function () {
        $("#btnBackward").click(function () {
          window.history.back();
        });
        $("#btnForward").click(function () {
          window.history.forward();
        });
      });
    </script>
</head>
<body>
  <form id="form1" method="post" action="/home/index">
    <h1 class="Title"><%= Model.Title %></h1>
    <div><img class="Image" src="<%= Page.ResolveUrl(Model.ImageUrl) %>" /></div>
    <p class="Description">
      <%= Model.Description %>
    </p>
    <div>
      <input name="direction" type="submit" value="Previous" formaction="/home/index/<%= ViewBag.PreviousId %>" />
      <input name="direction" type="submit" value="Next" formaction="/home/index/<%= ViewBag.NextId %>" />
    </div>
    <div>
      <input id="btnBackward" type="button" value="<" />
      <input id="btnForward" type="button" value=">" />
    </div>
  </form>
</body>
</html>
