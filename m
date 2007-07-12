From: jeffm@suse.com
Subject: [patch 00/11] reiserfs fixups and error handling
Date: Thu, 12 Jul 2007 15:37:38 -0400
Message-ID: <20070712193738.112875514@mail.jeffreymahoney.com>
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: ReiserFS Development Mailing List <reiserfs-devel@vger.namesys.com>, Vladimir Saveliev <vs@namesys.com>

 This is the first part of a series of patches I've been developing for
 reiserfs. I'm posting them now for review followed by submission to 2.6.23.

 The first 4 patches are small fixes:
 * Adding proper lockdep annotation to xattrs
 * Switching to panic() instead of BUG() in reiserfs_panic()
 * Making is_reusable bitmap sanity checking unconditional
 * Using the first zero hint in bitmap iteration

 The remaining 7 work to make reiserfs error handling more consistent
 and robust:
 * Use consistent message prefixes for all reiserfs log output
 * Add a reiserfs_info() call for multiline output that doesn't
   masquerade as a warning.
 * Make reiserfs_warning() calls more consistent, requiring an ID, and
   including the device and function where the warning is occuring.
 * Make reiserfs_panic() more consistent in the same manner.
 * Rearrange reiserfs_journal_abort() since it was modelled after jbd's
   call and doesn't need to be. There's several function calls that
   just get optimized out anyway.

 * Add a reiserfs_error() call to handle metadata errors by aborting
   the journal and marking the file system read-only.
 * Convert 50 reiserfs_warning(), 2 reiserfs_panic(), and one BUG_ON
   site to use the new reiserfs_error().,

-Jeff

-- 
Jeff Mahoney
SUSE Labs

