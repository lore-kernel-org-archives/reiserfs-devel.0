From: =?iso-8859-1?Q?Krisztian_Gy=F6rffy?= <krisztian.gyoerffy@telecare.at>
Subject: problem with FS block_size
Date: Wed, 12 Jun 2002 12:17:58 +0200
Message-ID: <004a01c211fa$6c92a040$1f79030a@connect.atwork.ent>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_0047_01C2120B.3010C1E0"
Return-path: <reiserfs-list-return-10721-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
To: reiserfs-list@namesys.com

------=_NextPart_000_0047_01C2120B.3010C1E0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi ReiserFS Gurus!


I have a problem with my reiserFS. I have the following configuration =
running on my machine:

- SMP 2.4.16-32 SuSE Linux kernel
- software RAID1 with 2 disks
- on top of the RAID I have LVM 1.0.1 (the /boot is exclusive, but the =
rest like /home, /, swap, /tmp, /opt, /usr in in the LVM)

Everything is working fine with ext2fs and also with resierfs if I =
define block_size 4k. I downloaded from namesys.com the latest resierfs =
tools version reiserfsprogs-3.x.1b.tar.gz. But with that I still have =
the problem, if I define a block_size other that 4k, I eighter cannot =
mount the partition (filesystem type unknown), or at unmount I get =
segmentation fault. The first one I get with block_size 1k, the second =
with block_size 2k.

Can you tell me what can be wrong there. Do I need some kernel pathes?


Thanks

Krisztian

------=_NextPart_000_0047_01C2120B.3010C1E0
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META http-equiv=3DContent-Type content=3D"text/html; =
charset=3Diso-8859-1">
<META content=3D"MSHTML 6.00.2600.0" name=3DGENERATOR>
<STYLE></STYLE>
</HEAD>
<BODY bgColor=3D#ffffff>
<DIV><FONT face=3DArial size=3D2>
<DIV><FONT face=3DArial size=3D2>Hi ReiserFS Gurus!</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>I have a problem with my reiserFS. I =
have the=20
following configuration running on my machine:</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>- SMP 2.4.16-32 SuSE Linux =
kernel</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>- software RAID1 with 2 =
disks</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>- on top of the RAID&nbsp;I have LVM =
1.0.1 (the=20
/boot is exclusive, but the rest like /home, /, swap, /tmp, /opt, /usr =
in in the=20
LVM)</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT size=3D2><FONT face=3DArial>Everything is working fine with =
ext2fs and=20
also with resierfs if I define block_size 4k. I downloaded from =
namesys.com the=20
latest resierfs tools version <A=20
href=3D"ftp://ftp.namesys.com/pub/reiserfsprogs/reiserfsprogs-3.x.1b.tar.=
gz"><FONT=20
face=3D"Times New Roman" =
size=3D3>reiserfsprogs-3.x.1b.tar.gz</FONT></A>. But with=20
that I still have the problem, if I define a block_size other that 4k, I =
eighter=20
cannot mount the partition (filesystem type unknown), or at unmount I =
get=20
segmentation fault. The first one I get with block_size 1k, the second =
with=20
block_size 2k.</FONT></FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>Can you tell me what can be wrong =
there. Do I need=20
some kernel pathes?</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>Thanks</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial =
size=3D2>Krisztian</FONT></DIV></FONT></DIV></BODY></HTML>

------=_NextPart_000_0047_01C2120B.3010C1E0--

