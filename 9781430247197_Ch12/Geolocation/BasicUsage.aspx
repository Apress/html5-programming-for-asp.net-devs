<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BasicUsage.aspx.cs" Inherits="Geolocation.BasicUsage1" %>

<!DOCTYPE html>
<html>
  <head>
    <meta name="viewport" content="initial-scale=1.0, user-scalable=no" />
    <script type="text/javascript" src="jquery-1.7.2.min.js"></script>
    <script type="text/javascript" src="modernizr-2.5.3.js"></script>
    <script type="text/javascript">
      $(document).ready(function () {

        if (!Modernizr.geolocation) {
          alert("This browser doesn't support the Geolocation API.");
          return;
        }

        $("#btnShowCurrent").click(function () {
          var options = {
            enableHighAccuracy: true,
            timeout: 10000,
            maximumAge: 60000
          };
          window.navigator.geolocation.getCurrentPosition(OnSuccess, OnError, options);
        });

      });

      function OnSuccess(position) {
        var html = "";
        html += "<tr><td>Latitude : </td>";
        html += "<td>" + position.coords.latitude + "</td></tr>";
        
        html += "<tr><td>Longitude : </td>";
        html += "<td>" + position.coords.longitude + "</td></tr>";

        html += "<tr><td>Accuracy : </td>";
        html += "<td>" + position.coords.accuracy + "</td></tr>";

        html += "<tr><td>Altitude : </td>";
        html += "<td>" + position.coords.altitude + "</td></tr>";

        html += "<tr><td>Altitude Accuracy : </td>";
        html += "<td>" + position.coords.altitudeAccuracy + "</td></tr>";

        html += "<tr><td>Heading : </td>";
        html += "<td>" + position.coords.heading + "</td></tr>";

        html += "<tr><td>Speed : </td>";
        html += "<td>" + position.coords.speed + "</td></tr>";

        html += "<tr><td>Timestamp : </td>";
        html += "<td>" + new Date(position.timestamp).toString() + "</td></tr>";

        $("#tblInfo").append(html);
        
      }

      function OnError(err) {
        alert(err.code + " : " + err.message);
      }

    </script>
  </head>
  <body>
    <center>
    <br />
    <input type="button" id="btnShowCurrent" value="Show Current Location" />
    <br /><br />
    <table id="tblInfo" border="1" cellpadding="3"></table>
    </center>
  </body>
</html>