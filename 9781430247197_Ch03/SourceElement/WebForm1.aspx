<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="SourceElement.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>

<video controls>
  <source src="media/video1.mp4" type="video/mp4" />
  <source src="media/video1.ogv" type="video/ogg" />
  <source src="media/video1.webm" type="video/webm" />
  <object id="flash1" data="Media/Video1.swf" type="application/x-shockwave-flash">
	  <param name="movie" value="Media/Video1.swf">
  </object>
</video>

</body>
</html>
