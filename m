From: Torrey Hoffman <thoffman@arnor.net>
Subject: Mounting reiserfs with nonstandard journal size fails
Date: 29 Oct 2002 15:36:20 -0800
Message-ID: <1035934581.1487.1409.camel@rivendell.arnor.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-11829-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Linux Kernel <linux-kernel@vger.kernel.org>, Reiserfs List <reiserfs-list@namesys.com>

I'm having trouble mounting a reiserfs filesystem created with a
nonstandard (smaller) journal size.  But if I use the default journal
size, it works fine.

The filesystem is on a 64 MB compact flash attached to a USB reader. It
has a single partition, which appears as /dev/sda1.

I've done a little detective work with strace'ing mount (8). It calls
mount (2) which fails with EINVAL, which seems to indicate a bad
superblock in this case.  It appears that the in-kernel superblock
parsing for reiserfs does not understand non-standard journal sizes.

My kernel is an updated Red Hat 7.3 (2.4.18-10) and my reiserfsprogs are
3.6.3, downloaded from www.namesys.com and compiled locally.  My mount
program is version 2.11n, the standard Red Hat version.

Is this fixed in later kernels?

Another strange thing I noticed: if I strace a successful mount of the
normal reiserfs, I see two calls to mount (2) in the output.  The first
returns ENOSYS, which is not documented on the mount(2) manpage, but the
second identical call succeeds.  Weird.  Time to have a look at the
mount sourcecode I guess...

successful mount strace output:
...
mount("/dev/sda1", "/mnt/flash", "reiserfs", 0xc0ed0000, 0) = -1 ENOSYS
(Function not implemented)
mount("/dev/sda1", "/mnt/flash", "reiserfs", 0xc0ed0000, 0) = 0
...

Torrey Hoffman
thoffman@arnor.net
torrey.hoffman@myrio.com





