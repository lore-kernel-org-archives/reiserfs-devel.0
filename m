From: jeffm@suse.com
Subject: [patch 00/40] reiserfs: patch queue (v2)
Date: Mon, 11 Jun 2007 15:03:09 -0400
Message-ID: <20070611190309.532091171@suse.com>
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: ReiserFS Mailing List <reiserfs-devel@vger.kernel.org>

Hi all -

The following are a series of patches that have been kicking around for a
while. I thought I'd just put them out there to gauge interest and to get
some testing before submitting to -mm.

I've re-ordered a few of the patches. This is actually four distinct,
unrelated, though context-dependent, patch series. I've moved the trivial
changes to the front of the list to better reflect that.

There are a few groups:
* Little changes (01-04)
  - Fixes lockdep warnings in xattr code.
  - Changes reiserfs_panic() to panic() instead of BUG.
  - Includes bitmap is_reusable unconditionally and uses to to catch
    corruption. This is light-weight now that the stupid loop is gone.
  - Make bitmap used cached first zero bit.

* Error handling (05-11)
  - Reformat error/warning/panic/info/etc messages to be consistent with one
    another.
  - Makes some warnings informational. Rather than printing the
    reiserfs_warning() full preamble to declare that a mount option was
    invalid, we use reiserfs_info instead.
  - Rework reiserfs_warning to take a unique ID, print the function name,
    print the device name.
  - Rework reiserfs_panic similarly.
  - Add reiserfs_error() to handle metadata errors.
  - Use reiserfs_error().

* Extended attributes (12-22)
  - Simplify internal file lookups/opens.
  - Eliminate per-super xattr lock.
  - Make per-inode xattr lock more fine-grained.
  - Remove i_has_xattr_dir flag.
  - Remove shared xattr detection (unused).
  - Use generic xattr handler infrastructure.
  - Use O_NOATIME for internal file opens.
  - Add per-file data=ordered mode and use it for xattrs.
  - Journal xattrs.
  - Kill xattr_readdir in favor of a for_each_xattr.
  - Add atomic addition of selinux attributes during inode creation.
 
* Cleanups, code readability (23-30)
  - Cleanup path functions to reduce redundancy.
  - Strip trailing whitespace from all reiserfs code.
  - Rename p_s_sb to sb.
  - Rename p_s_bh to bh.
  - Rename p_s_inode to inode.
  - Rename p_s_tb to tb.
  - Rename misc p_._ variables.
  - Rename [cn]_* variables.

* Clean up do_balan.c (31-40)
  - Factor out buffer_info initializations.
  - Turn tb->s[12]num and tb[12]bytes into an array.
  - Split balance_leaf from the 2500 line beast to more manageable chunks.
  - Clean up balance_leaf_when_delete.
  - Clean up comments.

I look forward to comments. The journaled xattr changes in particular need 
testing as deadlocks may still lurk in there.

Changes:
 - Reworked journal abort code to provide cleaner syslog output 
 - Always abort journal on error, unless panicking
 - Always use bl_ prefix in do_balan.c
 - Fixed unchecked deref in reiserfs_free_block

I've also posted the patch set here:
ftp://ftp.suse.com/pub/people/jeffm/reiserfs/kernel-v2.6/2.6.22-rc4-git3/

-Jeff

-- 
Jeff Mahoney
SUSE Labs

