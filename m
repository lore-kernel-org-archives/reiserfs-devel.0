From: "Mike Young" <myoung@wildernessvoice.com>
Subject: ACL Support
Date: Thu, 1 Apr 2004 08:50:39 -0800
Message-ID: <200404011650.IAA23518@amber.he.net>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_006B_01C417C6.68EC8130"
Return-path: <reiserfs-list-return-17648-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
To: reiserfs-list@namesys.com

------=_NextPart_000_006B_01C417C6.68EC8130
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi All,

 

I've been trying to find out information on ACL support in Reiserfs, but
haven't had much luck finding anything but a few exchanges here and there.
There are numerous capabilities within Reiserfs, which I'd like to take
advantage of, but this issue of ACL support is only growing.  The problem
actually consists of trying to store ACLs in a Windows environment.  The
number of ACEs can be quite sufficient that it can require multiple inodes
to store everything.  As an example, XFS has a maximum inode size of 2K,
which is normally fairly sufficient.  However, if I wish to support all of
the Windows ACL set, then 2K is inadequate and 4K would actually be better.
Again, I can use multiple inodes, but this has a significant affect on
performance.  The bottom line is that I love Linux as a server and believe I
should be able to seamlessly support a Windows client.  I just don't want to
be as slow as a Windows server.

 

With that in mind, can someone give me a quick synopsis of how ACLs are
handled in Reiserfs v3 and v4?  Also, if there is a url to the information
I'd appreciate a pointer to it.  Admittedly, I haven't read the man pages.
So, if it's all there, please forgive me.

 

Many thanks,

 

Mike


------=_NextPart_000_006B_01C417C6.68EC8130
Content-Type: text/html;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:o=3D"urn:schemas-microsoft-com:office:office" =
xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns=3D"http://www.w3.org/TR/REC-html40">

<head>
<META HTTP-EQUIV=3D"Content-Type" CONTENT=3D"text/html; =
charset=3Dus-ascii">
<meta name=3DGenerator content=3D"Microsoft Word 11 (filtered medium)">
<style>
<!--
 /* Style Definitions */
 p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	margin-bottom:.0001pt;
	font-size:12.0pt;
	font-family:"Times New Roman";}
a:link, span.MsoHyperlink
	{color:blue;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{color:purple;
	text-decoration:underline;}
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:Arial;
	color:windowtext;}
@page Section1
	{size:8.5in 11.0in;
	margin:1.0in 1.25in 1.0in 1.25in;}
div.Section1
	{page:Section1;}
-->
</style>

</head>

<body lang=3DEN-US link=3Dblue vlink=3Dpurple>

<div class=3DSection1>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>Hi All,<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>I&#8217;ve been trying to find out information on ACL
support in Reiserfs, but haven&#8217;t had much luck finding anything =
but a few
exchanges here and there.&nbsp; There are numerous capabilities within =
Reiserfs, which
I&#8217;d like to take advantage of, but this issue of ACL support is =
only
growing.&nbsp; The problem actually consists of trying to store ACLs in =
a Windows
environment.&nbsp; The number of ACEs can be quite sufficient that it =
can require
multiple inodes to store everything.&nbsp; As an example, XFS has a =
maximum inode
size of 2K, which is normally fairly sufficient.&nbsp; However, if I =
wish to support
all of the Windows ACL set, then 2K is inadequate and 4K would actually =
be
better.&nbsp; Again, I can use multiple inodes, but this has a =
significant affect on
performance.&nbsp; The bottom line is that I love Linux as a server and =
believe I
should be able to seamlessly support a Windows client.&nbsp; I just =
don&#8217;t want
to be as slow as a Windows server.<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>With that in mind, can someone give me a quick =
synopsis of
how ACLs are handled in Reiserfs v3 and v4?&nbsp; Also, if there is a =
url to the
information I&#8217;d appreciate a pointer to it.&nbsp; Admittedly, I =
haven&#8217;t
read the man pages.&nbsp; So, if it&#8217;s all there, please forgive =
me.<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>Many thanks,<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>Mike<o:p></o:p></span></font></p>

</div>

</body>

</html>

------=_NextPart_000_006B_01C417C6.68EC8130--


