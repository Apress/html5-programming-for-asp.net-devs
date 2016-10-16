<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Silverlight.aspx.cs" Inherits="EmbedSilverlight.Silverlight" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
<div id="silverlightvideocontainer">
	<object data="data:application/x-silverlight-2" type="application/x-silverlight-2" width="300" height="300">
		<param name="source" value="silverlightvideos/CleanTemplate.xap"/>
		<param name="background" value="white" />
		<param name="minRuntimeVersion" value="4.0.50401.0" />
		<param name="autoUpgrade" value="true" />
		<param name="enableHtmlAccess" value="true" />
		<param name="enableGPUAcceleration" value="true" />
		<param name="initparams" value='playerSettings = 
		<Playlist>
			<DisplayTimeCode>false</DisplayTimeCode>
<EnableCachedComposition>true</EnableCachedComposition>
<EnableCaptions>true</EnableCaptions>
<EnableOffline>true</EnableOffline>
<EnablePopOut>true</EnablePopOut>
<StartMuted>false</StartMuted>
<StartWithPlaylistShowing>false</StartWithPlaylistShowing>
<StretchNonSquarePixels>NoStretch</StretchNonSquarePixels>
			<Items>
				<PlaylistItem>
					<AudioCodec>WmaProfessional</AudioCodec>
					<Description></Description>
					<FileSize>1349539</FileSize>
					<FrameRate>25</FrameRate>
					<Height>360</Height>
					<IsAdaptiveStreaming>false</IsAdaptiveStreaming>
					<MediaSource>silverlightvideos/Video2.wmv</MediaSource>
					<ThumbSource></ThumbSource>
					<Title></Title>
					<VideoCodec>VC1</VideoCodec>
					<Width>640</Width>
				</PlaylistItem>
			</Items>
		</Playlist>'/>
<a href="http://go2.microsoft.com/fwlink/?LinkID=124807" style="text-decoration: none;">
			<img src="http://go2.microsoft.com/fwlink/?LinkId=108181" alt="Get Microsoft Silverlight" style="border-style: none;"/>
		</a>
	</object>
	<iframe id="I1" style='visibility:hidden;height:0;width:0;border:0px;' name="I1">
	</iframe></div>
</body>
</html>
