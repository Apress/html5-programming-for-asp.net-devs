<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<!DOCTYPE html>

<html>
<head runat="server">
    <meta name="viewport" content="width=device-width" />
    <title>Index</title>
    <script type="text/javascript" src="../../Scripts/jquery-1.6.2.min.js"></script>
    <script src="../../Scripts/jquery-1.6.2.min.js"></script>
    <script type="text/javascript" src="../../Scripts/modernizr-2.0.6-development-only.js"></script>
    <link rel="stylesheet" type="text/css" href="../../Content/Site.css" />

    <script type="text/javascript">
      var videoPlayer;
      $(document).ready(function () {
          alert('1');
        if (!Modernizr.video) {
          alert("This browser doesn't support HTML5 video!");
        }

        $.ajax({
          type: "POST",
          url: '/VideoPlayer/GetPlayList',
          dataType: 'json',
          contentType: "application/json; charset=utf-8",
          success: OnSuccess,
          error: OnError
        });

        videoPlayer = $("#videoPlayer").get(0);

        $("#ddlPlayList").change(function () {
          var extension = $(this).val();
          extension=extension.substr(extension.lastIndexOf('.') + 1)
          var mime = "";
          switch (extension) {
            case 'mp4':
              mime = "video/mp4";
              break;                         
            case 'ogv':
              mime = "video/ogg";
              break;
            case 'webm':
              mime = "video/webm";
              break;
          }
          if (videoPlayer.canPlayType(mime)) {
            $("#btnPlayPause").val("Play");
            videoPlayer.src = $(this).val();
            $("#btnPlayPause").click();
          }
          else {
            alert("Cannot play this video format!");
          }
        });
        
        $("#btnPlayPause").click(function () {
          if ($(this).val() == "Play") {
            videoPlayer.playbackRate = $("#rngPlaybackRate").val();
            videoPlayer.play();
          }
          else {
            videoPlayer.pause();
          }
        });

        $("#btnStop").click(function () {
          videoPlayer.pause();
          videoPlayer.currentTime = 0;
        });

        $("#rngVolume").change(function () {
          videoPlayer.volume = $(this).val();
        });

        $(videoPlayer).bind("timeupdate", OnTimeUpdate);
        $(videoPlayer).bind("loadedmetadata", OnLoadedMetadata);
        $(videoPlayer).bind("play", OnPlay);
        $(videoPlayer).bind("pause", OnPause);


      });

      function OnSuccess(playListItems) {
        for (var i = 0; i < playListItems.length; i++) {
          $("#ddlPlayList").append("<option value='" + playListItems[i].Url + "'>" + playListItems[i].Title + "</option>");
        }
      }

      function OnError(err) {
        alert(err.status + " - " + err.statusText);
      }

      function OnTimeUpdate() {
        var percentage = Math.floor((videoPlayer.currentTime / videoPlayer.duration * 100));
        $("#spanProgress").html(percentage + " % ");
      }

      function OnLoadedMetadata() {
        $("#spanDuration").html("Duration : " + videoPlayer.duration.toFixed(1) + " seconds.");
      }

      function OnPlay() {
        $("#btnPlayPause").val("Pause");
      }

      function OnPause() {
        $("#btnPlayPause").val("Play");
      }


    </script>
</head>
<body>
  <div class="PlayList">
    Select Video To Play : <br />
    <select id="ddlPlayList" class="DropDownList">
    </select>
  </div>
  <div>
    <video id="videoPlayer" class="Video" poster="/content/media/poster.jpg" ></video>
  </div>
  <div class="Progress">
    <span id="spanDuration" class="Duration"></span><br />
    <span>Progress :</span>
    <span id="spanProgress"></span>
  </div>
  <div>
    <input type="button" id="btnPlayPause" value="Play" class="Button" />
    <input type="button" id="btnStop" value="Stop"  class="Button"/>
  </div>
  <br />
  <div class="Speed">
    <span>Playback Speed (1-5) :</span>
    <input type="range" id="rngPlaybackRate" value="1" step="1" min="1" max="5" class="Range"/>
  </div>
  <div class="Volume">
    <span>Volume (0-1) :</span>
    <input type="range" id="rngVolume" value="1" step="0.1" min="0" max="1" class="Range"/>
  </div>
</body>
</html>
