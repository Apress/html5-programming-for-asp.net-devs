<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true"
  CodeBehind="Default.aspx.cs" Inherits="Example_03.Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
  <script type="text/javascript">
    $(document).ready(function () {
      if (!Modernizr.audio) {
        alert('Your browser does not support the HTML5 audio tag.');
        return false;
      }
      if (!Modernizr.video) {
        alert('Your browser does not support the HTML5 video tag.');
        return false;
      }

      $("#playaudio").click(function () {
        $.ajax({
          type: "POST",
          url: 'default.aspx/GetAudio',
          contentType: "application/json; charset=utf-8",
          dataType: "json",
          success: function (results) {
            $("#audio").src = results.d;
            $("#audio").trigger("play");
          },
          error: function (err) {
            alert(err.status + " - " + err.statusText);
          }
        })
      });

      $("#playvideo").click(function () {
          $.ajax({
            type: "POST",
            url: 'default.aspx/GetVideo',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (results) {
              $("#video").src = results.d;
              $("#video").trigger("play");
            },
            error: function (err) {
              alert(err.status + " - " + err.statusText);
            }
          })
        });
      });

  </script>
  <header>
    <h1>Play random Audio and Video files!</h1>
  </header>
  <div>
    <input type="button" id="playaudio" value="Play Random Audio File" />
    <br />
    <br />
    <audio id="audio" src="media/audio1.mp3" width="400" controls></audio>
    <br />
    <input type="button" id="playvideo" value="Play Random Video File" />
    <br />
    <br />
    <video id="video" src="media/Video1.mp4" width="450" height="200" controls poster="images/blackposter.png" preload="none"></video>
  </div>

</asp:Content>
