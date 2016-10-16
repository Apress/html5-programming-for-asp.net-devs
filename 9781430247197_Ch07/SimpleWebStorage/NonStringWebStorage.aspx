<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="NonStringWebStorage.aspx.cs" Inherits="SimpleWebStorage.NonStringWebStorage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script type="text/javascript" src="Scripts/jquery-1.7.2.min.js"></script>
    <script type="text/javascript" src="Scripts/modernizr-2.5.3.js"></script>

    <script type="text/javascript">
      $(document).ready(function () {
        var storage = window.localStorage;
        //number
        storage["number1"] = 10;
        storage["number2"] = 20;
        var sum1 = storage["number1"] + storage["number2"];
        var sum2 = Number(storage["number1"]) + Number(storage["number2"]);
        alert("Without conversion Sum = " + sum1 + "\r\n" + "With conversion Sum = " + sum2);
        //date
        storage["date"] = new Date(2012,5,15);
        var date1 = storage["date"];
        try{
          alert("Without conversion Year = " + date1.getFullYear());
        }
        catch(e){
          alert("Data is not of date type!");
        }
        var date2 = new Date(storage["date"]);
        try {
          alert("With conversion Year = " + date2.getFullYear());
        }
        catch (e) {
          alert("Data is not of date type!");
        }
        //JSON objects
        var object1 = { "Name": "Tom", "Age": 50 };
        storage["object"] = JSON.stringify(object1);
        var object2 = JSON.parse(storage["object"]);
        alert(object2.Name + " (" + object2.Age + " years)");
      });
    </script>
</head>
<body>
    <form id="form1" runat="server">
      
    </form>
</body>
</html>
