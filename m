From: Vijayan Prabhakaran <pvijayan@gmail.com>
Subject: Discrepancy in committing old transactions
Date: Sun, 19 Sep 2004 11:13:10 -0500
Message-ID: <d68fdf7d04091909132ba7ced7@mail.gmail.com>
Reply-To: Vijayan Prabhakaran <pvijayan@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-21845-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: mason@suse.com, reiserfs-list@namesys.com
Cc: vijayan@cs.wisc.edu

Hi,

I sent the following mail sometime back and it got bounced due to some
mailserver failure. So I'm resending it.

--------------------------------------------------------------------------------
There is one more problem in committing the old transactions.

In function reiserfs_flush_old_commits(), there is a condition that checks
if the current transaction is older than 30 seconds. Only if that
condition satisfies, the data is flushed to the disk. The condition looks
like:

if (blah blah blah &&
(now - SB_JOURNAL(p_s_sb)->j_trans_start_time) >
       SB_JOURNAL_MAX_TRANS_AGE(p_s_sb))
{

 /*flush the transaction by calling do_journal_end*/

}

Note: SB_JOURNAL_MAX_TRANS_AGE(p_s_sb) returns 30 seconds.

Now my question is this:

When does reiserfs flush the old uncommitted data ? Is it every 5 seconds
or every 30 seconds ?

If it is going to do it in every 5 seconds when the thread wakes up, why
do we have the condition for 30 seconds ? If the flush happens only every
30 seconds, why the thread calls reiserfs_flush_old_commits() every 5
seconds ?

Is there any reason for this discrepancy ?

Vijayan
