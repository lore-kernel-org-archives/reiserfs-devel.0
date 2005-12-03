From: Charles Johnston <charles@infoplatter.com>
Subject: Booting problem from root reiser4 after new kernel
Date: Sat, 03 Dec 2005 10:26:04 -0700
Message-ID: <1133630764.2915.8.camel@mercury>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-27179-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

I've been keeping quite up-to-date with new kernels, so I compiled
2.6.15-rc4 plus the reiser4 patches from 2.6.15-rc3-mm1 plus the
reiser4-fix-fsync.patch.

I'm using grub 0.97 with the 20050808 reiser4 patch.

Put the new kernel in /boot, modified /boot/grub/menu.lst for it,
rebooted, and got the following error, after "Uncompressing Linux":

ran out of input data

system halted


So, after trying different things to no avail, I just made another copy
of the kernel file, and it booted fine from that.  I'm thinking it's
something to do with the way the original file is layed out on disk, and
grub w/ reiser4 is having trouble with it.

What's the best way to read off the meta-data for just that one file?
I've wanted to contribute something to Reiser4 development for a while
now.  Perhaps I can figure out what's causing this boot problem and fix
it.


Thanks.

Charles Johnston

