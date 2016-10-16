<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BingMaps.aspx.cs" Inherits="Geolocation.BingMaps" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script type="text/javascript" src="jquery-1.7.2.min.js"></script>
    <script type="text/javascript" src="modernizr-2.5.3.js"></script>
    <script src="http://dev.virtualearth.net/mapcontrol/mapcontrol.ashx?v=7.0" type="text/javascript"></script>

      <script type="text/javascript">
        var map;
        var defaultPos;

        $(document).ready(function () {

          if (!Modernizr.geolocation) {
            alert("This browser doesn't support the Geolocation API.");
            return;
          }

          //Mumbai latitude and longitude : 18° 55' N 	72° 54' E
          //Decimal Degrees = Degrees + minutes/60 + seconds/3600
          defaultPos = new Microsoft.Maps.Location(18.916667, 72.9);
          var mapOptions = {
            credentials: '<%= ConfigurationManager.AppSettings["BingMapsAPIKey"] %>',
            center: defaultPos,
            mapTypeId: Microsoft.Maps.MapTypeId.road,
            zoom: 8
          };
          map = new Microsoft.Maps.Map($("#divMap").get(0), mapOptions);

          $("#btnShowCurrent").click(function () {
            navigator.geolocation.getCurrentPosition(OnSuccess, OnError);
          });
        });

        function OnSuccess(position) {
          var curPos = new Microsoft.Maps.Location(position.coords.latitude, position.coords.longitude);
          var calloutOptions = {title: "Location Information", description: "This is your current location."};
          var callout = new Microsoft.Maps.Infobox(curPos, calloutOptions);
          map.entities.push(callout);
        }

        function OnError(err) {
          alert(err.message);
          var calloutOptions = {title: "Location Information", description: "This is the default location."};
          var callout = new Microsoft.Maps.Infobox(defaultPos, calloutOptions);
          map.entities.push(callout);
        }

    </script>
</head>
<body>
  <center>
    <br />
    <input type="button" id="btnShowCurrent" value="Show Current Location" />
    <br /><br />
    <div id="divMap" style="position:relative;width:400px; height:400px;border:1px solid blue;"></div>
    </center>
</body>
</html>
