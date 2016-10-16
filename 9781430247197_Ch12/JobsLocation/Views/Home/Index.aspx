<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<!DOCTYPE html>

<html>
<head runat="server">
    <title>Index</title>
    <script type="text/javascript" src="../../Scripts/jquery-1.6.2.js"></script>
    <script type="text/javascript" src="../../Scripts/modernizr-2.0.6-development-only.js"></script>

  <script type="text/javascript">
    $(document).ready(function () {
      if (!Modernizr.geolocation) {
        alert("This browser doesn't support the Geolocation API.");
        return;
      }

      $("#btnShow").click(function () {
        window.navigator.geolocation.getCurrentPosition(function (position) {
          var lat1 = position.coords.latitude;
          var long1 = position.coords.longitude;
          var distance = $("#txtDistance").val();
          var data = '{ "lat1" : "' + lat1 + '","long1":"' + long1 + '","distance":"' + distance + '"}';
          $.ajax({
            type: "POST",
            url: '/home/GetJobs',
            data: data,
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (jobs) {
              $("#tblJobs").empty();
              $("#tblJobs").append("<tr><th>Job Title</th><th>Description</th><th>Location</th></tr>");
              for (var i = 0;i<jobs.length;i++)
              {
                $("#tblJobs").append("<tr><td>" + jobs[i].JobTitle + "</td><td>" + jobs[i].Description + "</td><td>" + jobs[i].LocationName + "</td></tr>");
              }
            },
            error: function (err) {
              alert(err.status + " - " + err.statusText);
            }
          });
        });
      });

    });
    </script>

</head>
<body>
    <h3>Job Search by Distance</h3>
    <div>
      <span>Show all jobs within </span>
      <input type="number" id="txtDistance" value="100" /> 
      <span> meters.</span>
    </div>
    <div>
      <input type="button" id="btnShow" value="Show" />
    </div>
    <table id="tblJobs" border="1" cellpadding="3"></table>
</body>
</html>
