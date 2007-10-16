From: Jeff Mahoney <jeffm@suse.com>
Subject: [patch 0/7] reiserfs fixes patch set
Date: Tue, 16 Oct 2007 19:02:10 -0400
Message-ID: <20071016230210.779927000@suse.com>
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andrew Morton <akpm@linux-foundation.org>, Linux Torvalds <torvalds@linux-foundation.org>
Cc: ReiserFS Development Mailing List <reiserfs-devel@vger.kernel.org>

 This is a series of "safe" patches that have been in the openSUSE kernel
 for a while now.

 * patches.suse/reiserfs-fix-lockdep-warnings
   - Adds lockdep annotation to the xattr locks

 * patches.suse/reiserfs-no-bug-on-panic.diff
   - Replaces BUG with dump_stack in reiserfs_panic so it actually panics.

 * patches.suse/reiserfs-use-is_reusable.diff
   - Enables is_reusable() for bitmap sanity checking unconditionally.

 * patches.suse/reiserfs-signedness-fixes.diff
   - Ensures that block numbers are _always_ unsigned by using b_blocknr_t.

 * patches.suse/reiserfs-fix-resize-meminit.diff
   - Fixes a case where the old block number count was used to zero out
     the bitmap info array during resize.

 * patches.suse/reiserfs-remove-first-zero-hint.diff
   - Removes the first_zero_hint bitmap tracking code and extends the
     free count to 32-bit for support of block sizes > 8 KiB.

 * patches.suse/reiserfs-fix-large-fs.diff
   - Ignores the 16-bit on-disk bitmap block count value to allow file systems
     larger than 8 TiB.

 Please apply.

 -Jeff

--
Jeff Mahoney
SUSE Labs

