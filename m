From: Dieter =?iso-8859-15?q?N=FCtzel?= <Dieter.Nuetzel@hamburg.de>
Subject: Re: reiserfsprogs 3.6.5 release
Date: Mon, 31 Mar 2003 23:29:06 +0200
Message-ID: <200303312329.06469.Dieter.Nuetzel@hamburg.de>
References: <200303251108.11938.Dieter.Nuetzel@hamburg.de> <200303312208.31690.vitaly@namesys.com> <200303312152.23736.Dieter.Nuetzel@hamburg.de>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-13500-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200303312152.23736.Dieter.Nuetzel@hamburg.de>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Vitaly Fertman <vitaly@namesys.com>, "Luna Kid (list-reader address)" <listreader@neuropolis.org>, ReiserFS List <reiserfs-list@namesys.com>

Am Montag, 31. M=E4rz 2003 21:52 schrieb Dieter N=FCtzel:
> Am Montag, 31. M=E4rz 2003 20:08 schrieb Vitaly Fertman:
> > Hi,
> >
> > On Monday 31 March 2003 22:00, Luna Kid \(list-reader address\) wrote:
> > > > All partitions wouldn't mounted due to
> > > > "flush_buffers: device is not specified". ;-(
> > >
> > > Any news on this topic? I've got that exact same problem
> > > since a Debian upgrade, on a (fortunately!) completely
> >
> > I added some debug messages in reiserfsck, and asked Dieter to send me
> > the printed reiserfsck boot messages. Unfortunately I has not got a
> > response yet. Could you do it for me when I send you the same debug
> > version?
>
> Sorry for my delay!
> I was unexpected out for some days...
>
> Have to reboot and write down the lines.
> Will do, now.

Here it comes ;-)

[more boot log snipped]

reiserfs: found format "3.6" with standard journal
reiserfs: using ordered data mode
reiserfs: checking transaction log (sd(8,3)) for (sd(8,3))
Using r5 hash to sort names
VFS: Mounted root (reiserfs filesystem) readonly.
=46reeing unused kernel memory: 108k freed
INIT: version 2.78 booting
Running /etc/init.d/boot
Mounting /proc/device
Mounting /dev/ptsblogd
Activating swap-devices in /etc/fstab...
Adding Swap: 1028120k swap-space (priority -1)
Checking file systems...
fsck 1.24a (02-Sep-2001)

fsck.reiserfs -a /dev/sda3

Reiserfs super block in block 16 on 0x803 of format 3.6 with standard journ=
al
Blocks (total/free): 26105/6626 by 4096 bytes
=46ilesystem is cleanly umounted
=46ilesystem seems mounted read-only. Skipping journal replay.
Checking internal tree..finished

fsck.reiserfs -a /dev/sda2

fsck.reiserfs -a /dev/sdb1

Reiserfs super block in block 16 on 0x802 of format 3.6 with standard journ=
al
Blocks (total/free): 379535/366247 by 4096 bytes
=46ilesystem is cleanly umounted

flush_buffers: device is not specified
Warning... fsck.reiserfs for device /dev/sda2 exited with signal 6.

fsck.reiserfs -a /dev/sda5

Reiserfs super block in block 16 on 0x811 of format 3.6 with standard journ=
al
Blocks (total/free): 255024/60978 by 4096 bytes
=46ilesystem is cleanly umounted

flush_buffers: device is not specified
Warning... fsck.reiserfs for device /dev/sdb1 exited with signal 6.

fsck.reiserfs -a /dev/sdb5

Reiserfs super block in block 16 on 0x805 of format 3.6 with standard journ=
al

etc...

fsck FAILED

All partition checks fail alternating with signal 6.
Useful for you?

Regards,
	Dieter
