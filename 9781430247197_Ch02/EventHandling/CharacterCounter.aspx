<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CharacterCounter.aspx.cs" Inherits="EventHandling.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
  <title>Character Counter Demo</title>
  <link rel="stylesheet" type="text/css" href="StyleSheet.css" />
  <script type="text/javascript" src="scripts/jquery-1.7.2.min.js"></script>
  
  <script>
    $(document).ready(function () {
      var eventData = {
        MaxLength: 20,
        Type: 'Remaining',
        AllowOverflow: true,
        CounterId: 'counter',
        NormalCss: 'NormalCounter',
        WarningCss:'WarningCounter'
      };

      $("#textarea").keyup(eventData, OnKeyUp);
      $("#textarea").blur(eventData,OnBlur);
      $("#textarea").keyup();

      $("#submit").click(function (event) {
        if (!confirm("Do you wish to submit the form?")) {
          event.preventDefault();
        }
      });
    })

    function OnKeyUp(event) {
      var id = "#" + event.target.id;
      var counterid = "#" + event.data.CounterId;
      var text = $(id).val();
      if (text.length > event.data.MaxLength) {
        if (!event.data.AllowOverflow) {
          $(id).text(text.substring(0, event.data.MaxLength));
        }
      }
      var diff = 0;
      if (event.data.Type == 'Remaining') {
        diff = event.data.MaxLength - $(id).val().length;
        if (diff < 0) {
          $(counterid).removeClass(event.data.NormalCss);
          $(counterid).addClass(event.data.WarningCss);
        }
        else {
          $(counterid).removeClass(event.data.WarningCss);
          $(counterid).addClass(event.data.NormalCss);
        }
      }
      else {
        diff = $(id).val().length;
        if (diff > event.data.MaxLength) {
          $(counterid).removeClass(event.data.NormalCss);
          $(counterid).addClass(event.data.WarningCss);
        }
        else {
          $(counterid).removeClass(event.data.WarningCss);
          $(counterid).addClass(event.data.NormalCss);
        }
      }
      $(counterid).text(diff);
    }

    function OnBlur(event) {
      var id = "#" + event.target.id;
      $(id).keyup();
    }
  </script>

</head>
<body>
  <form id="form1" runat="server">
    <span>Enter some text :</span>
    <br />
    <textarea id="textarea" rows="3" cols="50" class="TextArea"></textarea>
    <br />
    <span class="NormalCounter">Character count : </span>
    <span id="counter" class="NormalCounter"></span>
    <br /><br />
    <asp:Button ID="submit" runat="server" Text="Submit" OnClick="submit_Click" />
    <br />
    <asp:Label ID="lblMessage" runat="server" Text=""></asp:Label>
  </form>
</body>
</html>
