From: Marcel Prisi <marcel@virtua.ch>
Subject: HELP after terrible mistake
Date: Mon, 22 Jul 2002 11:38:51 +0200
Message-ID: <200207221138.51974.marcel@virtua.ch>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-11066-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

HELP !!

I made a terrible mistake : mke2fs -j on a reiserfs partition. Of course,=
 it=20
was the wrong disk. Wanting to try some benchmarking ...

I tried reiserfsck with all switches I could find, but it did not recreat=
e the=20
infos .... The disk was full of not really important datum, but I'd like=20
anyway to recover those if possible ... Did some of you succeed in that k=
ind=20
of troubles ?

Thanks for helping .....

Kernel is 2.4.18, but the disk was created back in the 2.2 days, probably=
=20
ReiserFS version 3.5.25 / r5 hash, latest reiserfsprogs.
