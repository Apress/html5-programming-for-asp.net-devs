<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="AJAXWebForm.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
  <title></title>
  <script type="text/javascript" src="Scripts/jquery-1.7.2.min.js"></script>
  <link rel="stylesheet" type="text/css" href="StyleSheet.css" />

  <script type="text/javascript">
    $(document).ready(function () {
      $("#Button1").click(function () {
        url = "Service.svc/Convert";
        //url = "/handler.ashx";
        //data = { "Value": $("#Text1").val(), "Unit": $("#Select1").val() };
        data = '{"Value":"' + $("#Text1").val() + '","Unit":"' + $("#Select1").val() + '"}';
        //contentType: "application/json; charset=utf-8",
        $.ajax({
          type: "POST",
          url: url,
          data: data,
          contentType: "application/json; charset=utf-8",
          dataType: "json",
          success: OnSuccess,
          error: OnError
        })
      });
    });


    function OnSuccess(results) {
      alert("Converted Temperature : " + results.Value + " " + results.Unit);
    }

    function OnError(err) {
      alert(err.status + " - " + err.statusText);
    }

  </script>
</head>
<body>
    <form id="form1" runat="server">
      <span class="biggertext">Enter Temperature :</span><br />
      <input id="Text1" type="text" class="border" />
      <select id="Select1" class="border">
        <option value="C">Celcius</option>
        <option value="F">Fahrenheit</option>
      </select>
      <br /><br />
      <input id="Button1" type="button" value="Convert" />
    </form>
</body>
</html>
