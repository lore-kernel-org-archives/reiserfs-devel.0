From: Dieter =?utf-8?q?N=C3=BCtzel?= <Dieter.Nuetzel@hamburg.de>
Subject: Re: reiserfsprogs 3.6.5 release
Date: Tue, 25 Mar 2003 13:35:06 +0100
Message-ID: <200303251335.06542.Dieter.Nuetzel@hamburg.de>
References: <200303251108.11938.Dieter.Nuetzel@hamburg.de> <200303251422.25804.vitaly@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-13376-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200303251422.25804.vitaly@namesys.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Vitaly Fertman <vitaly@namesys.com>
Cc: ReiserFS List <reiserfs-list@namesys.com>

Am Dienstag, 25. M=C3=A4rz 2003 12:22 schrieb Vitaly Fertman:
> Hi,
>
> On Tuesday 25 March 2003 13:08, Dieter N=C3=BCtzel wrote:
> > Hello all,
> >
> > after my update to reiserfsprogs-3.6.5 no partition would be mounted
> > during boot ;-( It started with the reiserfsprogs-3.6.5-pre2 release.
> > reiserfsprogs-3.6.5-pre1 is fine and what I currently use.
> > The latest final is much faster and smooth during --check,
> > --clear-attributes, --rebuild-sb, --rebuild-tree but the boot thing
> > wouldn't go away after all my search.
> >
> > ---
> > Checking all file systems...
> > fsck 1.24a (02-Sep-2001)
> > Reiserfs super block in block 16 on 0x803 of format 3.6 with standard
> > journal Blocks (total/free): 26105/6638 by 4096 bytes
> > Filesystem is cleanly umounted
> >
> > flush_buffers: device is not specifed
>
> Trying to reproduce the problem, no success yet.
> Could you run reiserfsck -a /dev/sda3 and tell me what it says?

SunWave1 /home/nuetzel# reiserfsck -V

<-------------reiserfsck, 2002------------->
reiserfsprogs 3.6.5-pre1

SunWave1 /home/nuetzel# reiserfsck -a /dev/sda3
Reiserfs super block in block 16 on 0x803 of format 3.6 with standard journ=
al
Blocks (total/free): 26105/6638 by 4096 bytes
=46ilesystem is NOT cleanly umounted


SunWave1 /home/nuetzel# /database/db3/sbin/reiserfsck -V

<-------------reiserfsck, 2002------------->
reiserfsprogs 3.6.5

SunWave1 /home/nuetzel# /database/db3/sbin/reiserfsck -a /dev/sda3
Reiserfs super block in block 16 on 0x803 of format 3.6 with standard journ=
al
Blocks (total/free): 26105/6638 by 4096 bytes
=46ilesystem is NOT cleanly umounted
Partition /dev/sda3 is mounted w/ write permissions, cannot check it <=3D=
=3D !!!!!

>>> Haaa, is this the wrong thing? <<<

SunWave1 /home/nuetzel# mount
/dev/sda3 on / type reiserfs (rw,noatime,notail)
proc on /proc type proc (rw)
devpts on /dev/pts type devpts (rw,mode=3D0620,gid=3D5)
/dev/sda2 on /tmp type reiserfs (rw,notail)
/dev/sda5 on /var type reiserfs (rw,notail)
/dev/sda6 on /home type reiserfs (rw,notail,data=3Dordered)
/dev/sda7 on /usr type reiserfs (rw,notail)
/dev/sda8 on /opt type reiserfs (rw,notail)
/dev/sdb1 on /Pakete type reiserfs (rw,notail)
shmfs on /dev/shm type shm (rw)
usbdevfs on /proc/bus/usb type usbdevfs (rw)
/dev/sdb8 on /database/db4 type reiserfs (rw)
/dev/sdb7 on /database/db3 type reiserfs (rw)
/dev/sdb5 on /database/db1 type reiserfs (rw)
/dev/sdb6 on /database/db2 type reiserfs (rw)

SunWave1 /home/nuetzel# cat /proc/mounts
rootfs / rootfs rw 0 0
/dev/root / reiserfs rw,noatime 0 0
proc /proc proc rw 0 0
devpts /dev/pts devpts rw 0 0
/dev/sda2 /tmp reiserfs rw 0 0
/dev/sda5 /var reiserfs rw 0 0
/dev/sda6 /home reiserfs rw 0 0
/dev/sda7 /usr reiserfs rw 0 0
/dev/sda8 /opt reiserfs rw 0 0
/dev/sdb1 /Pakete reiserfs rw 0 0
shmfs /dev/shm shm rw 0 0
usbdevfs /proc/bus/usb usbdevfs rw 0 0
/dev/sdb8 /database/db4 reiserfs rw 0 0
/dev/sdb7 /database/db3 reiserfs rw 0 0
/dev/sdb5 /database/db1 reiserfs rw 0 0
/dev/sdb6 /database/db2 reiserfs rw 0 0

> Thank you for spelling and other corrections!

You are welcome ;-)

Thanks,
	Dieter
