From: Andrey Savochkin <saw@saw.sw.com.sg>
Subject: question about a possible deadlock
Date: Fri, 26 Apr 2002 15:07:26 +0400
Message-ID: <20020426150726.A25444@castle.nmd.msu.ru>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-10181-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

Hi,

I've found a call sequence leading to what looks like a deadlock:
open
  reiserfs_create
    journal_begin
    reiserfs_new_inode
      failure by one of multiple reasons
      iput [note that inode->i_nlink == 0]
        reiserfs_delete_inode
          journal_begin
            deadlock, waiting for previous journal_begin to end
The code was checked by the mainstream 2.4.18 kernel.
Any reasons why this deadlock can't happen?

My reading is that the deadlock should happen under the condition expressed
in the code as
  if (  (!join && SB_JOURNAL(p_s_sb)->j_must_wait > 0) ||
     ( !join && (SB_JOURNAL(p_s_sb)->j_len_alloc + nblocks + 2) >= JOURNAL_MAX_BATCH) ||
     (!join && atomic_read(&(SB_JOURNAL(p_s_sb)->j_wcount)) > 0 && SB_JOURNAL(p_s_sb)->j_trans_start_time > 0 &&
      (now - SB_JOURNAL(p_s_sb)->j_trans_start_time) > JOURNAL_MAX_TRANS_AGE) ||     (!join && atomic_read(&(SB_JOURNAL(p_s_sb)->j_jlock)) ) ||
     (!join && SB_JOURNAL(p_s_sb)->j_cnode_free < (JOURNAL_TRANS_MAX * 3)))
I'm not a specialist in this code, but it should be possible to trigger
this condition, shouldn't it?

Or is it yet another already fixed issue?

Best regards
		Andrey
