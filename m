From: Chris Mason <mason@suse.com>
Subject: [PATCH] data logging patches available for 2.4.21-preX
Date: 15 Jan 2003 16:20:58 -0500
Message-ID: <1042665658.31095.1374.camel@tiny.suse.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-12367-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

Hello all,

I've updated the data logging patches to 2.4.21-pre3, once the suse
mirror is done updating, you can download them from:

ftp.suse.com/pub/people/mason/patches/data-logging/2.4.21

Changes:

mount -o remount can switch between data modes.

transaction overflow bug fix (BUG in journal_mark_dirty)

fix for -ENOSPC hang when the block size < page size (ia64, alpha)

integration with akpm's b_journal_head code from -ac.  Should make it
possible for these patches to work both on vanilla kernels and Alan's
branch.  I haven't tried this yet though, so testers would be
appreciated.

commit_super is now sync_fs

I had to rework some of the data=ordered buffer handling code to merge
with the changes in 2.4.21-preX, so use some caution with this code.

-chris


