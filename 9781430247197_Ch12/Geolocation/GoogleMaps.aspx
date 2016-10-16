<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="GoogleMaps.aspx.cs" Inherits="Geolocation.BasicUsage" %>

<!DOCTYPE html>
<html>
  <head>
    <meta name="viewport" content="initial-scale=1.0, user-scalable=no" />
    <script type="text/javascript" src="jquery-1.7.2.min.js"></script>
    <script type="text/javascript" src="modernizr-2.5.3.js"></script>
    <script type="text/javascript" src="http://maps.googleapis.com/maps/api/js?key=<%= ConfigurationManager.AppSettings["GoogleMapsAPIKey"] %>&sensor=false"></script>
    <script type="text/javascript">
      var map;
      var defaultPos;

      $(document).ready(function () {

        if (!Modernizr.geolocation) {
          alert("This browser doesn't support the Geolocation API.");
          return;
        }

        //Mumbai latitude and longitude : 18° 55' N 	72° 54' E
        defaultPos = new google.maps.LatLng(18.916667, 72.9);
        var mapOptions = {
          center: defaultPos,
          zoom: 8,
          mapTypeId: google.maps.MapTypeId.ROADMAP
        };
        map = new google.maps.Map($("#divMap").get(0), mapOptions);

        $("#btnShowCurrent").click(function () {
          navigator.geolocation.getCurrentPosition(OnSuccess, OnError);
        });

      });

      function OnSuccess(position) {
        var curPos = new google.maps.LatLng(position.coords.latitude, position.coords.longitude);
        map.setCenter(curPos);
        var callout = new google.maps.InfoWindow();
        callout.setContent("This is your current location.");
        callout.setPosition(curPos);
        callout.open(map);
      }

      function OnError(err) {
        alert(err.message);

        map.setCenter(defaultPos);

        var callout = new google.maps.InfoWindow();
        callout.setContent("This is the default location.");
        callout.setPosition(defaultPos);
        callout.open(map);

      }

    </script>
  </head>
  <body>
    <center>
    <br />
    <input type="button" id="btnShowCurrent" value="Show Current Location" />
    <br /><br />
    <div id="divMap" style="width:300px; height:300px;border:1px solid blue;"></div>
    </center>
  </body>
</html>