From: Chris Mason <mason@suse.com>
Subject: v3 experimental data=ordered and logging speedups for 2.6.1
Date: Mon, 19 Jan 2004 11:45:26 -0500
Message-ID: <1074530725.29546.178.camel@tiny.suse.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-16571-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com, green@linuxhacker.ru

Hello everyone,

I've got most of data=ordered finished, there are a few paths like
writepage and O_DIRECT that need tweaking.  Thanks to Oleg's file_write
work in 2.6.x, the data=journal patch is much cleaner than 2.4, it is
almost done but not included in the bunch of patches I just uploaded to
ftp.suse.com.  Oleg is cc'd in case he wants to look over the changes to
reiserfs_file_write in reiserfs-jh-2.

The code has survived a weekend of moderate load, but you still want it
very far away from production servers.  I'm headed off to linux world in
NYC for the rest of the week, and I wanted to post this for review and
the few brave souls out there who might want to give it a try.

ftp.suse.com/pub/people/mason/patches/data-logging/experimental/2.6.1

The README:

Experimental reiserfs data=ordered and logging speedups against 2.6.1

Apply these in order:

01-reiserfs-journal-writer
removes old stale debugging code, very safe

02-reiserfs-nesting
Adds support for nested transactions in reiserfs, needed for the quota code,
and ported from 2.4.x by Jeff Mahoney

03-reiserfs-iosize
Changes reiserfs to tell userspace the default io size is 4k.  Works around
a bug in bdb hit by rpm users

04-reiserfs-balance_dirty
Changes reiserfs_file_write to throttle writers the way the rest of linux
does.  This patch has already been sent for inclusion, it should get in soon

05-reiserfs-logging
Logging speedups for small transactions and fsync heavy applications.  Most
experimental patch of the bunch, since it changes the way the log does
metadata writeback

06-reiserfs-jh-2
Adds data=ordered support, along with a journal header attached to
the buffer head.  This allows for more efficient data=ordered support
than I had in 2.4.x.

-chris


