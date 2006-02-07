From: "Jeff Thayer" <jthayer@idanalytics.com>
Subject: journal-1413: journal_mark_dirty: j_len (1024) is too big
Date: Tue, 7 Feb 2006 10:49:42 -0800
Message-ID: <9D15A798843E614AB379904106AF5A16779DC5@COMAIL3.corp.idanalytics.com>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----_=_NextPart_001_01C62C17.41CCC998"
Return-path: <reiserfs-list-return-28040-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
content-class: urn:content-classes:message
List-Id: <reiserfs-devel.vger.kernel.org>
To: reiserfs-list@namesys.com

------_=_NextPart_001_01C62C17.41CCC998
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Getting this error on a SUSE SLES 9.0 box.  Here's some relevant info
and the error is below.
=20
Any ideas?  Thanks in advance!
=20
Jeff Thayer
Linux Administrator
------------------------------------------------------------------------
------------
=20
# mkreiserfs -V
mkreiserfs 3.6.19 (2003 www.namesys.com)
=20
# uname -a
Linux host1 2.6.5-7.191-smp #1 SMP Tue Jun 28 14:58:56 UTC 2005 i686
i686 i386 GNU/Linux
=20
# cat /etc/*rel*
SUSE LINUX Enterprise Server 9 (i586)
VERSION =3D 9
PATCHLEVEL =3D 2
=20
Feb  6 14:08:20 host1 kernel: REISERFS: panic (device cciss/c0d0p6):
journal-1413: journal_mark_dirty: j_len (1024) is too big
Feb  6 14:08:20 host1 kernel:
Feb  6 14:08:20 host1 kernel: ------------[ cut here ]------------
Feb  6 14:08:20 host1 kernel: kernel BUG at fs/reiserfs/prints.c:362!
Feb  6 14:08:20 host1 kernel: invalid operand: 0000 [#1]
Feb  6 14:08:20 host1 kernel: SMP
Feb  6 14:08:20 host1 kernel: CPU:    1
Feb  6 14:08:20 host1 kernel: EIP:    0060:[<f88cc0ad>]    Not tainted
Feb  6 14:08:20 host1 kernel: EFLAGS: 00010296   (2.6.5-7.191-smp
SLES9_SP2_BRANCH-200506281458560000)
Feb  6 14:08:20 host1 kernel: EIP is at reiserfs_panic+0x3d/0x70
[reiserfs]
Feb  6 14:08:20 host1 kernel: eax: 00000065   ebx: f76fbc00   ecx:
c03a96dc   edx: c03a96dc
Feb  6 14:08:20 host1 kernel: esi: f76fbc00   edi: f59ee4f4   ebp:
f8bc7000   esp: e5955ac4
Feb  6 14:08:20 host1 kernel: ds: 007b   es: 007b   ss: 0068
Feb  6 14:08:20 host1 kernel: Process rm (pid: 11107,
threadinfo=3De5954000 task=3De4940010)
Feb  6 14:08:20 host1 kernel: Stack: f88e6174 f76fbd3c f88f2e20 f88e6fb8
f88d8ba8 f76fbc00 f88e6fb8 00000400
Feb  6 14:08:20 host1 kernel:        00000000 e5955eec f76fbc00 f8bc70cc
05effffa f88d8e22 00000000 e5955eec
Feb  6 14:08:20 host1 kernel:        00007ffa f76fbc00 05effffa 00000bdf
f88b36d1 f8bc7100 00000000 f8bc7000
Feb  6 14:08:20 host1 kernel: Call Trace:
Feb  6 14:08:20 host1 kernel:  [<f88d8ba8>]
journal_mark_dirty+0x248/0x260 [reiserfs]
Feb  6 14:08:20 host1 kernel:  [<f88d8e22>]
journal_mark_freed+0x1c2/0x310 [reiserfs]
Feb  6 14:08:20 host1 kernel:  [<f88b36d1>]
_reiserfs_free_block+0x111/0x1b0 [reiserfs]
Feb  6 14:08:20 host1 kernel:  [<f88d4bd5>]
prepare_for_delete_or_cut+0x425/0x7b0 [reiserfs]
Feb  6 14:08:20 host1 kernel:  [<f88d5389>]
reiserfs_cut_from_item+0xb9/0x990 [reiserfs]
Feb  6 14:08:20 host1 kernel:  [<c015b184>] mark_page_accessed+0x34/0x40
Feb  6 14:08:20 host1 kernel:  [<c01779b1>] __find_get_block+0xa1/0x1b0
Feb  6 14:08:20 host1 kernel:  [<c0178666>] wake_up_buffer+0x6/0x30
Feb  6 14:08:20 host1 kernel:  [<c0178719>] ll_rw_block+0x49/0x90
Feb  6 14:08:20 host1 kernel:  [<f88d5f4b>]
reiserfs_do_truncate+0x2eb/0x5f0 [reiserfs]
Feb  6 14:08:20 host1 kernel:  [<f88d6280>]
reiserfs_delete_object+0x30/0x70 [reiserfs]
Feb  6 14:08:20 host1 kernel:  [<f88c0fae>]
reiserfs_delete_inode+0xde/0x138 [reiserfs]
Feb  6 14:08:20 host1 kernel:  [<f88df64f>] reiserfs_permission+0xf/0x20
[reiserfs]
Feb  6 14:08:20 host1 kernel:  [<f88c0ed0>]
reiserfs_delete_inode+0x0/0x138 [reiserfs]
Feb  6 14:08:20 host1 kernel:  [<c0192414>]
generic_delete_inode+0xa4/0x160
Feb  6 14:08:20 host1 kernel:  [<c01917ce>] iput+0x5e/0x90
Feb  6 14:08:20 host1 kernel:  [<c0187b76>] sys_unlink+0x166/0x1d0
Feb  6 14:08:20 host1 kernel:  [<c0110a35>] do_mmap2+0x105/0x160
Feb  6 14:08:20 host1 kernel:  [<c01091d9>] sysenter_past_esp+0x52/0x79
Feb  6 14:08:20 host1 kernel:
Feb  6 14:08:20 host1 kernel: Code: 0f 0b 6a 01 2b 3c 8e f8 85 db b8 1b
3c 8e f8 74 06 8d 83 3c
=20

------_=_NextPart_001_01C62C17.41CCC998
Content-Type: text/html;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" =
xmlns:o=3D"urn:schemas-microsoft-com:office:office" =
xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:st1=3D"urn:schemas-microsoft-com:office:smarttags" =
xmlns=3D"http://www.w3.org/TR/REC-html40">

<head>
<meta http-equiv=3DContent-Type content=3D"text/html; =
charset=3Dus-ascii">
<meta name=3DProgId content=3DWord.Document>
<meta name=3DGenerator content=3D"Microsoft Word 10">
<meta name=3DOriginator content=3D"Microsoft Word 10">
<link rel=3DFile-List href=3D"cid:filelist.xml@01C62BD4.33908C10">
<o:SmartTagType =
namespaceuri=3D"urn:schemas-microsoft-com:office:smarttags"
 name=3D"time"/>
<!--[if gte mso 9]><xml>
 <o:OfficeDocumentSettings>
  <o:DoNotRelyOnCSS/>
 </o:OfficeDocumentSettings>
</xml><![endif]--><!--[if gte mso 9]><xml>
 <w:WordDocument>
  <w:SpellingState>Clean</w:SpellingState>
  <w:GrammarState>Clean</w:GrammarState>
  <w:DocumentKind>DocumentEmail</w:DocumentKind>
  <w:EnvelopeVis/>
  <w:Compatibility>
   <w:BreakWrappedTables/>
   <w:SnapToGridInCell/>
   <w:WrapTextWithPunct/>
   <w:UseAsianBreakRules/>
  </w:Compatibility>
  <w:BrowserLevel>MicrosoftInternetExplorer4</w:BrowserLevel>
 </w:WordDocument>
</xml><![endif]--><!--[if !mso]>
<style>
st1\:*{behavior:url(#default#ieooui) }
</style>
<![endif]-->
<style>
<!--
 /* Style Definitions */
 p.MsoNormal, li.MsoNormal, div.MsoNormal
	{mso-style-parent:"";
	margin:0in;
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
span.EmailStyle17
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
	{size:8.5in 11.0in;
	margin:1.0in 1.25in 1.0in 1.25in;
	mso-header-margin:.5in;
	mso-footer-margin:.5in;
	mso-paper-source:0;}
div.Section1
	{page:Section1;}
-->
</style>
<!--[if gte mso 10]>
<style>
 /* Style Definitions */=20
 table.MsoNormalTable
	{mso-style-name:"Table Normal";
	mso-tstyle-rowband-size:0;
	mso-tstyle-colband-size:0;
	mso-style-noshow:yes;
	mso-style-parent:"";
	mso-padding-alt:0in 5.4pt 0in 5.4pt;
	mso-para-margin:0in;
	mso-para-margin-bottom:.0001pt;
	mso-pagination:widow-orphan;
	font-size:10.0pt;
	font-family:"Times New Roman";}
</style>
<![endif]-->
</head>

<body lang=3DEN-US link=3Dblue vlink=3Dpurple =
style=3D'tab-interval:.5in'>

<div class=3DSection1>

<p class=3DMsoNormal><span class=3DGramE><font size=3D2 =
face=3DArial><span
style=3D'font-size:10.0pt;font-family:Arial'>Getting this error on a =
SUSE SLES
9.0 box.</span></font></span><font size=3D2 face=3DArial><span =
style=3D'font-size:
10.0pt;font-family:Arial'><span style=3D'mso-spacerun:yes'>&nbsp; =
</span>Here&#8217;s
some relevant info and the error is below.<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal><span class=3DGramE><font size=3D2 =
face=3DArial><span
style=3D'font-size:10.0pt;font-family:Arial'>Any =
ideas?</span></font></span><font
size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;font-family:Arial'><span
style=3D'mso-spacerun:yes'>&nbsp; </span>Thanks in =
advance!<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial;mso-no-proof:yes'>Jeff Thayer</span></font><span
style=3D'mso-no-proof:yes'><o:p></o:p></span></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial;mso-no-proof:yes'>Linux =
Administrator<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D3 face=3D"Times New Roman"><span =
style=3D'font-size:
12.0pt;mso-no-proof:yes'>------------------------------------------------=
------------------------------------<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'># mkreiserfs -V<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>mkreiserfs 3.6.19 (2003 =
www.namesys.com)<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'># uname -a<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>Linux host1 2.6.5-7.191-smp #1 SMP Tue Jun 28 =
</span></font><st1:time
Hour=3D"14" Minute=3D"58"><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
 font-family:Arial'>14:58:56 UTC</span></font></st1:time><font size=3D2
face=3DArial><span style=3D'font-size:10.0pt;font-family:Arial'> 2005 =
i686 i686
i386 GNU/Linux<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'># cat /etc/*rel*<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>SUSE LINUX Enterprise Server 9 =
(i586)<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>VERSION =3D 9<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>PATCHLEVEL =3D 2<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>Feb<span style=3D'mso-spacerun:yes'>&nbsp; </span>6 =
</span></font><st1:time
Hour=3D"14" Minute=3D"8"><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
 font-family:Arial'>14:08:20</span></font></st1:time><font size=3D2 =
face=3DArial><span
style=3D'font-size:10.0pt;font-family:Arial'> host1 kernel: REISERFS: =
panic
(device cciss/c0d0p6): journal-1413: journal_mark_dirty: j_len (1024) is =
too
big<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>Feb<span style=3D'mso-spacerun:yes'>&nbsp; </span>6 =
</span></font><st1:time
Hour=3D"14" Minute=3D"8"><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
 font-family:Arial'>14:08:20</span></font></st1:time><font size=3D2 =
face=3DArial><span
style=3D'font-size:10.0pt;font-family:Arial'> host1 =
kernel:<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>Feb<span style=3D'mso-spacerun:yes'>&nbsp; </span>6 =
</span></font><st1:time
Hour=3D"14" Minute=3D"8"><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
 font-family:Arial'>14:08:20</span></font></st1:time><font size=3D2 =
face=3DArial><span
style=3D'font-size:10.0pt;font-family:Arial'> host1 kernel: =
------------[ cut
here ]------------<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>Feb<span style=3D'mso-spacerun:yes'>&nbsp; </span>6 =
</span></font><st1:time
Hour=3D"14" Minute=3D"8"><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
 font-family:Arial'>14:08:20</span></font></st1:time><font size=3D2 =
face=3DArial><span
style=3D'font-size:10.0pt;font-family:Arial'> host1 kernel: kernel BUG =
at
fs/reiserfs/prints.c:362!<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>Feb<span style=3D'mso-spacerun:yes'>&nbsp; </span>6 =
</span></font><st1:time
Hour=3D"14" Minute=3D"8"><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
 font-family:Arial'>14:08:20</span></font></st1:time><font size=3D2 =
face=3DArial><span
style=3D'font-size:10.0pt;font-family:Arial'> host1 kernel: invalid =
operand: 0000
[#1]<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>Feb<span style=3D'mso-spacerun:yes'>&nbsp; </span>6 =
</span></font><st1:time
Hour=3D"14" Minute=3D"8"><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
 font-family:Arial'>14:08:20</span></font></st1:time><font size=3D2 =
face=3DArial><span
style=3D'font-size:10.0pt;font-family:Arial'> host1 kernel: =
SMP<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>Feb<span style=3D'mso-spacerun:yes'>&nbsp; </span>6 =
</span></font><st1:time
Hour=3D"14" Minute=3D"8"><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
 font-family:Arial'>14:08:20</span></font></st1:time><font size=3D2 =
face=3DArial><span
style=3D'font-size:10.0pt;font-family:Arial'> host1 kernel: CPU:<span
style=3D'mso-spacerun:yes'>&nbsp;&nbsp;&nbsp; =
</span>1<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>Feb<span style=3D'mso-spacerun:yes'>&nbsp; </span>6 =
</span></font><st1:time
Hour=3D"14" Minute=3D"8"><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
 font-family:Arial'>14:08:20</span></font></st1:time><font size=3D2 =
face=3DArial><span
style=3D'font-size:10.0pt;font-family:Arial'> host1 kernel: EIP:<span
style=3D'mso-spacerun:yes'>&nbsp;&nbsp;&nbsp; =
</span>0060:[&lt;f88cc0ad&gt;]<span
style=3D'mso-spacerun:yes'>&nbsp;&nbsp;&nbsp; </span>Not =
tainted<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>Feb<span style=3D'mso-spacerun:yes'>&nbsp; </span>6 =
</span></font><st1:time
Hour=3D"14" Minute=3D"8"><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
 font-family:Arial'>14:08:20</span></font></st1:time><font size=3D2 =
face=3DArial><span
style=3D'font-size:10.0pt;font-family:Arial'> host1 kernel: EFLAGS: =
00010296<span
style=3D'mso-spacerun:yes'>&nbsp;&nbsp; </span>(2.6.5-7.191-smp
SLES9_SP2_BRANCH-200506281458560000)<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>Feb<span style=3D'mso-spacerun:yes'>&nbsp; </span>6 =
</span></font><st1:time
Hour=3D"14" Minute=3D"8"><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
 font-family:Arial'>14:08:20</span></font></st1:time><font size=3D2 =
face=3DArial><span
style=3D'font-size:10.0pt;font-family:Arial'> host1 kernel: EIP is at
reiserfs_panic+0x3d/0x70 [reiserfs]<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>Feb<span style=3D'mso-spacerun:yes'>&nbsp; </span>6 =
</span></font><st1:time
Hour=3D"14" Minute=3D"8"><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
 font-family:Arial'>14:08:20</span></font></st1:time><font size=3D2 =
face=3DArial><span
style=3D'font-size:10.0pt;font-family:Arial'> host1 kernel: eax: =
00000065<span
style=3D'mso-spacerun:yes'>&nbsp;&nbsp; </span>ebx: f76fbc00<span
style=3D'mso-spacerun:yes'>&nbsp;&nbsp; </span>ecx: c03a96dc<span
style=3D'mso-spacerun:yes'>&nbsp;&nbsp; </span>edx: =
c03a96dc<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>Feb<span style=3D'mso-spacerun:yes'>&nbsp; </span>6 =
</span></font><st1:time
Hour=3D"14" Minute=3D"8"><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
 font-family:Arial'>14:08:20</span></font></st1:time><font size=3D2 =
face=3DArial><span
style=3D'font-size:10.0pt;font-family:Arial'> host1 kernel: esi: =
f76fbc00<span
style=3D'mso-spacerun:yes'>&nbsp;&nbsp; </span>edi: f59ee4f4<span
style=3D'mso-spacerun:yes'>&nbsp;&nbsp; </span>ebp: f8bc7000<span
style=3D'mso-spacerun:yes'>&nbsp;&nbsp; </span>esp: =
e5955ac4<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>Feb<span style=3D'mso-spacerun:yes'>&nbsp; </span>6 =
</span></font><st1:time
Hour=3D"14" Minute=3D"8"><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
 font-family:Arial'>14:08:20</span></font></st1:time><font size=3D2 =
face=3DArial><span
style=3D'font-size:10.0pt;font-family:Arial'> host1 kernel: ds: =
007b<span
style=3D'mso-spacerun:yes'>&nbsp;&nbsp; </span>es: 007b<span
style=3D'mso-spacerun:yes'>&nbsp;&nbsp; </span><span =
class=3DSpellE>ss</span>: 0068<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>Feb<span style=3D'mso-spacerun:yes'>&nbsp; </span>6 =
</span></font><st1:time
Hour=3D"14" Minute=3D"8"><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
 font-family:Arial'>14:08:20</span></font></st1:time><font size=3D2 =
face=3DArial><span
style=3D'font-size:10.0pt;font-family:Arial'> host1 kernel: Process =
<span
class=3DSpellE>rm</span> (<span class=3DSpellE>pid</span>: 11107, <span
class=3DSpellE>threadinfo</span>=3De5954000 =
task=3De4940010)<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>Feb<span style=3D'mso-spacerun:yes'>&nbsp; </span>6 =
</span></font><st1:time
Hour=3D"14" Minute=3D"8"><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
 font-family:Arial'>14:08:20</span></font></st1:time><font size=3D2 =
face=3DArial><span
style=3D'font-size:10.0pt;font-family:Arial'> host1 kernel: Stack: =
f88e6174
f76fbd3c f88f2e20 f88e6fb8 f88d8ba8 f76fbc00 f88e6fb8 =
00000400<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>Feb<span style=3D'mso-spacerun:yes'>&nbsp; </span>6 =
</span></font><st1:time
Hour=3D"14" Minute=3D"8"><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
 font-family:Arial'>14:08:20</span></font></st1:time><font size=3D2 =
face=3DArial><span
style=3D'font-size:10.0pt;font-family:Arial'> host1 kernel:<span
style=3D'mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span>00000000 e5955eec f76fbc00 f8bc70cc 05effffa f88d8e22 00000000 =
e5955eec<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>Feb<span style=3D'mso-spacerun:yes'>&nbsp; </span>6 =
</span></font><st1:time
Hour=3D"14" Minute=3D"8"><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
 font-family:Arial'>14:08:20</span></font></st1:time><font size=3D2 =
face=3DArial><span
style=3D'font-size:10.0pt;font-family:Arial'> host1 kernel:<span
style=3D'mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span>00007ffa f76fbc00 05effffa 00000bdf f88b36d1 f8bc7100 00000000 =
f8bc7000<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>Feb<span style=3D'mso-spacerun:yes'>&nbsp; </span>6 =
</span></font><st1:time
Hour=3D"14" Minute=3D"8"><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
 font-family:Arial'>14:08:20</span></font></st1:time><font size=3D2 =
face=3DArial><span
style=3D'font-size:10.0pt;font-family:Arial'> host1 kernel: Call =
Trace:<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>Feb<span style=3D'mso-spacerun:yes'>&nbsp; </span>6 =
</span></font><st1:time
Hour=3D"14" Minute=3D"8"><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
 font-family:Arial'>14:08:20</span></font></st1:time><font size=3D2 =
face=3DArial><span
style=3D'font-size:10.0pt;font-family:Arial'> host1 kernel:<span
style=3D'mso-spacerun:yes'>&nbsp; </span>[&lt;f88d8ba8&gt;] =
journal_mark_dirty+0x248/0x260
[reiserfs]<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>Feb<span style=3D'mso-spacerun:yes'>&nbsp; </span>6 =
</span></font><st1:time
Hour=3D"14" Minute=3D"8"><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
 font-family:Arial'>14:08:20</span></font></st1:time><font size=3D2 =
face=3DArial><span
style=3D'font-size:10.0pt;font-family:Arial'> host1 kernel:<span
style=3D'mso-spacerun:yes'>&nbsp; </span>[&lt;f88d8e22&gt;]
journal_mark_freed+0x1c2/0x310 [reiserfs]<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>Feb<span style=3D'mso-spacerun:yes'>&nbsp; </span>6 =
</span></font><st1:time
Hour=3D"14" Minute=3D"8"><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
 font-family:Arial'>14:08:20</span></font></st1:time><font size=3D2 =
face=3DArial><span
style=3D'font-size:10.0pt;font-family:Arial'> host1 kernel:<span
style=3D'mso-spacerun:yes'>&nbsp; </span>[&lt;f88b36d1&gt;]
_reiserfs_free_block+0x111/0x1b0 [reiserfs]<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>Feb<span style=3D'mso-spacerun:yes'>&nbsp; </span>6 =
</span></font><st1:time
Hour=3D"14" Minute=3D"8"><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
 font-family:Arial'>14:08:20</span></font></st1:time><font size=3D2 =
face=3DArial><span
style=3D'font-size:10.0pt;font-family:Arial'> host1 kernel:<span
style=3D'mso-spacerun:yes'>&nbsp; </span>[&lt;f88d4bd5&gt;] =
prepare_for_delete_or_cut+0x425/0x7b0
[reiserfs]<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>Feb<span style=3D'mso-spacerun:yes'>&nbsp; </span>6 =
</span></font><st1:time
Hour=3D"14" Minute=3D"8"><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
 font-family:Arial'>14:08:20</span></font></st1:time><font size=3D2 =
face=3DArial><span
style=3D'font-size:10.0pt;font-family:Arial'> host1 kernel:<span
style=3D'mso-spacerun:yes'>&nbsp; </span>[&lt;f88d5389&gt;]
reiserfs_cut_from_item+0xb9/0x990 =
[reiserfs]<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>Feb<span style=3D'mso-spacerun:yes'>&nbsp; </span>6 =
</span></font><st1:time
Hour=3D"14" Minute=3D"8"><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
 font-family:Arial'>14:08:20</span></font></st1:time><font size=3D2 =
face=3DArial><span
style=3D'font-size:10.0pt;font-family:Arial'> host1 kernel:<span
style=3D'mso-spacerun:yes'>&nbsp; </span>[&lt;c015b184&gt;]
mark_page_accessed+0x34/0x40<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>Feb<span style=3D'mso-spacerun:yes'>&nbsp; </span>6 =
</span></font><st1:time
Hour=3D"14" Minute=3D"8"><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
 font-family:Arial'>14:08:20</span></font></st1:time><font size=3D2 =
face=3DArial><span
style=3D'font-size:10.0pt;font-family:Arial'> host1 kernel:<span
style=3D'mso-spacerun:yes'>&nbsp; </span>[&lt;c01779b1&gt;] =
__find_get_block+0xa1/0x1b0<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>Feb<span style=3D'mso-spacerun:yes'>&nbsp; </span>6 =
</span></font><st1:time
Hour=3D"14" Minute=3D"8"><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
 font-family:Arial'>14:08:20</span></font></st1:time><font size=3D2 =
face=3DArial><span
style=3D'font-size:10.0pt;font-family:Arial'> host1 kernel:<span
style=3D'mso-spacerun:yes'>&nbsp; </span>[&lt;c0178666&gt;]
wake_up_buffer+0x6/0x30<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>Feb<span style=3D'mso-spacerun:yes'>&nbsp; </span>6 =
</span></font><st1:time
Hour=3D"14" Minute=3D"8"><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
 font-family:Arial'>14:08:20</span></font></st1:time><font size=3D2 =
face=3DArial><span
style=3D'font-size:10.0pt;font-family:Arial'> host1 kernel:<span
style=3D'mso-spacerun:yes'>&nbsp; </span>[&lt;c0178719&gt;] =
ll_rw_block+0x49/0x90<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>Feb<span style=3D'mso-spacerun:yes'>&nbsp; </span>6 =
</span></font><st1:time
Hour=3D"14" Minute=3D"8"><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
 font-family:Arial'>14:08:20</span></font></st1:time><font size=3D2 =
face=3DArial><span
style=3D'font-size:10.0pt;font-family:Arial'> host1 kernel:<span
style=3D'mso-spacerun:yes'>&nbsp; </span>[&lt;f88d5f4b&gt;]
reiserfs_do_truncate+0x2eb/0x5f0 [reiserfs]<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>Feb<span style=3D'mso-spacerun:yes'>&nbsp; </span>6 =
</span></font><st1:time
Hour=3D"14" Minute=3D"8"><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
 font-family:Arial'>14:08:20</span></font></st1:time><font size=3D2 =
face=3DArial><span
style=3D'font-size:10.0pt;font-family:Arial'> host1 kernel:<span
style=3D'mso-spacerun:yes'>&nbsp; </span>[&lt;f88d6280&gt;]
reiserfs_delete_object+0x30/0x70 [reiserfs]<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>Feb<span style=3D'mso-spacerun:yes'>&nbsp; </span>6 =
</span></font><st1:time
Hour=3D"14" Minute=3D"8"><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
 font-family:Arial'>14:08:20</span></font></st1:time><font size=3D2 =
face=3DArial><span
style=3D'font-size:10.0pt;font-family:Arial'> host1 kernel:<span
style=3D'mso-spacerun:yes'>&nbsp; </span>[&lt;f88c0fae&gt;]
reiserfs_delete_inode+0xde/0x138 [reiserfs]<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>Feb<span style=3D'mso-spacerun:yes'>&nbsp; </span>6 =
</span></font><st1:time
Hour=3D"14" Minute=3D"8"><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
 font-family:Arial'>14:08:20</span></font></st1:time><font size=3D2 =
face=3DArial><span
style=3D'font-size:10.0pt;font-family:Arial'> host1 kernel:<span
style=3D'mso-spacerun:yes'>&nbsp; </span>[&lt;f88df64f&gt;]
reiserfs_permission+0xf/0x20 [reiserfs]<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>Feb<span style=3D'mso-spacerun:yes'>&nbsp; </span>6 =
</span></font><st1:time
Hour=3D"14" Minute=3D"8"><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
 font-family:Arial'>14:08:20</span></font></st1:time><font size=3D2 =
face=3DArial><span
style=3D'font-size:10.0pt;font-family:Arial'> host1 kernel:<span
style=3D'mso-spacerun:yes'>&nbsp; </span>[&lt;f88c0ed0&gt;]
reiserfs_delete_inode+0x0/0x138 [reiserfs]<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>Feb<span style=3D'mso-spacerun:yes'>&nbsp; </span>6 =
</span></font><st1:time
Hour=3D"14" Minute=3D"8"><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
 font-family:Arial'>14:08:20</span></font></st1:time><font size=3D2 =
face=3DArial><span
style=3D'font-size:10.0pt;font-family:Arial'> host1 kernel:<span
style=3D'mso-spacerun:yes'>&nbsp; </span>[&lt;c0192414&gt;]
generic_delete_inode+0xa4/0x160<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>Feb<span style=3D'mso-spacerun:yes'>&nbsp; </span>6 =
</span></font><st1:time
Hour=3D"14" Minute=3D"8"><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
 font-family:Arial'>14:08:20</span></font></st1:time><font size=3D2 =
face=3DArial><span
style=3D'font-size:10.0pt;font-family:Arial'> host1 kernel:<span
style=3D'mso-spacerun:yes'>&nbsp; </span>[&lt;c01917ce&gt;] =
iput+0x5e/0x90<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>Feb<span style=3D'mso-spacerun:yes'>&nbsp; </span>6 =
</span></font><st1:time
Hour=3D"14" Minute=3D"8"><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
 font-family:Arial'>14:08:20</span></font></st1:time><font size=3D2 =
face=3DArial><span
style=3D'font-size:10.0pt;font-family:Arial'> host1 kernel:<span
style=3D'mso-spacerun:yes'>&nbsp; </span>[&lt;c0187b76&gt;]
sys_unlink+0x166/0x1d0<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>Feb<span style=3D'mso-spacerun:yes'>&nbsp; </span>6 =
</span></font><st1:time
Hour=3D"14" Minute=3D"8"><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
 font-family:Arial'>14:08:20</span></font></st1:time><font size=3D2 =
face=3DArial><span
style=3D'font-size:10.0pt;font-family:Arial'> host1 kernel:<span
style=3D'mso-spacerun:yes'>&nbsp; </span>[&lt;c0110a35&gt;] =
do_mmap2+0x105/0x160<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>Feb<span style=3D'mso-spacerun:yes'>&nbsp; </span>6 =
</span></font><st1:time
Hour=3D"14" Minute=3D"8"><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
 font-family:Arial'>14:08:20</span></font></st1:time><font size=3D2 =
face=3DArial><span
style=3D'font-size:10.0pt;font-family:Arial'> host1 kernel:<span
style=3D'mso-spacerun:yes'>&nbsp; </span>[&lt;c01091d9&gt;]
sysenter_past_esp+0x52/0x79<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>Feb<span style=3D'mso-spacerun:yes'>&nbsp; </span>6 =
</span></font><st1:time
Hour=3D"14" Minute=3D"8"><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
 font-family:Arial'>14:08:20</span></font></st1:time><font size=3D2 =
face=3DArial><span
style=3D'font-size:10.0pt;font-family:Arial'> host1 =
kernel:<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>Feb<span style=3D'mso-spacerun:yes'>&nbsp; </span>6 =
</span></font><st1:time
Hour=3D"14" Minute=3D"8"><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
 font-family:Arial'>14:08:20</span></font></st1:time><font size=3D2 =
face=3DArial><span
style=3D'font-size:10.0pt;font-family:Arial'> host1 kernel: Code: 0f 0b =
6a 01 2b
3c 8e f8 85 db b8 1b 3c 8e f8 74 06 8d 83 =
3c<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D3 face=3D"Times New Roman"><span =
style=3D'font-size:
12.0pt;mso-no-proof:yes'><o:p>&nbsp;</o:p></span></font></p>

</div>

</body>

</html>
=00
------_=_NextPart_001_01C62C17.41CCC998--
