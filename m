From: Bruce <bestb@sympatico.ca>
Subject: Can resize_reiserfs do non-destructive resizing??
Date: Sun, 17 Nov 2002 21:40:49 -0500
Message-ID: <200211172140.49258.bestb@sympatico.ca>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-12004-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

I have a desktop machine that was running Debian 3.0, installed on a 40Gi=
g=20
harddrive (single partition hda2 + swap hda1) formatted with reiserfs; th=
e=20
drive had about 10gig data on it. I wanted to test out Mandrake 9.0, and=20
understood that the diskdrake program would handle resizing of the existi=
ng=20
reiser partition (using resize_reiserfs, I assume). The diskdrake program=
=20
suggested I backup as a precaution, but did not indicate that the resizin=
g=20
would be destructive.

I let it resize the existing partition to 20Gig. It seemed to work, and=20
Mandrake installed without any problems. However, since then I have not b=
een=20
able to access the Debian partition - can't boot from it, can't mount it,=
=20
nothing. Trying to boot from that partition results in:

 attempt to access beyond end of device
 03:02 rw=3D0 want 21364740 limit 21310191
 reiserfs_read_super: unable to read bitmap
 kernel panic....

I posted a query to alt.os.linux.mandrake, and got the answer that=20
resize_reiserfs cannot do non-destructive repartitioning, and that my=20
partition was toast (for the thread, search for the subject "Problem resi=
zing=20
reiserfs partition with DiskDrake" in alt.os.linux.mandrake from 10 Novem=
ber=20
2002). I had a look at the man page, and if resize_reiserfs cannot, in fa=
ct,=20
non-destructively resize a partition, I couldn't find anything saying so.=
=20

Is this a problem with diskdrake's handling of resize_reiserfs??=20
resize_reiserfs itself??

It could also be due to physical problems with the hard drive, which had=20
reported bad blocks some time ago. Is this more likely the cause of the=20
problem??

Any thoughts,

Bruce

