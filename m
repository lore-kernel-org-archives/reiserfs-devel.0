From: Chris Mason <mason@suse.com>
Subject: v3 logging speedups for 2.6
Date: Thu, 11 Dec 2003 13:10:28 -0500
Message-ID: <1071166228.11147.122.camel@tiny.suse.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-16333-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

Hello everyone,

This is part one of the data logging port to 2.6, it includes all the
cleanups and journal performance fixes.  Basically, it's everything
except the data=journal and data=ordered changes.

The 2.6 merge has a few new things as well, I've changed things around
so that metadata and log blocks will go onto the system dirty lists. 
This should make it easier to improve log performance, since most of the
work will be done outside the journal locks.

The code works for me, but should be considered highly experimental.  In
general, it is significantly faster than vanilla 2.6.0-test11, I've done
tests with dbench, iozone, synctest and a few others.  streaming writes
didn't see much improvement (they were already at disk speeds), but most
other tests did.

Anyway, for the truly daring among you:

ftp.suse.com/pub/people/mason/patches/data-logging/experimental/2.6.0-test11

The more bug reports I get now, the faster I'll be able to stabilize
things.  Get the latest reiserfsck and check your disks after each use.

-chris


