From: John Dalbec <jpdalbec@cc.ysu.edu>
Subject: Re: ReiserFS Root Filesystem mounts read-only.
Date: Thu, 29 Aug 2002 14:41:03 -0400
Message-ID: <3D6E6ABF.FDAFA6D4@cc.ysu.edu>
References: <QKWTUOYX2YWREA54E02X2U6343WRIGLJ.3d6e51dd@xoglar>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-11346-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Xabo =?iso-8859-1?Q?Garc=EDa?= <xabigf@gmx.net>
Cc: reiserfs-list@namesys.com



Xabo Garc=EDa wrote:
>=20
>         After I exec the reiserfsck to correct some problems (--fix-fixab=
le), I retarted my
> computer. The problem is that now the filesystem is mounted read-only at =
the both time
> (any init.d script is started). I look in /etc/fstab and /etc/lilo.conf, =
but this files
> don't seem to be wrong. I don't know what is happening, because the reise=
rfsck --check
> says that there isn't corruptions. =BFMay someone tell me what I need to =
do?. Thanks.

Try "mount / -o remount,rw".  Do you get any warning/error messages?=20
Does the filesystem become read/write?
John Dalbec
