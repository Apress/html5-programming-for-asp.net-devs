<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BasicStorage.aspx.cs" Inherits="SimpleWebStorage.WebForm1" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script type="text/javascript" src="Scripts/jquery-1.7.2.min.js"></script>
    <script type="text/javascript" src="Scripts/modernizr-2.5.3.js"></script>
    <link rel="stylesheet" type="text/css" href="StyleSheet.css" />
  
    <script type="text/javascript">
      var storage = window.localStorage;

      $(document).ready(function () {
        if (!Modernizr.localstorage) {
          alert("This browser doesn't support HTML5 Local Storage!");
        }

        if (storage["key1"] != null) {
          alert(storage["key1"]);
        }

        window.addEventListener('storage', OnStorage, false);
        $("#store").click(OnStoreClick);
        $("#clear").click(OnClearClick);
      });

      function OnStoreClick(event) {
        var key = $("#keyName").val();
        var value = $("#keyValue").val();
        storage.setItem(key, value);
        $("#tblItems").empty();
        for (var i = 0; i < storage.length; i++)
        {
          $("#tblItems").append("<tr><td>" + storage.key(i) + " = " + storage.getItem(storage.key(i)) + "</td></tr>");
        }
      }

      function OnClearClick(event) {
        storage.clear();
        $("#tblItems").empty();
      }

      function OnStorage(event) {
        alert("Storage event fired for key : " + event.key + " in page " + event.url);
        alert("Old Value - New Value : " + event.oldValue + " - " + event.newValue);
      }
    </script>

</head>
<body>
    <form id="form1" runat="server">
      <h3>Web Storage Demo</h3>
        <div class="table">
	        <div class="row">
		        <div class="cell">Key Name :</div>
                <div class="cell"><input id="keyName" type="text" /></div>
	        </div>
	        <div class="row">
		        <div class="cell">Value :</div>
                <div class="cell"><input id="keyValue" type="text" /></div>
	        </div>
        </div>
        <br />
        <input id="store" type="button" value="Store Data" />
        &nbsp;&nbsp;
        <input id="clear" type="button" value="Clear Data" />
        <br /><br />
        <table id="tblItems" border="1" cellpadding="3"></table>
    </form>
</body>
</html>
