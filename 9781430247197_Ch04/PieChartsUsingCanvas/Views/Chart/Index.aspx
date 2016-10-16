<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <script type="text/javascript" src="../../Scripts/jquery-1.6.2.min.js"></script>
    <script type="text/javascript" src="../../Scripts/modernizr-2.0.6-development-only.js"></script>
    <link rel="stylesheet" type="text/css" href="../../Content/Site.css" />
  
  <script type="text/javascript">
      $(document).ready(function () {
        if (!Modernizr.canvas) {
          alert("This browser doesn't support HTML5 Canvas!");
        }
        var canvas = $("#MyCanvas").get(0);
        var context = canvas.getContext("2d");

        $("#btnAdd").click(function () {
          var row = "<tr>";
          row += "<td>" + $("#txtName").val() + "</td>";
          row += "<td>" + $("#txtValue").val() + "</td>";
          row += "<td>" + $("#txtColor").val() + "</td>";
          row += "<td>&nbsp;</td>";
          row += "</tr>";
          $("#tblChartData").append(row);
          $("#txtName").val('');
          $("#txtValue").val('');
          $("#txtColor").val('');
          $("#txtName").focus();
        });

        $("#txtColor").focus(function () {
          if ($(this).val() == '') {
            var color = GetRnadomColor();
            $(this).val(color);
          }
        });

        var sectorNames = Array();
        var sectorValues = Array();
        var sectorColors = Array();

        $("#btnDraw").click(function () {
          context.save();
          if ($("#chkGradient").is(":checked")) {
            var linearGradient = context.createLinearGradient(0, 0, canvas.width, canvas.height);
            linearGradient.addColorStop(0, $("#txtGradient").val());
            linearGradient.addColorStop(1, 'white');
            context.fillStyle = linearGradient;
            context.fillRect(0, 0, canvas.width, canvas.height);
            context.restore();
          }
          else {
            context.clearRect(0, 0, canvas.width, canvas.height);
          }
          context.save();

          $("table tr:gt(1)").each(function (i, v) {
            sectorNames[i] = $(this).children("td:eq(0)").text();
          })
          $("table tr:gt(1)").each(function (i, v) {
            sectorValues[i] = parseInt($(this).children("td:eq(1)").text());
          })
          $("table tr:gt(1)").each(function (i, v) {
            sectorColors[i] = $(this).children("td:eq(2)").text();
          })

          var total = 0;
          for (var i = 0; i < sectorValues.length; i++) {
            total += sectorValues[i];
          }

          //draw title
          context.textAlign = "center";
          context.font = "bold 30px Arial";
          context.shadowColor = "silver";
          context.shadowOffsetX = 2;
          context.shadowOffsetY = 2;
          context.fillStyle = "black";
          context.fillText($("#txtTitle").val(), 300,50 );
          context.restore();

          //draw sectors
          var angle = 0;
          for (var i = 0; i < sectorValues.length; i++) {
            context.fillStyle = sectorColors[i];
            context.beginPath();
            context.moveTo(170, 250);
            context.arc(170, 250, 150, angle, angle + (Math.PI * 2 * (sectorValues[i] / total)), false);
            context.lineTo(170, 250);
            context.fill();
            context.stroke();
            angle += Math.PI * 2 * (sectorValues[i] / total);
          }

          //draw legends
          var offset = 150;
          for (var i = 0; i < sectorColors.length; i++) {
            context.fillStyle = sectorColors[i];
            context.font = 'bold 12px Arial';
            context.save();
            context.shadowColor = "silver";
            context.shadowOffsetX = 2;
            context.shadowOffsetY = 2;
            context.fillRect(400, offset, 20, 15);
            context.restore();
            context.textBaseline = "middle";
            alert(sectorNames[i] + ' - ' + sectorColors[i]);
            context.fillText(sectorNames[i] + ' - ' + sectorValues[i] + '%', 425, offset + 10);
            offset += 30;
          }

        });



        $('#btnSave').click(function () {
          var data = canvas.toDataURL();
          data = '"data": "' + data.replace('data:image/png;base64,', '') + '"';

          var master = '"master": {"Title" :"' + $("#txtTitle").val() + '"}';

          var details = '"details" : [';
          for (var i = 0; i < sectorNames.length; i++) {
            var sector = '{"SectorName" : "' + sectorNames[i] + '", "SectorValue":"' + sectorValues[i] + '", "SectorColor":"' + sectorColors[i] + '"}';
            details += sector
            if ((i+1) != sectorNames.length) {
              details += ",";
            }
          }
          details += ']';
        
          var finalData = '{' + data + ',' + master + ',' + details + '}';

          $.ajax({
            type: 'POST',
            url: '/Chart/SaveChart',
            data: finalData,
            contentType: 'application/json; charset=utf-8',
            dataType: 'json',
            success: function (result) {
              alert(result);
            }
          });
        });


      });

      function GetRnadomColor() {
        var charArray = '0123456789ABCDEF'.split('');
        var color = '#';
        for (var i = 0; i < 6; i++) {
          color += charArray[Math.round(Math.random() * 15)];
        }
        return color;
      }

     </script>
</head>
<body>
    <form id="form1" runat="server">
      <div><strong>Chart Title :</strong></div>
      <input type="text" id="txtTitle" size="87" class="textbox"/>
      <br /><br />
      <table id="tblChartData" border="1" cellpadding="5">
        <tr class="HeaderRow">
          <th>Sector Name</th>
          <th>Sector Value</th>
          <th>Color</th>
          <th>Action</th>
        </tr>
        <tr>
          <td><input type="text" id="txtName" class="textbox"/></td>
          <td><input type="text" id="txtValue" class="textbox"/></td>
          <td><input type="text" id="txtColor" class="textbox"/></td>
          <td><input type="button" id="btnAdd" value="Add"/></td>
        </tr>
      </table>
      <br />
      <input type="checkbox" id="chkGradient" />
      <span><strong>Show Gradient</strong></span>
      &nbsp;&nbsp;
      <span><strong>Gradient Color : </strong></span><input type="text" id="txtGradient" class="textbox" />
      <br /><br />
      <input id="btnDraw" type="button" value="Draw Chart" />
      <input id="btnSave" type="button" value="Save Chart" />
      <br /><br />
      <canvas id="MyCanvas" width="600" height="500"></canvas>
    </form>
</body>
</html>
