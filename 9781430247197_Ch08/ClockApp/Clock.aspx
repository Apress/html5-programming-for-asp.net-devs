<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Clock.aspx.cs" Inherits="ClockApp.WebForm1" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml" manifest="Clock.cachemanifest">
<head runat="server">
    <title></title>
    <link rel="stylesheet" type="text/css" href="StyleSheet.css" />
    <script type="text/javascript" src="Scripts/jquery-1.7.2.min.js"></script>
    <script type="text/javascript" src="Scripts/modernizr-2.5.3.js"></script>

    <script type="text/javascript">
      $(document).ready(function () {
        if (!Modernizr.applicationcache) {
          alert("This browser doesn't support HTML5 Offline Applications!");
        }
        var months = [ "January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December" ]; 
        var days= ["Sunday","Monday","Tuesday","Wednesday","Thursday","Friday","Saturday"]
        var today = new Date();
        today.setDate(today.getDate());
        $('#date').html(days[today.getDay()] + " " + today.getDate() + ' ' + months[today.getMonth()] + ' ' + today.getFullYear());

        setInterval(function () {
          var seconds = new Date().getSeconds();
          $("#sec").html(( seconds < 10 ? "0" : "" ) + seconds);
        },1000);
	
        setInterval( function() {
          var minutes = new Date().getMinutes();
          $("#min").html(( minutes < 10 ? "0" : "" ) + minutes);
        },1000);
	
        setInterval( function() {
          var hours = new Date().getHours();
          $("#hours").html(( hours < 10 ? "0" : "" ) + hours);
        }, 1000);

        setTimeout(CheckOnline, 5000);

        applicationCache.update();

        $(applicationCache).bind("checking",NotifyUser);
        $(applicationCache).bind("downloading", NotifyUser);
        $(applicationCache).bind("cached", NotifyUser);
        $(applicationCache).bind("updateready", NotifyUser);
        $(applicationCache).bind("noupdate", NotifyUser);
        $(applicationCache).bind("progress", NotifyUser);
        $(applicationCache).bind("obsolete", NotifyUser);
        $(applicationCache).bind("error", NotifyUser);

      });

      function NotifyUser(evt) {
        alert(evt.type);
        if (evt.type == 'updateready') {
          if (confirm('An updated version of this application is available.' +
                        'Do you wish to use the new version now?'))
          {
            //window.location.reload();
            applicationCache.swapCache();
          }
        }
      }

      function CheckOnline() {
        $.ajax({
          type: "POST",
          url: 'Clock.aspx/IsOnline',
          contentType: "application/json; charset=utf-8",
          dataType: "json",
          success: function (result) {
            if (result.d == true) {
              $("#status").html("You are Online!");
              setTimeout(CheckOnline, 5000);
            }
          },
          error: function () {
            $("#status").html("You are Offline!");
            setTimeout(CheckOnline, 5000);
          }
        });
      }
    </script>
</head>
<body>
    <script src="Scripts/Ads.js"></script>
    <form id="form1" runat="server">
        <div class="clock">
           <div id="date"></div>
            <div id="time">
              <span id="hours"></span><span id="colon1">:</span>
              <span id="min"></span><span id="colon2">:</span>
              <span id="sec"></span>
            </div>
        </div>
        <br />
        <center>
        <!-- <input id="Send" type="button" value="Send Time to Server" /> -->
        <br /><br />
        <div id="status"></div>
        <br />
        <img src="Images/HTML5.png" width="125" height="125" />
        </center>
    </form>
</body>
</html>
