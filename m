From: Wes Gray <smiths@alumni.cse.ucsc.edu>
Subject: Can't mount / at boot as of kernel 2.4.21
Date: Sat, 6 Dec 2003 22:29:44 -0800
Message-ID: <20031207062944.GB1925@beavis>
Reply-To: smiths@alumni.cse.ucsc.edu
Mime-Version: 1.0
Return-path: <reiserfs-list-return-16273-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

My root is reiserfs, and works fine for kernel 2.4.20, but as of 2.4.21
during boot it mounts readonly OK, but when it goes to remount read-write,
the command:

mount / -n -o remount,rw

fails with "mount: / not mounted already, or bad option".

This problem is very similar to FAQ question #11, but the error message
is different and I've tried "reiserfsck --rebuild-sb" and it said my
superblock was fine.  I'm wondering what other "sanity checks" were added
to the kernel though.

It is possible there is an error in the boot scripts and it is trying
to remount an fs that is not mounted at all, but this is not a
problem with previous kernel versions.  Did it become pickier about this?

I am running Gentoo with reiserfs-v0.3.0.3 and reiserfsprogs-v3.6.8.
