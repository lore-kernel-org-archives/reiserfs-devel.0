From: "Sebastian Weitzel" <sebastian.weitzel@fh-stralsund.de>
Subject: ReiserFS Bug - Big Problem
Date: Mon, 17 Jun 2002 11:32:17 +0200
Message-ID: <000001c215e1$df905c00$b44f5ec2@Schleppi>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_0001_01C215F2.A3192C00"
Return-path: <reiserfs-list-return-10756-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
To: reiserfs-list@namesys.com

------=_NextPart_000_0001_01C215F2.A3192C00
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hello,
 
i have a big Problem. My Linux Distribution, a Mandrake 8.2 crashes now
frequently.
 
I have a LVM consisting of two 80gig HDDs, the filesystem is reiserfs.
 
I was unpacking a big file (700 MB) and in this operation the system
crashed. 
To prevent errors I did a reiserfsck, but this stops with:
 
get_next_directory_item: 41005 275370 0x1 DIR is not found
 
I looked in this Directory and saw a subdirectory / . This leads to my
root directory. I cant delete the defective directory, because I fear
loosing my root partition.
 
I did an reiserfsck --rebuildtree but this don't worked also, now every
read operation on this directory crashes my system. Is there an opion to
resolve the problem?
 
 
Please help, Thx
Sebastian Weitzel

------=_NextPart_000_0001_01C215F2.A3192C00
Content-Type: text/html;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:o=3D"urn:schemas-microsoft-com:office:office" =
xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns=3D"http://www.w3.org/TR/REC-html40">

<head>
<META HTTP-EQUIV=3D"Content-Type" CONTENT=3D"text/html; =
charset=3Dus-ascii">


<meta name=3DProgId content=3DWord.Document>
<meta name=3DGenerator content=3D"Microsoft Word 10">
<meta name=3DOriginator content=3D"Microsoft Word 10">
<link rel=3DFile-List href=3D"cid:filelist.xml@01C215F2.A278A640">
<!--[if gte mso 9]><xml>
 <o:OfficeDocumentSettings>
  <o:DoNotRelyOnCSS/>
 </o:OfficeDocumentSettings>
</xml><![endif]--><!--[if gte mso 9]><xml>
 <w:WordDocument>
  <w:SpellingState>Clean</w:SpellingState>
  <w:GrammarState>Clean</w:GrammarState>
  <w:DocumentKind>DocumentEmail</w:DocumentKind>
  <w:HyphenationZone>21</w:HyphenationZone>
  <w:EnvelopeVis/>
  <w:Compatibility>
   <w:BreakWrappedTables/>
   <w:SnapToGridInCell/>
   <w:WrapTextWithPunct/>
   <w:UseAsianBreakRules/>
  </w:Compatibility>
  <w:BrowserLevel>MicrosoftInternetExplorer4</w:BrowserLevel>
 </w:WordDocument>
</xml><![endif]-->
<style>
<!--
 /* Style Definitions */
 p.MsoNormal, li.MsoNormal, div.MsoNormal
	{mso-style-parent:"";
	margin:0cm;
	margin-bottom:.0001pt;
	mso-pagination:widow-orphan;
	font-size:12.0pt;
	font-family:"Times New Roman";
	mso-fareast-font-family:"Times New Roman";}
a:link, span.MsoHyperlink
	{color:blue;
	text-decoration:underline;
	text-underline:single;}
a:visited, span.MsoHyperlinkFollowed
	{color:purple;
	text-decoration:underline;
	text-underline:single;}
span.EmailFormatvorlage17
	{mso-style-type:personal-compose;
	mso-style-noshow:yes;
	mso-ansi-font-size:10.0pt;
	mso-bidi-font-size:10.0pt;
	font-family:Arial;
	mso-ascii-font-family:Arial;
	mso-hansi-font-family:Arial;
	mso-bidi-font-family:Arial;
	color:windowtext;}
span.SpellE
	{mso-style-name:"";
	mso-spl-e:yes;}
span.GramE
	{mso-style-name:"";
	mso-gram-e:yes;}
@page Section1
	{size:595.3pt 841.9pt;
	margin:70.85pt 70.85pt 2.0cm 70.85pt;
	mso-header-margin:35.4pt;
	mso-footer-margin:35.4pt;
	mso-paper-source:0;}
div.Section1
	{page:Section1;}
-->
</style>
<!--[if gte mso 10]>
<style>
 /* Style Definitions */=20
 table.MsoNormalTable
	{mso-style-name:"Normale Tabelle";
	mso-tstyle-rowband-size:0;
	mso-tstyle-colband-size:0;
	mso-style-noshow:yes;
	mso-style-parent:"";
	mso-padding-alt:0cm 5.4pt 0cm 5.4pt;
	mso-para-margin:0cm;
	mso-para-margin-bottom:.0001pt;
	mso-pagination:widow-orphan;
	font-size:10.0pt;
	font-family:"Times New Roman";}
</style>
<![endif]-->
</head>

<body lang=3DDE link=3Dblue vlink=3Dpurple =
style=3D'tab-interval:35.4pt'>

<div class=3DSection1>

<p class=3DMsoNormal><span class=3DSpellE><font size=3D2 =
face=3DArial><span
style=3D'font-size:10.0pt;font-family:Arial'>Hello</span></font></span><f=
ont
size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;font-family:Arial'>,<o:p></o:p></span></font></=
p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal><span class=3DSpellE><span class=3DGramE><font =
size=3D2
face=3DArial><span lang=3DEN-GB =
style=3D'font-size:10.0pt;font-family:Arial;
mso-ansi-language:EN-GB'>i</span></font></span></span><font size=3D2 =
face=3DArial><span
lang=3DEN-GB =
style=3D'font-size:10.0pt;font-family:Arial;mso-ansi-language:EN-GB'>
have a big Problem. My Linux Distribution, a Mandrake 8.2 crashes now
frequently.<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span lang=3DEN-GB =
style=3D'font-size:
10.0pt;font-family:Arial;mso-ansi-language:EN-GB'><o:p>&nbsp;</o:p></span=
></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span lang=3DEN-GB =
style=3D'font-size:
10.0pt;font-family:Arial;mso-ansi-language:EN-GB'>I have a LVM =
consisting of
two 80gig <span class=3DSpellE>HDDs</span>, the <span =
class=3DSpellE>filesystem</span>
is <span class=3DSpellE>reiserfs</span>.<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span lang=3DEN-GB =
style=3D'font-size:
10.0pt;font-family:Arial;mso-ansi-language:EN-GB'><o:p>&nbsp;</o:p></span=
></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span lang=3DEN-GB =
style=3D'font-size:
10.0pt;font-family:Arial;mso-ansi-language:EN-GB'>I was unpacking a big =
file
(700 MB) and in this operation the system crashed. =
<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span lang=3DEN-GB =
style=3D'font-size:
10.0pt;font-family:Arial;mso-ansi-language:EN-GB'>To prevent errors I =
did a <span
class=3DSpellE>reiserfsck</span>, but this stops =
with:<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span lang=3DEN-GB =
style=3D'font-size:
10.0pt;font-family:Arial;mso-ansi-language:EN-GB'><o:p>&nbsp;</o:p></span=
></font></p>

<p class=3DMsoNormal><span class=3DSpellE><font size=3D2 =
face=3DArial><span lang=3DEN-GB
style=3D'font-size:10.0pt;font-family:Arial;mso-ansi-language:EN-GB'>get_=
next_directory_item</span></font></span><font
size=3D2 face=3DArial><span lang=3DEN-GB =
style=3D'font-size:10.0pt;font-family:Arial;
mso-ansi-language:EN-GB'>: 41005 275370 0x1 DIR is not =
found<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span lang=3DEN-GB =
style=3D'font-size:
10.0pt;font-family:Arial;mso-ansi-language:EN-GB'><o:p>&nbsp;</o:p></span=
></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span lang=3DEN-GB =
style=3D'font-size:
10.0pt;font-family:Arial;mso-ansi-language:EN-GB'>I looked in this =
Directory
and saw a subdirectory / &#8230; This leads to my root directory. I =
<span
class=3DGramE>cant</span> delete the defective directory, because I fear =
loosing
my root partition.<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span lang=3DEN-GB =
style=3D'font-size:
10.0pt;font-family:Arial;mso-ansi-language:EN-GB'><o:p>&nbsp;</o:p></span=
></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span lang=3DEN-GB =
style=3D'font-size:
10.0pt;font-family:Arial;mso-ansi-language:EN-GB'>I did <span =
class=3DGramE>an</span>
<span class=3DSpellE>reiserfsck</span> --<span =
class=3DSpellE>rebuildtree</span> but
this don&#8217;t worked also, now every read operation on this directory
crashes my system. Is there an <span class=3DSpellE>opion</span> to =
resolve the
problem?<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span lang=3DEN-GB =
style=3D'font-size:
10.0pt;font-family:Arial;mso-ansi-language:EN-GB'><o:p>&nbsp;</o:p></span=
></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span lang=3DEN-GB =
style=3D'font-size:
10.0pt;font-family:Arial;mso-ansi-language:EN-GB'><o:p>&nbsp;</o:p></span=
></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span lang=3DEN-GB =
style=3D'font-size:
10.0pt;font-family:Arial;mso-ansi-language:EN-GB'>Please help, =
Thx<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span lang=3DEN-GB =
style=3D'font-size:
10.0pt;font-family:Arial;mso-ansi-language:EN-GB'>Sebastian <span =
class=3DSpellE>Weitzel</span><o:p></o:p></span></font></p>

</div>

</body>

</html>

------=_NextPart_000_0001_01C215F2.A3192C00--

