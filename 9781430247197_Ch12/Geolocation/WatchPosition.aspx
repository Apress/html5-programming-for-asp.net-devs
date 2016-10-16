<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WatchPosition.aspx.cs" Inherits="Geolocation.WatchPosition" %>

<!DOCTYPE html>
<html>
  <head>
    <meta name="viewport" content="initial-scale=1.0, user-scalable=no" />
    <script type="text/javascript" src="jquery-1.7.2.min.js"></script>
    <script type="text/javascript" src="modernizr-2.5.3.js"></script>
    <script type="text/javascript">

      function OnSuccess(position) {
        $("#divInfo").append("Latitude : " + position.coords.latitude + ", Longitude :" + position.coords.latitude);
      }

      function OnError(err) {
        alert(err.code + " : " + err.message);
      }

      var watchId;
      function StartWatch() {
        watchId = window.navigator.geolocation.watchPosition(OnSuccess, OnError);
      }

      function StopWatch() {
        window.navigator.geolocation.clearWatch(watchId);
      };

      $(document).ready(function () {
        if (!Modernizr.geolocation) {
          alert("This browser doesn't support the Geolocation API.");
          return;
        }
      });

    </script>
  </head>
  <body>
    <center>
    <br />
    <input type="button" id="btnStartWatch" value="Start Watching" onclick="StartWatch();" />
    <input type="button" id="btnStoptWatch" value="Stop Watching" onclick="StopWatch();" />
    <br /><br />
    <div id="divInfo"></div>
    </center>
  </body>
</html>