From: Christian Mayrhuber <christian.mayrhuber@gmx.net>
Subject: Re: Data-logging and md as / fs bug
Date: Wed, 7 May 2003 16:41:37 +0200
Message-ID: <200305071641.37361.christian.mayrhuber@gmx.net>
References: <3EB30852.6090402@netscape.net> <200305062253.11535.christian.mayrhuber@gmx.net> <1052310840.14616.344.camel@tiny.suse.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-13986-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1052310840.14616.344.camel@tiny.suse.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Chris Mason <mason@suse.com>, reiserfs-list <reiserfs-list@namesys.com>

Am Mittwoch, 7. Mai 2003 14:34 schrieb Chris Mason:

> > > 2) try to reproduce with only 02-akpm-b_journal_head-1.diff and
> > > 03-2.4.21-rc1-relocation-6.diff applied.
> >
> > The bug already appears in case 2) with akpm and relocation only applied.
>
> I'd like to make sure I'm tracking the right problem.  Could you please
> send me the exact kernel messages from the failed shutdown?
>
> -chris


/dev/md0 is reiserfs mounted / and /dev/md1 is swap space, messages are from a
Debian woody system. /dev/md0 needs to resync after reboot.
/dev/md0 consists of hda1 and hdc1
/dev/md1 consists of hda2 and hdc2
The
Here's the output from the failed shutdown:

Stopping RAID devices: md: md0 still in use
/dev/md0: Device or resource busy
md: marking sb clean...
md: updating md1 RAID superblock on device
md: hdc2 [events: 00000259]<6>(write) hdc2's sb offset: 2000000
md: hda2 [events: 00000259]<6>(write) hda2's sb offset: 2000256
md: md1 stopped
md: unbind <hdc2,1>
md: export_rdev(hdc2)
md: unbind <hda2,0>
md: export_rdev(hda2)
/dev/md1 done.
md: stopping all devices.
md: md0 still in use.
flushing ide devices: hda hdb hdc
Power down.


For the case you need them the boot messages after reboot:

May  7 16:23:42 byblos kernel: md: linear personality registered as nr 1
May  7 16:23:42 byblos kernel: md: raid0 personality registered as nr 2
May  7 16:23:42 byblos kernel: md: raid1 personality registered as nr 3
May  7 16:23:42 byblos kernel: md: raid5 personality registered as nr 4
May  7 16:23:42 byblos kernel: raid5: measuring checksumming speed
May  7 16:23:42 byblos kernel:    8regs     :  2527.600 MB/sec
May  7 16:23:42 byblos kernel:    32regs    :  2236.000 MB/sec
May  7 16:23:42 byblos kernel:    pIII_sse  :  4679.200 MB/sec
May  7 16:23:42 byblos kernel:    pII_mmx   :  3864.000 MB/sec
May  7 16:23:42 byblos kernel:    p5_mmx    :  4949.200 MB/sec
May  7 16:23:42 byblos kernel: raid5: using function: pIII_sse (4679.200 MB/sec)
May  7 16:23:42 byblos kernel: md: multipath personality registered as nr 7
May  7 16:23:42 byblos kernel: md: md driver 0.90.0 MAX_MD_DEVS=256, MD_SB_DISKS=27
May  7 16:23:42 byblos kernel: md: Autodetecting RAID arrays.
May  7 16:23:42 byblos kernel:  [events: 00000161]
May  7 16:23:42 byblos kernel:  [events: 00000259]
May  7 16:23:42 byblos kernel:  [events: 00000161]
May  7 16:23:42 byblos kernel:  [events: 00000259]
May  7 16:23:42 byblos kernel: md: autorun ...
May  7 16:23:42 byblos kernel: md: considering hdc2 ...
May  7 16:23:42 byblos kernel: md:  adding hdc2 ...
May  7 16:23:42 byblos kernel: md:  adding hda2 ...
May  7 16:23:42 byblos kernel: md: created md1
May  7 16:23:42 byblos kernel: md: bind<hda2,1>
May  7 16:23:42 byblos kernel: md: bind<hdc2,2>
May  7 16:23:42 byblos kernel: md: running: <hdc2><hda2>
May  7 16:23:42 byblos kernel: md: hdc2's event counter: 00000259
May  7 16:23:42 byblos kernel: md: hda2's event counter: 00000259
May  7 16:23:42 byblos kernel: md: RAID level 1 does not need chunksize! Continuing anyway.
May  7 16:23:42 byblos kernel: md1: max total readahead window set to 124k
May  7 16:23:42 byblos kernel: md1: 1 data-disks, max readahead per data-disk: 124k
May  7 16:23:42 byblos kernel: raid1: device hdc2 operational as mirror 1
May  7 16:23:42 byblos kernel: raid1: device hda2 operational as mirror 0
May  7 16:23:42 byblos kernel: raid1: raid set md1 active with 2 out of 2 mirrors
May  7 16:23:42 byblos kernel: md: updating md1 RAID superblock on device
May  7 16:23:42 byblos kernel: md: hdc2 [events: 0000025a]<6>(write) hdc2's sb offset: 2000000
May  7 16:23:42 byblos kernel: md: hda2 [events: 0000025a]<6>(write) hda2's sb offset: 2000256
May  7 16:23:42 byblos kernel: md: considering hdc1 ...
May  7 16:23:42 byblos kernel: md:  adding hdc1 ...
May  7 16:23:42 byblos kernel: md:  adding hda1 ...
May  7 16:23:42 byblos kernel: md: created md0
May  7 16:23:42 byblos kernel: md: bind<hda1,1>
May  7 16:23:42 byblos kernel: md: bind<hdc1,2>
May  7 16:23:42 byblos kernel: md: running: <hdc1><hda1>
May  7 16:23:42 byblos kernel: md: hdc1's event counter: 00000161
May  7 16:23:42 byblos kernel: md: hda1's event counter: 00000161
May  7 16:23:42 byblos kernel: md: md0: raid array is not clean -- starting background reconstruction
May  7 16:23:42 byblos kernel: md: RAID level 1 does not need chunksize! Continuing anyway.
May  7 16:23:42 byblos kernel: md0: max total readahead window set to 124k
May  7 16:23:42 byblos kernel: md0: 1 data-disks, max readahead per data-disk: 124k
May  7 16:23:42 byblos kernel: raid1: device hdc1 operational as mirror 1
May  7 16:23:42 byblos kernel: raid1: device hda1 operational as mirror 0
May  7 16:23:42 byblos kernel: raid1: raid set md0 not clean; reconstructing mirrors
May  7 16:23:42 byblos kernel: raid1: raid set md0 active with 2 out of 2 mirrors
May  7 16:23:42 byblos kernel: md: updating md0 RAID superblock on device
May  7 16:23:42 byblos kernel: md: hdc1 [events: 00000162]<6>(write) hdc1's sb offset: 19534912
May  7 16:23:42 byblos kernel: md: syncing RAID array md0
May  7 16:23:42 byblos kernel: md: minimum _guaranteed_ reconstruction speed: 100 KB/sec/disc.
May  7 16:23:42 byblos kernel: md: using maximum available idle IO bandwith (but not more than 100000 KB/sec) for reconstruction.
May  7 16:23:42 byblos kernel: md: using 124k window, over a total of 19534912 blocks.
May  7 16:23:42 byblos kernel: md: hda1 [events: 00000162]<6>(write) hda1's sb offset: 19534912
May  7 16:23:42 byblos kernel: md: ... autorun DONE.
-- 
lg, Chris


