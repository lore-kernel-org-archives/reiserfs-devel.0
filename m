From: Vitaly Fertman <vitaly@namesys.com>
Subject: Re: can't mount repaired reiserfs partition
Date: Wed, 23 Apr 2003 16:58:33 +0400
Message-ID: <200304231658.33598.vitaly@namesys.com>
References: <Pine.LNX.4.21.0304231548250.3962-100000@entandikwa.ds.co.ug>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-13775-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <Pine.LNX.4.21.0304231548250.3962-100000@entandikwa.ds.co.ug>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Joshua Masiko <joshua@dsmagic.com>
Cc: reiserfs-list@namesys.com

> Super block seems to be correct
>
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
>=3D=3D=3D=3D=3D
>
> timon:/home/joshua/downloads/reiserfsprogs-3.6.6-pre1/fsck # mount -t
> reiserfs -o ro /dev/hdd6 /mnt/recover/
> mount: wrong fs type, bad option, bad superblock on /dev/hdd6,
>        or too many mounted file systems

Ok, and what does reiserfsck --check say now?
Do you have anything related in the syslog?

--=20
Thanks,
Vitaly Fertman
