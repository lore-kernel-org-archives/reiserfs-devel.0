From: "Bodo Buerger" <bodo.buerger@gmx.de>
Subject: unable to mount / rebuild-tree
Date: Sun, 5 May 2002 12:56:10 +0200
Message-ID: <003f01c1f423$7f037410$6400a8c0@jerez>
Reply-To: "Bodo Buerger" <bodo.buerger@gmx.de>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_0038_01C1F434.3AE9EB90"
Return-path: <reiserfs-list-return-10243-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
To: reiserfs-list@namesys.com

------=_NextPart_000_0038_01C1F434.3AE9EB90
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi all,

since I booted my server today, I can't mount my reiserfs-partition any =
more.

<4>Checking ReiserFS transaction log (device 16:01) ...
<4>hdc: read_intr: status=3D0x59 { DriveReady SeekComplete DataRequest =
Error }
<4>hdc: read_intr: error=3D0x40 { UncorrectableError }, LBAsect=3D65744, =
sector=3D65681
<4>end_request: I/O error, dev 16:01 (hdc), sector 65681
<4>Replay Failure, unable to mount
<4>reiserfs_read_super: unable to initialize journal space

I checked with "reiserfsck" and replaced the super-block. After this I =
tried to "--rebuild-tree"
but this message occurs:

reiserfs_open_journal: bread failed reading journal header

but the "--no-journal-available"-option is always ignored by =
"reiserfsck".

Anyone out there, who can help?
-----------------------------------------------------
Bodo Buerger


------=_NextPart_000_0038_01C1F434.3AE9EB90
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META http-equiv=3DContent-Type content=3D"text/html; =
charset=3Diso-8859-1">
<META content=3D"MSHTML 5.50.4134.600" name=3DGENERATOR>
<STYLE></STYLE>
</HEAD>
<BODY bgColor=3D#ffffff>
<DIV><FONT face=3DArial size=3D2>Hi all,</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>since I booted my server today, I can't =
mount my=20
reiserfs-partition any more.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>&lt;4&gt;Checking ReiserFS transaction =
log (device=20
16:01) ...<BR>&lt;4&gt;hdc: read_intr: status=3D0x59 { DriveReady =
SeekComplete=20
DataRequest Error }<BR>&lt;4&gt;hdc: read_intr: error=3D0x40 { =
UncorrectableError=20
}, LBAsect=3D65744, sector=3D65681<BR>&lt;4&gt;end_request: I/O error, =
dev 16:01=20
(hdc), sector 65681<BR>&lt;4&gt;Replay Failure, unable to=20
mount<BR>&lt;4&gt;reiserfs_read_super: unable to initialize journal=20
space<BR></FONT></DIV>
<DIV><FONT face=3DArial size=3D2>I&nbsp;checked with "reiserfsck" and =
replaced the=20
super-block. After this I tried to "--rebuild-tree"</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>but this message occurs:</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>reiserfs_open_journal: bread failed =
reading journal=20
header</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>but the "--no-journal-available"-option =
is always=20
ignored by "reiserfsck".</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>Anyone out there, who can =
help?</DIV></FONT>
<DIV><FONT face=3DArial=20
size=3D2>-----------------------------------------------------<BR>Bodo=20
Buerger</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV></BODY></HTML>

------=_NextPart_000_0038_01C1F434.3AE9EB90--

