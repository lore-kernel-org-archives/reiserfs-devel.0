From: Vitaly Fertman <vitaly@namesys.com>
Subject: Re: SUSE 9.1 with ReiserFS:  / won't fsck, but is otherwise fine
Date: Mon, 27 Sep 2004 18:44:11 +0400
Message-ID: <200409271844.11580.vitaly@namesys.com>
References: <1095996040.10293.18.camel@xserver.local.net> <200409241116.09066.vitaly@namesys.com> <1096032016.17001.4.camel@xserver.local.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-21935-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1096032016.17001.4.camel@xserver.local.net>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Chris Worley <cworley@symbionsys.com>, reiserfs-list@namesys.com

> # ./fsck/reiserfsck  /dev/system/lvol0
> reiserfsck 3.6.18 (2003 www.namesys.com)
>
> Failed to open the device '/dev/system/lvol0': No such device or address

it seems 
	open ('/dev/system/lvol0', O_RDONLY);
returns "No such device or address". You can check it with strace.

what if you run
	reiserfsck /dev/mapper/system-lvol0

> Note that I am building reiserfs statically in the kernel (SuSE's
> 2.6.5-52-bigsmp).
>
> > > > ...
> > >
> > > I'm getting the same error where the ReiserFS root partition won't
> > > fsck, but seems otherwise fine:
> > >
> > > I "fixed" it by replacing /sbin/mkfs.reiserfs with a script that always
> > > returns true... now the system boots fine ;)
> > >
> > > It's a Reiser fs atop an LVM block device of one partition.  The
> > > problem started when I switched from lilo to grub... that could be
> > > irrelevant.
> > >
> > > Once booted, Reiser still doesn't even recognize the root file system
> > > (I saved the executable in fsck.reiserfs.bak):
> > >
> > >         # /sbin/fsck.reiserfs.bak /dev/system/lvol0
> > >         reiserfsck 3.6.13 (2003 www.namesys.com)
> > >
> > >         Failed to open the device '/dev/system/lvol0': No such device
> > > or address
> > >
> > > Note: I'm running a fully patched 9.1.  I've been able to use this
> > > fsck.reiserfs to examine other LVM based file systems that were created
> > > under previous LVM and ReiserFS versions.  The volume is currently only
> > > made up of /dev/hda3.  Both the lvm block device and reiser format were
> > > created under SuSE9.1 (before patching).  LVM has no problems:

have you got this problem just after moving to this kernel 
(SuSE's 2.6.5-52-bigsmp)? or upgrading the lvm tools? 
the problem is likely to be somewhere in lvm code. 

> > >          # pvscan
> > >           PV /dev/hda3   VG system   lvm2 [226.25 GB / 0    free]
> > >           PV /dev/hdd1               lvm2 [233.76 GB]
> > >           Total: 2 [460.01 GB] / in use: 1 [226.25 GB] / in no VG: 1
> > > [233.76 GB] # vgdisplay
> > >           --- Volume group ---
> > >           VG Name               system
> > >           System ID
> > >           Format                lvm2
> > >           Metadata Areas        1
> > >           Metadata Sequence No  2
> > >           VG Access             read/write
> > >           VG Status             resizable
> > >           MAX LV                255
> > >           Cur LV                1
> > >           Open LV               1
> > >           Max PV                255
> > >           Cur PV                1
> > >           Act PV                1
> > >           VG Size               226.25 GB
> > >           PE Size               4.00 MB
> > >           Total PE              57921
> > >           Alloc PE / Size       57921 / 226.25 GB
> > >           Free  PE / Size       0 / 0
> > >           VG UUID               glCBN4-xLPB-eGJO-4YVO-p4Hj-ZRMW-LFvJfJ
> > >         # lvdisplay
> > >           --- Logical volume ---
> > >           LV Name                /dev/system/lvol0
> > >           VG Name                system
> > >           LV UUID                j9z3cd-hY3R-4unM-UwZs-BXVZ-WMJN-iMIvXF
> > >           LV Write Access        read/write
> > >           LV Status              available
> > >           # open                 2
> > >           LV Size                226.25 GB
> > >           Current LE             57921
> > >           Segments               1
> > >           Allocation             next free (default)
> > >           Read ahead sectors     0
> > >           Block device           254:0
> > >         # pvdisplay
> > >           --- Physical volume ---
> > >           PV Name               /dev/hda3
> > >           VG Name               system
> > >           PV Size               226.25 GB / not usable 0
> > >           Allocatable           yes (but full)
> > >           PE Size (KByte)       4096
> > >           Total PE              57921
> > >           Free PE               0
> > >           Allocated PE          57921
> > >           PV UUID               wQnbCq-FQT9-76gh-HjFP-kBi3-7lE8-psDnAj
> > >
> > >           --- NEW Physical volume ---
> > >           PV Name               /dev/hdd1
> > >           VG Name
> > >           PV Size               233.76 GB
> > >           Allocatable           NO
> > >           PE Size (KByte)       0
> > >           Total PE              0
> > >           Free PE               0
> > >           Allocated PE          0
> > >           PV UUID               lZ0dSs-FR6O-i7fo-z5xZ-APMR-CcBq-Fmm425
> > >         # df
> > >         Filesystem           1K-blocks      Used Available Use% Mounted
> > > on /dev/mapper/system-lvol0
> > >                              237237168 141678036  95559132  60% /
> > >         tmpfs                   517676         0    517676   0%
> > > /dev/shm /dev/hda1                38856     18321     18529  50% /boot
> > >
> > > Other than fsck, there's no other hint that something is wrong with
> > > this partition.
> > >
> > > If this partition were at the beginning of the disk (and not 8GB into
> > > the disk) I'd think grub had destroyed something beyond the MBR... but
> > > this is too far into the disk.
> > >
> > > Any idea what's wrong with this root partition and what I could do to
> > > recover it?
> > >
> > > Thanks,
> > >
> > > Chris

-- 
Thanks,
Vitaly Fertman

