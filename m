From: Vitaly Fertman <vitaly@namesys.com>
Subject: reiserfsck infinite loop at pass2 (built by Debian).
Date: Fri, 18 Apr 2003 16:04:28 +0400
Message-ID: <200304181604.28955.vitaly@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-13705-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com, debian-testing@lists.debian.org
Cc: Ed Boraas <ed@debian.org>


Hi all,=20

while investigating the problem with infinite loop at pass2 of reiserfsck=
,=20
what seemed to be reported by people using reiserfsprogs built by Debian,=
=20
we found a debain patch against reiserfsprogs-3.6.4 (introduced in 3.6.4-=
2),=20
what was the problem. Tests with this patch revealed the problem - bitops=
=20
were changed and have not worked properly anymore.=20

The reason why bitops were changed is that reiserfsprogs did not work=20
correctly on big endian platforms that time. It was also fixed now and 3.=
6.5=20
should work correctly. If you are going to use 3.6.5 do not forget about =
the=20
patch 'reiserfsprogs-3.6.5-flush_buffers-bug.patch' or wait a few days fo=
r=20
3.6.6 release. The latest reiserfsprogs and the patch can be obtained fro=
m
    ftp://ftp.namesys.com/pub/reiserfsprogs/

--=20
Thanks,
Vitaly Fertman
