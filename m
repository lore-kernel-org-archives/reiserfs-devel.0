From: Dieter =?iso-8859-1?q?N=FCtzel?= <Dieter.Nuetzel@hamburg.de>
Subject: Re: Very very slow rm/unlink of large sparse files
Date: Mon, 16 Feb 2004 15:06:51 +0100
Message-ID: <200402161506.51895.Dieter.Nuetzel@hamburg.de>
References: <4030391F.5080204@lig.net> <200402161432.35178.Dieter.Nuetzel@hamburg.de> <1076938953.2482.1246.camel@watt.suse.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-16803-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1076938953.2482.1246.camel@watt.suse.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: reiserfs-list@namesys.com
Cc: Chris Mason <mason@suse.com>, "Stephen D. Williams" <sdw@lig.net>

Am Montag, 16. Februar 2004 14:42 schrieb Chris Mason:
> On Mon, 2004-02-16 at 08:32, Dieter N=FCtzel wrote:
> > > Is there a way to avoid practically (but not completely) locking up a
> > > filesystem for many hours or days just to delete a file?
>
> Yes, reiserfs needs to be nicer with the BKL.  This I can fix
> easily...patching.

Ah, I tried the "test" with my current set up (SuSE 9.0, 2.6.2-6, data-logg=
ing=20
patches for 2.6.1), again.

> daul Athlon MP 1900+

Same with 1 GB RAM.

> U160

I have this, now:

U320 disks (Fujitsu MAS3184NP, 15k RPM) on U160 controller
RAID0 and RAID1

;-)

> Argh! ---I can't kill it!
> No CNTL-C or '"killall -9 dd" or under "top".
> Even as root;-(
>=20
> 2.4.21-jam1 (aa1) plus all data-logging
>=20
> SOURCE/dri-trunk> time dd if=3D/dev/zero of=3Dsparse bs=3D1 seek=3D200G c=
ount=3D1
> 0.000u 362.760s 8:26.34 71.6%   0+0k 0+0io 124pf+0w

Test was performed on RAID0 (second partitions, from outer to inner=20
cylinders):

INSTALL/SOURCE> time dd if=3D/dev/zero of=3Dsparse bs=3D1 seek=3D200G count=
=3D1
1+0 Records ein
1+0 Records aus
0.000u 3.038s 0:05.88 51.5%     0+0k 0+0io 0pf+0w

INSTALL/SOURCE> l
insgesamt 430288
drwxrwxr-x    7 root     root          264 2004-02-16 14:53 .
drwxr-xr-x    3 root     root           72 2004-01-12 13:53 ..
drwxr-xr-x    2 nuetzel  users         856 2003-12-27 14:51 bench
drwxr-xr-x    3 nuetzel  users          72 2003-09-07 20:37 dri-trunk
drwxr-xr-x    3 nuetzel  users          72 2003-09-07 20:37 dri-trunk-3-7-2=
003
drwxr-xr-x    2 root     root          168 2004-02-14 00:49 NX
=2Drw-r--r--    1 nuetzel  users    214748364801 2004-02-16 14:53 sparse

INSTALL/SOURCE> time rm sparse
0.000u 4.745s 0:04.74 100.0%    0+0k 0+0io 0pf+0w

System was NOT responseable during "rm".
NO mouse movement, etc.

And this is WITH kernel pre-emption...

> It was runinng with a paralell C++ (-j20) compilation.

Now, same as before but with compilation.

INSTALL/SOURCE> time dd if=3D/dev/zero of=3Dsparse bs=3D1 seek=3D200G count=
=3D1
1+0 Records ein
1+0 Records aus
0.000u 2.741s 0:09.30 29.4%     0+0k 0+0io 3pf+0w
INSTALL/SOURCE> l
insgesamt 430288
drwxrwxr-x    7 root     root          264 2004-02-16 15:02 .
drwxr-xr-x    3 root     root           72 2004-01-12 13:53 ..
drwxr-xr-x    2 nuetzel  users         856 2003-12-27 14:51 bench
drwxr-xr-x    3 nuetzel  users          72 2003-09-07 20:37 dri-trunk
drwxr-xr-x    3 nuetzel  users          72 2003-09-07 20:37 dri-trunk-3-7-2=
003
drwxr-xr-x    2 root     root          168 2004-02-14 00:49 NX
=2Drw-r--r--    1 nuetzel  users    214748364801 2004-02-16 15:02 sparse

INSTALL/SOURCE> time rm sparse
0.000u 10.684s 2:15.11 7.9%     0+0k 0+0io 0pf+0w

'rm' time is lost in 'io_schedule' and 'down'.

Cheers,
	Dieter
