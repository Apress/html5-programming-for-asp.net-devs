<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Flash.aspx.cs" Inherits="EmbedFlashSilverlight.Flash" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>

<h2>Play Audio File</h2>
<object data="Media/Song.mp3" height="100" />
   
<h2>Play Video File</h2>
<object id="flash1" data="Media/Video1.swf" height="200" type="application/x-shockwave-flash" width="200">
	<param name="movie" value="Media/Video1.swf">
</object>

</body>
</html>
