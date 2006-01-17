From: Jeff Mahoney <jeffm@suse.com>
Subject: [PATCH 0/4] reiserfs: load bitmap blocks on demand
Date: Tue, 17 Jan 2006 08:54:16 -0500
Message-ID: <20060117135416.GA8325@locomotive.unixthugs.org>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-27760-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: ReiserFS List <reiserfs-list@namesys.com>


Hello all -

The following patchset allows reiserfs to load its bitmap blocks on demand
like other file systems.

There are several reasons for this:
* Bitmap blocks, relative to other metadata blocks, are among the least used
  blocks in the file system. We don't cache the root node block, so why do
  we pin the bitmaps?

* Loading all the bitmaps at file system mount takes a lot of time. On multi-
  TB file systems, I've heard reports of file systems taking 15 minutes to
  mount. There go your 5 9's after one reboot.

* Keeping bitmaps in memory isn't free. The old argument of "large storage
  implies large memory" is no longer true. It's possible to assemble a multi-
  TB RAID array for a desktop for under $1000 these days. Memory prices have
  not fallen at the same rate.

There are 4 patches:
reiserfs-01-fix-is_reusable-bitmap-check.diff
  This fixes up the is_reusable() function up to calculate valid bitmap
  block numbers rather than compare them to the blocks of the pinned buffer
  heads for the bitmap blocks.

reiserfs-02-bitmap-info-bh-cleanup.diff
  Cleans up SB_AP_BITMAP(s)[n].bh accesses to use a temporary variable. It
  also uses proper bh refcounting, which may not make sense at this stage -
  but it's used later.

reiserfs-03-bitmap-loading-move.diff
  Moves the bitmap loading operations out of super.c and into bitmap.c where
  they belong.

reiserfs-04-on-demand-bitmap-loading.diff
  Actually implements the on-demand loading of bitmaps.

I've run some overnight testing on this under heavy load, but I'd still like
to see more testing before acceptance into mainline.

Since I've split out and reworked the patch some, I figured I'd send it to
the list for comment before sending to lkml.

-Jeff

--
Jeff Mahoney
SUSE Labs
