From: "Torsten Scholz" <t.scholz@alfeld.de>
Subject: Data corruption on reiserfs
Date: Tue, 22 Oct 2002 08:21:01 +0200
Message-ID: <017001c27993$331f5500$0a00a8c0@nemesis>
Reply-To: "Torsten Scholz" <t.scholz@alfeld.de>
Mime-Version: 1.0
Content-Type: multipart/mixed;
	boundary="----=_NextPart_000_016C_01C279A3.F4EA4860"
Return-path: <reiserfs-list-return-11735-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
To: reiserfs-list@namesys.com

------=_NextPart_000_016C_01C279A3.F4EA4860
Content-Type: multipart/alternative;
	boundary="----=_NextPart_001_016D_01C279A3.F4EA4860"


------=_NextPart_001_016D_01C279A3.F4EA4860
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi all,

last time to get some help....

I have a data corruption on a rieserfs partition (80GB). After repair =
with gpart and reiserfsck (-s --rebuild-tree) all the data seams to be =
restored, but inside the files is only a small part of the original =
data. Can anyone give some hints how to recover the whole data back?

--
cu t.scholz (exolon)
______________________________________
Web: http://eXnet-online.de   Email: t.scholz@alfeld.de   =20
Tel.: 05187/2052   Fax.: 05187/2053   ICQ: 20794370 PGP: DFFEF426 =20
"Linux is like a wigwam: no windows, no gates, but apache inside!"

------=_NextPart_001_016D_01C279A3.F4EA4860
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META http-equiv=3DContent-Type content=3D"text/html; =
charset=3Diso-8859-1">
<META content=3D"MSHTML 6.00.2719.2200" name=3DGENERATOR>
<STYLE></STYLE>
</HEAD>
<BODY bgColor=3D#ffffff>
<DIV><FONT face=3DArial size=3D2>Hi all,</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>last time to get some =
help....</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>I have a data corruption on a rieserfs =
partition=20
(80GB). After repair with gpart and reiserfsck (-s --rebuild-tree) all =
the data=20
seams to be restored, but inside the files is only a small part of the =
original=20
data. Can anyone give some hints how to recover the whole data=20
back?</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>--<BR>cu t.scholz=20
(exolon)<BR>______________________________________<BR>Web: <A=20
href=3D"http://eXnet-online.de">http://eXnet-online.de</A>&nbsp;&nbsp; =
Email: <A=20
href=3D"mailto:t.scholz@alfeld.de">t.scholz@alfeld.de</A>&nbsp;&nbsp;&nbs=
p;=20
<BR>Tel.: 05187/2052&nbsp;&nbsp; Fax.: 05187/2053&nbsp;&nbsp; ICQ: =
20794370 PGP:=20
DFFEF426&nbsp; <BR>"Linux is like a wigwam: no windows, no gates, but =
apache=20
inside!"</FONT></DIV></BODY></HTML>

------=_NextPart_001_016D_01C279A3.F4EA4860--

------=_NextPart_000_016C_01C279A3.F4EA4860--

