From: "David Dabbs" <david@dabbs.net>
Subject: Compile probs with yesterday's auto-snapshot
Date: Tue, 10 Aug 2004 14:19:54 -0500
Message-ID: <20040810192756.67EC115C33@mail03.powweb.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-20142-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: 'ReiserFS List' <reiserfs-list@namesys.com>



Yesterday I kept having problems with an "incomplete type error" compiling
yesterday's auto-snapshot. I finally ended up changing the
CONFIG_REISER4_SYSFS define in fs/reiser4/kattr.h (I think that's the file)
from (1) to (0). 

In a separate but related question, does the reiser4 patchset add the
kernel-build configurable options to the kconfig e.g.
REISER4_STATS/DEBUG/SYSFS/NOOPT/COPY_ON_CAPTURE/SYSCALL/<others?>...? I'm
sure LARGE_KEY is there, but I can't remember which other one I saw. If it
doesn't already should LARGE_KEY prompt with a default value of "Y"?

Also the READ.ME for the prior SNAPSHOT (03/26, yes ages ago I know) had the
following notes. Since the recent 08/04 snapshot only notes that "This is
mostly bug fix snapshot" should we assume that the prior notes are resolved
or that there are still issues with the items? I've made some notes below



1. Only i386 and UML on i386 are supported.
ddabbs: Big endian appears to be supported.

2. CONFIG_REISER4_FS_SYSCALL doesn't work.

3. CONFIG_REISER4_NOOPT doesn't work.

4. reiser4 has been tested as a root file system and works in read-only
   mode, but:

       . remount is not yet supported, 
       . support in boot-loaders may be missing

ddabbs: A grub patch is provided, so that comment is likely out-of-date.

9. reiser4 can now be compiled as a module.

ddabbs: I don't think this is working yet.


c. CONFIG_REISER4_COPY_ON_CAPTURE is stabler than before.

d. readdir() over NFS has known problems.

e. mmap(2)-intensive workloads (iozone benchmark in particular) have
problems in low-memory setups.


David


