From: jeffm@suse.com
Subject: [PATCH 0/4] reiserfs: tree block validation
Date: Tue,  9 May 2017 16:50:09 -0400
Message-ID: <20170509205013.568-1-jeffm@suse.com>
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-devel@vger.kernel.org
Cc: Jeff Mahoney <jeffm@suse.com>

From: Jeff Mahoney <jeffm@suse.com>

Hi all -

Over the years, I've received bug reports that mostly fall under the
fuzzer heading and were relatively low priority since physical access
to the hardware was required to actually get the corrupted file system
mounted.  Those days are long over and real validation is required.

Reiserfs has had the CONFIG_REISERFS_CHECK mode since the beginning
to do some sanity checking, but it's usually so heavyweight that it becomes
a performance impediment.

This patch set takes care of a few outstanding issues:
1) fixes the print formatting so that we don't end up with multiple threads
   accessing the error_buf at once.  Only one thread can change it, but
   another thread can overwrite it while another is printing it.
2) Adds tree block validation during media read and immediately before
   the block lands in the journal.  In this way, we can ensure we get
   an EIO instead of malformed records that can cause failures later.

The impetus, for me, is a real corruption bug that ended up crashing
a system.  This doesn't identify the corruption but it does limit the
damage it can cause.  I'm working on a followup patch to this series
that cleans up the journal dirtying in the tree balance code so that
we can invoke the validator in journal_mark_tree_block_dirty instead
of waiting for commit.  Then we will be able to more or less pinpoint
corruption immediately.  I have no target date for the completion of
that work yet, so I wanted to post these now.

-Jeff

Jeff Mahoney (4):
  reiserfs: constify read-only helpers
  reiserfs: use snprintf for buffer formatting
  reiserfs: protect message formatting and printing with mutex
  reiserfs: perform tree block sanity checks at read/write

 fs/reiserfs/do_balan.c |   7 +-
 fs/reiserfs/fix_node.c |   4 +-
 fs/reiserfs/inode.c    |   6 +-
 fs/reiserfs/journal.c  |  42 +++++-
 fs/reiserfs/namei.c    |   6 +-
 fs/reiserfs/prints.c   | 253 ++++++++++++++++++++++-----------
 fs/reiserfs/reiserfs.h |  57 +++++---
 fs/reiserfs/stree.c    | 372 ++++++++++++++++++++++++++++++++++++++++++++++++-
 fs/reiserfs/super.c    |   8 +-
 9 files changed, 632 insertions(+), 123 deletions(-)

-- 
2.11.0

