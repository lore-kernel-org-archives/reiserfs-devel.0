From: Julia Wolf <julia@virtadpt.net>
Subject: Re: making reiser4/AMD64 hardlock
Date: Thu, 4 Nov 2004 16:53:53 -0500 (EST)
Message-ID: <Pine.LNX.4.51.0411041617390.5646@leandra.the-lab.virtadpt.net>
References: <1099472359.8158.36.camel@localhost>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-22277-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1099472359.8158.36.camel@localhost>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jake Maciejewski <maciejej@msoe.edu>
Cc: reiserfs-list@namesys.com


On Wed, 3 Nov 2004, Jake Maciejewski wrote:

> I've been testing reiser4 on 2.6.9 (patches from 2.6.9-mm1 and fixes
> from reiser4-for-2.6.9.diff). I have reiser4progs and libaal 1.0.1.
> Syslog doesn't catch any errors when I get hardlocks (haven't tried
> SysRq). I figured I could at least give you guys a hint about what kind
> of usage pattern kills reiser4.
[...]
> Now here's the interesting part. Other FSs on the same drive can run the
> command without locking, and better yet, either component of the command
> runs without trouble on reiser4! It's the combination of make and dd
> that kills my system. Even stranger is that I can run the dd part of the
> command on a reiserFS (v3) on the same drive and it still locks. Could
> the problem be in the patches rather than the reiser4 core?


  This sounds very similar to a problem I'm having which I havn't fully
analyzed yet (which I wanted to do before writing a bug report like this)

  On a regular 32-bit AMD Athlon XP 2500+ (K7 core) on a fresh Gentoo
(2004.2) install, with the newest reiserfsprogs emerged. (mkreiserfs
3.6.19 and mkfs.reiser4 1.0.2-pre1) With the following kernels:
2.6.9-rc3-mm4
2.6.9-mm1
2.6.10-rc1-mm1
Linus 2.6.9 with the patches from ftp.namesys.com/pub/reiser4-for-2.6.9/

  I have a PATA 250G Western Digital Drive, which is Reiserfs3, and a
fresh SATA 250G Hitachi Drive, which will be Reiserfs4. Unfortunately,
when I copy the files from the PATA drive to the new SATA drive the
machine hard locks after about 200G. Alt+SysReq doesn't work, the caps
lock key doesn't even work, so I guess interupts are off.  There is
nothing that shows up in the system logs either.

  I've build the kernel without highmem or SMP. And with ReiserFS4
debugging on. I've tried it with and without register arguments. Kernel
Pre-emption is off.

  I have 512M of ram, and whether or not swap is available makes no
difference.

  I was originally suspecting that the -mm kernel broke something in
libsata or some other block device layer. Because I tried reiserfs3 and it
locked up too. But I later discovered that dd if=/dev/zero of=/dev/sda
works fine (no lock up or anything), and mke2fs -j -m0 /dev/sda gives me a
filesystem which I can completely fill and not have it crash either. The
MD5 hashes of everything check out as well. And this happens with the
Linux tree and just the reiserfs4 patches.

  The filesystem I'm tring to copy contains 1799635 regular files and
103228 directories for a total of 244191068 bytes. The files it was on at
the times that it crashed were all ~700M sized files. After a reboot, I
could usuially recopy the file is was copying when it crashed, and then
maybe part of another one, and then it would lock up again.

  fsck.reiser4 reported no error with the filesystem after these crashes.
I created the reiser3 filesystem with the defaults (except --force) and
for the reiserfs4 filesystem I used the defaults (except --force for whole
device) and created one with a tail policy of "tails" insted of "smart"
(Didn't make a difference)
