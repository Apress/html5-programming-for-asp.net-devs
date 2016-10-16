<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<!DOCTYPE html>

<html>
<head runat="server">
    <title>Index</title>
    <link rel="stylesheet" type="text/css" href="../../Content/Site.css" />
    <script type="text/javascript" src="../../Scripts/jquery-1.6.2.js"></script>
    <script type="text/javascript" src="../../Scripts/modernizr-2.0.6-development-only.js"></script>

      <script type="text/javascript">
        var storage = window.localStorage;
        $(document).ready(function () {
          if (!Modernizr.localstorage) {
            alert("This browser doesn't support HTML5 Local Storage!");
          }

          $("#submit").click(SubmitData);
          $("#postback").click(OnPostback);

          $("#firstName").change(function () { alert($(this).val()); storage["FirstName"] = $(this).val(); });
          $("#lastName").change(function () { storage["LastName"] = $(this).val(); });
          $("#email").change(function () { storage["Email"] = $(this).val(); });

          $("#firstName").val(storage["FirstName"]);
          $("#lastName").val(storage["LastName"]);
          $("#email").val(storage["Email"]);

          GetQuestions();

        })

        function GetQuestions() {
          $.ajax({
            type: "POST",
            url: "/Home/GetQuestions",
            dataType: "json",
            contentType: "application/json; charset=utf-8",
            success: function (results) {
              for (var i = 0; i < results.length; i++) {
                $("#container").append("<div data-questions-questionid='" +
                                          results[i].QuestionID + "'>" + 
                                          results[i].QuestionText + "</div>");
                $("div[data-questions-questionid]").addClass("paddedDiv");
              }
              GetChoices();
            },
            error: function (err) {
              alert(err.status + " - " + err.statusText);
            }
          })
        }

        function GetChoices() {
          $.ajax({
            type: "POST",
            url: "/Home/GetChoices",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function(results){
              for (var i = 0; i < results.length; i++) {
                $("div[data-questions-questionid='" + results[i].QuestionID + "']").append(
                  "<br /><input type='checkbox' data-choices-questionid='" + results[i].QuestionID + 
                  "' data-choices-choiceid='" + results[i].ChoiceID + 
                  "'/><span>" + results[i].ChoiceText + "</span>");
                if (storage[results[i].ChoiceID] != null) {
                  var choiceId = results[i].ChoiceID;
                  $("input[data-choices-choiceid='" + choiceId + "']").attr('checked', 'checked');
                }
              }
              $("input[data-choices-questionid]").change(function (event) {
                var key = $(event.target).attr("data-choices-choiceid");
                if ($(event.target).is(':checked') == true) {
                  storage[key] = $(event.target).attr("data-choices-questionid");
                }
                else {
                  storage.removeItem(key);
                }
              });            
            },
            error: function (err) {
              alert(err.status + " - " + err.statusText);
            }
          })
        }

        function SubmitData(event) {
          var data = '';
          for (var i = 0; i < storage.length; i++) {
            var key = storage.key(i);
            var value = storage[key];
            var pair = '"' + key + '":"' + value + '"';
            data = data + pair + ",";
          }
          if (data.charAt(data.length - 1) == ',') {
            data = data.substring(0, data.length - 1)
          }
          data = '{' + data + '}';
          alert(data);
          $.ajax({
            type: "POST",
            url: "/Home/SaveResults",
            contentType: "application/json; charset=utf-8",
            data: data,
            dataType: "json",
            success: function(results){
              alert('Results saved!');
              window.localStorage.clear();
            },
            error: function (err) {
              alert(err.status + " - " + err.statusText);
            }
          })
        }

        function OnPostback() {
          var data = '';
          for (var i = 0; i < storage.length; i++) {
            var key = storage.key(i);
            var value = storage[key];
            var pair = '"' + key + '":"' + value + '"';
            data = data + pair + ",";
          }
          if (data.charAt(data.length - 1) == ',') {
            data = data.substring(0, data.length - 1)
          }
          data = '{' + data + '}';
          $("#hiddenAnswers").val(data);
        }

        </script>
</head>
<body>
    <form id="form1" method="post" action="/home/index">
    <h3>User Info</h3>
    <div class="table">
	    <div class="row">
		    <div class="cell">First Name :</div>
            <div class="cell"><input id="firstName" type="text" required="required" /></div>
	    </div>
	    <div class="row">
		    <div class="cell">Last Name :</div>
            <div class="cell"><input id="lastName" type="text" required="required" /></div>
	    </div>
	    <div class="row">
		    <div class="cell">Email :</div>
            <div class="cell"><input id="email" type="email" /></div>
	    </div>
    </div>
    <h3>Survey Questions</h3>
    <div id="container"></div>
    <input id="submit" type="button" value="Submit Answers" />
    <input type="hidden" id="hiddenAnswers" name="hiddenAnswers"/>
    <input id="postback" type="Submit" value="Submit Answers" />
    <div id="temp"></div>
    </form>
</body>
</html>
