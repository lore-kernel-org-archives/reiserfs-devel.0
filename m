From: Vijayan Prabhakaran <pvijayan@gmail.com>
Subject: BUG in writeback mode - from data journaling patch
Date: Thu, 19 Aug 2004 13:32:04 -0500
Message-ID: <d68fdf7d040819113256eba856@mail.gmail.com>
Reply-To: Vijayan Prabhakaran <pvijayan@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-20408-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: mason@suse.com, reiserfs-list@namesys.com
Cc: vijayan@cs.wisc.edu

Dear Chris Mason,

I found a bug in writeback mode. In writeback mode, when a file block
was overwritten, the file's stat information was not getting updated.
For more details on this, please refer to my previous mail on the same
topic.

I tracked down the bug to the data journaling patch.

Bug description:
----------------

In file inode.c, there is a function called __commit_write(). In that
function, there is a "if" condition:

if (reiserfs_data_ordered(inode->i_sb)) {
  lock_kernel();
  add_to_flushlist(inode, bh);
  /* if we don't update the inode trans information,
   * an fsync(fd) might not catch these data blocks
   */

  reiserfs_update_inode_transaction(inode);
  unlock_kernel();
} else {
  buffer_insert_inode_data_queue(bh, inode);
}

If you look at the condition, for ordered mode, the inode transaction
information gets updated by the call
reiserfs_update_inode_transaction(). But, for writeback mode, this is
not done.

Since the inode transaction information is not updated, later in
function __commit_trans_jl() (which is in file journal.c), the
following "if" condition fails.

flush_commit_only:
if (journal_list_still_alive(inode->i_sb, id)) {
  ...
}

Because of this failure, the file's stat data, even though available
in the transaction list, did not get written to the disk.

Bug fix:
--------

If we add reiserfs_update_inode_transaction() call in __commit_write()
for the writeback mode, then it works fine. That is,

if (reiserfs_data_ordered(inode->i_sb)) {
  lock_kernel();
  add_to_flushlist(inode, bh);
  /* if we don't update the inode trans information,
   * an fsync(fd) might not catch these data blocks
   */

  reiserfs_update_inode_transaction(inode);
  unlock_kernel();
} else {
  reiserfs_update_inode_transaction(inode);
  buffer_insert_inode_data_queue(bh, inode);
}

Could you please verify this fix and if you think it is appropriate,
can you please add this to your patch.

I appreciate your help.

Thanks,
Vijayan
