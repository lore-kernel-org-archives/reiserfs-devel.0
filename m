From: Tom Oehser <tom@toms.net>
Subject: Symbol collisions in patch?
Date: Tue, 2 Apr 2002 21:41:55 -0500 (EST)
Message-ID: <Pine.LNX.4.44.0204022130330.32751-100000@conn6m.toms.net>
Mime-Version: 1.0
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com


Hi-

I've been working on a new 2.x.x version of tomsrtbt, presumably -2.2.20.

I want to include support for ReiserFS, honest I do.

But...

1) There is a missing patch from the latest 2.2.19 patch that causes the
   kernel to oops when it is unmounted.  I have the patch now at least.

2) There are symbol collisions that prevent supporting reiser AND ext3fs,
   *even as a module*.  Come on, guys, symbol collisions between the two
   most popular journalling filesystems?  Pa-thetic...

3) There is no support for version 3.6 filesystems in 2.2.x, so, what good
   is reiser support on my rescue diskette, if 2.4.x users can't use it?

4) There seems to be no-one concerned about any of these issues, or
   working on them, or talking about them.

5) My guess is that reiser-4 will be 2.5.x or 2.6.x only, and never get
   back-supported to 2.4, much less 2.2.x.

All of this is a problem for me.

The bleeding-edge crowd may not be aware of it, but a new kernel is about
to be released- it is now up to 2.0.40-rc4.  That's right, 2.0.40-rc4.
And I can tell you that scsi drivers and network card drivers are still
being updated for that.  And the ext2 sparse-super and filesystem-type
fixes were backported to 2.0.x.

So, the rest of the world is still willing to devote *some* effort to
supporting 2.0.x, (and libc5, for that matter), and *plenty* of effort to
supporting 2.2.x, but it seems that reiser doesn't isn't or won't...

So, at the moment, I'm just going to put ext3 support in there, and put
fixing the patch and all the symbols and backporting 3.6 support on my
personal low-priority back burner...

-Tom


