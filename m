From: "Nicolas Smallwood" <smallwood@maya.com>
Subject: Atomicity with reiser4?
Date: Wed, 2 Feb 2005 14:36:49 -0500
Message-ID: <CMEFJOIJPCAMFCEKIEOECEPFCFAA.smallwood@maya.com>
Mime-Version: 1.0
Content-Type: multipart/related;
	boundary="----=_NextPart_000_0000_01C50934.A10CB0C0"
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
To: reiser <reiserfs-list@namesys.com>

------=_NextPart_000_0000_01C50934.A10CB0C0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_001_0001_01C50934.A10CB0C0"


------=_NextPart_001_0001_01C50934.A10CB0C0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

Network BlitzHello,

I was running a test with some in-house database software that relies on
fsync after transactions are complete.  I noticed severe perfomance lapses,
and have bee profiling the software for several days.   A minute ago, I
removed the fsync from the system, only making it think it had been
fsyncing.  This reduced my test from 15 minutes to less than 40 seconds.

Obviously there is a performance hit with using fsync, but we are of course
worried about database integrity.

Is there an avaliable paper on how reiser4 handles atomicity, or can it be
easily explained?
Essentially, my question is whether our database (using 4k blocksizes) will
lose data during power loss or other occurrences if we do not fsync?

Thank You,

Nicolas Smallwood



------=_NextPart_001_0001_01C50934.A10CB0C0
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD><TITLE id=3DridTitle>Network Blitz</TITLE>
<META http-equiv=3DContent-Type content=3D"text/html; =
charset=3Diso-8859-1">
<STYLE>BODY {
	MARGIN-TOP: 0px; FONT-SIZE: 10pt; MARGIN-LEFT: 20px; COLOR: #333333; =
FONT-FAMILY: Verdana, Arial
}
IMG {
	MARGIN-TOP: 25px; MARGIN-LEFT: -20px
}
</STYLE>

<META content=3D"MSHTML 6.00.2900.2523" name=3DGENERATOR></HEAD>
<BODY id=3DridBody background=3Dcid:687423119@02022005-071a>
<DIV><SPAN class=3D687423119-02022005>Hello,</SPAN></DIV>
<DIV><SPAN class=3D687423119-02022005></SPAN>&nbsp;</DIV>
<DIV><SPAN class=3D687423119-02022005>I was running a test with some =
in-house=20
database software that relies on fsync after transactions are =
complete.&nbsp; I=20
noticed severe perfomance lapses, and have bee profiling the software =
for=20
several days.&nbsp;&nbsp; A minute ago, I removed the fsync from the =
system,=20
only making it think it had been fsyncing.&nbsp; This reduced my test =
from 15=20
minutes to less than 40 seconds.</SPAN></DIV>
<DIV><SPAN class=3D687423119-02022005></SPAN>&nbsp;</DIV>
<DIV><SPAN class=3D687423119-02022005>Obviously there is a performance =
hit with=20
using fsync, but we are of course worried about database =
integrity.</SPAN></DIV>
<DIV><SPAN class=3D687423119-02022005></SPAN>&nbsp;</DIV>
<DIV><SPAN class=3D687423119-02022005>Is there an avaliable paper on how =
reiser4=20
handles atomicity, or can it be easily explained?</SPAN></DIV>
<DIV><SPAN class=3D687423119-02022005>Essentially, my question is =
whether our=20
database (using 4k blocksizes) will lose data during power loss or other =

occurrences if we do not fsync?</SPAN></DIV>
<DIV><SPAN class=3D687423119-02022005></SPAN>&nbsp;</DIV>
<DIV><SPAN class=3D687423119-02022005>Thank You,</SPAN></DIV>
<DIV><SPAN class=3D687423119-02022005></SPAN>&nbsp;</DIV>
<DIV><FONT face=3DArial>Nicolas Smallwood</FONT></DIV>
<P></P><SPAN id=3D_AthCaret></SPAN>
<P>&nbsp;</P></BODY></HTML>

------=_NextPart_001_0001_01C50934.A10CB0C0--

------=_NextPart_000_0000_01C50934.A10CB0C0--

