From: Jan Kara <jack@suse.cz>
Subject: another BUG with journaled quotas (fwd)
Date: Tue, 20 Dec 2005 11:49:13 +0100
Message-ID: <20051220104913.GB9270@atrey.karlin.mff.cuni.cz>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-27453-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

  Hello,

  recently I got the following backtrace from one user:

BUG at fs/reiserfs/journal.c: 3097!
invalied operand: 0000 [#1]
EIP is at journal_begin
Process nfsd...

Call trace:
reiserfs_write_dquot
_reiserfs_free_block
dquot_free_space
reiserfs_free_prealloc_block
__discard_prealloc
reiserfs_discard_all_prealloc
do_journal_end
reiserfs_dirty_inode
__mark_inode_dirty
journal_end
reiserfs_submit_file_region_for_write
reiserfs_file_write
<snip uninteresting part>

  What happened there is that we were in do_journal_end() and we wanted
to discard some preallocation. We proceeded up to freeing the block but
then reiserfs_write_dquot() wanted to start a transaction for quota
operation and we got BUG() as the transaction handle that is passed to
functions for discarding preallocation has already refcount == 0.
  If I understood the preallocation code properly, the preallocation
happens only "inside one transaction" - i.e., we allocate more space at
the beginning of the transaction and when we are dropping the last
reference to the handle we discard all the space left. Am I right?
  If so, the problem in the Ooops is mostly cosmetic as all the blocks
needed for quota operation are already attached to the transaction from
the allocation phase. So just raising the refcount of the handle for the
time of discarding the preallocation to make the checks happy should be
enough. But I'm not sure this is the Right Fix... Does somebody have any
better ideas/solutions to the problem?

							Bye
								Honza
