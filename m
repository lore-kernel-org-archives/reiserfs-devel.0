From: Dieter =?iso-8859-15?q?N=FCtzel?= <Dieter.Nuetzel@hamburg.de>
Subject: Re: reiserfsprogs 3.6.5 release
Date: Tue, 25 Mar 2003 19:03:34 +0100
Message-ID: <200303251903.34660.Dieter.Nuetzel@hamburg.de>
References: <200303251108.11938.Dieter.Nuetzel@hamburg.de> <200303251335.06542.Dieter.Nuetzel@hamburg.de> <200303251642.23944.vitaly@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-13382-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200303251642.23944.vitaly@namesys.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Vitaly Fertman <vitaly@namesys.com>
Cc: ReiserFS List <reiserfs-list@namesys.com>

Am Dienstag, 25. M=E4rz 2003 14:42 schrieb Vitaly Fertman:
> > SunWave1 /home/nuetzel# /database/db3/sbin/reiserfsck -V
> >
> > <-------------reiserfsck, 2002------------->
> > reiserfsprogs 3.6.5
> >
> > SunWave1 /home/nuetzel# /database/db3/sbin/reiserfsck -a /dev/sda3
> > Reiserfs super block in block 16 on 0x803 of format 3.6 with standard
> > journal Blocks (total/free): 26105/6638 by 4096 bytes
> > Filesystem is NOT cleanly umounted
> > Partition /dev/sda3 is mounted w/ write permissions, cannot check it <=
=3D=3D
> > !!!!!
> >
> > >>> Haaa, is this the wrong thing? <<<
> >
> > SunWave1 /home/nuetzel# mount
> > /dev/sda3 on / type reiserfs (rw,noatime,notail)
>
> as you can see it is right, it is mounted with rw permitions.
>
> Could you run reiserfsck -a/-p on some unmounted or mounted ro partition
> which does not get mounted on boot due to this "flush_buffers: device
> is not specified". It is interesting to get the same not on boot time.

All partitions wouldn't mounted due to "flush_buffers: device is not=20
specified". ;-(

unmounted:

SunWave1 /home/nuetzel# /database/db3/sbin/reiserfsck -p /dev/sdb5
Reiserfs super block in block 16 on 0x815 of format 3.6 with standard journ=
al
Blocks (total/free): 214861/206643 by 4096 bytes
=46ilesystem is cleanly umounted
Replaying journal..
0 transactions replayed
Checking internal tree..finished

SunWave1 /home/nuetzel# /database/db3/sbin/reiserfsck -p /dev/sdb6
Reiserfs super block in block 16 on 0x816 of format 3.6 with standard journ=
al
Blocks (total/free): 214861/206643 by 4096 bytes
=46ilesystem is cleanly umounted
Replaying journal..
0 transactions replayed
Checking internal tree..finished

SunWave1 /home/nuetzel# /database/db3/sbin/reiserfsck -a /dev/sdb6
Reiserfs super block in block 16 on 0x816 of format 3.6 with standard journ=
al
Blocks (total/free): 214861/206643 by 4096 bytes
=46ilesystem is cleanly umounted
Replaying journal..
0 transactions replayed
Checking internal tree..finished

mounted ro:

/dev/sdb5               859412     32840    826572   4% /database/db1
/dev/sdb6               859412     32840    826572   4% /database/db2

/dev/sdb5 on /database/db1 type reiserfs (ro)
/dev/sdb6 on /database/db2 type reiserfs (ro)

SunWave1 /home/nuetzel# /database/db3/sbin/reiserfsck -p /dev/sdb5
Reiserfs super block in block 16 on 0x815 of format 3.6 with standard journ=
al
Blocks (total/free): 214861/206643 by 4096 bytes
=46ilesystem is cleanly umounted
=46ilesystem seems mounted read-only. Skipping journal replay.
Checking internal tree..finished

SunWave1 /home/nuetzel# /database/db3/sbin/reiserfsck -a /dev/sdb5
Reiserfs super block in block 16 on 0x815 of format 3.6 with standard journ=
al
Blocks (total/free): 214861/206643 by 4096 bytes
=46ilesystem is cleanly umounted
=46ilesystem seems mounted read-only. Skipping journal replay.
Checking internal tree..finished

SunWave1 /home/nuetzel# /database/db3/sbin/reiserfsck -p /dev/sdb6
Reiserfs super block in block 16 on 0x816 of format 3.6 with standard journ=
al
Blocks (total/free): 214861/206643 by 4096 bytes
=46ilesystem is cleanly umounted
=46ilesystem seems mounted read-only. Skipping journal replay.
Checking internal tree..finished


Here comes what reiserfsck-3.6.5-pre1 gives:

umounted:

SunWave1 /home/nuetzel# reiserfsck -p /dev/sdb6
Reiserfs super block in block 16 on 0x816 of format 3.6 with standard journ=
al
Blocks (total/free): 214861/206643 by 4096 bytes
=46ilesystem is cleanly umounted

SunWave1 /home/nuetzel# reiserfsck -a /dev/sdb5
Reiserfs super block in block 16 on 0x815 of format 3.6 with standard journ=
al
Blocks (total/free): 214861/206643 by 4096 bytes
=46ilesystem is cleanly umounted

mounted ro:

SunWave1 /home/nuetzel# reiserfsck -p /dev/sdb6
Reiserfs super block in block 16 on 0x816 of format 3.6 with standard journ=
al
Blocks (total/free): 214861/206643 by 4096 bytes
=46ilesystem is cleanly umounted

SunWave1 /home/nuetzel# reiserfsck -a /dev/sdb5
Reiserfs super block in block 16 on 0x815 of format 3.6 with standard journ=
al
Blocks (total/free): 214861/206643 by 4096 bytes
=46ilesystem is cleanly umounted

Thanks,
	Dieter
