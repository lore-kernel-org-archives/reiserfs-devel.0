From: Chris Mason <mason@suse.com>
Subject: [patch 5/6] reiserfs v3 patches
Date: Sun, 15 Jan 2006 19:50:07 -0500
Message-ID: <20060116005314.011562000@watt.suse.com>
References: <20060116005002.398989000@watt.suse.com>
Return-path: <linux-fsdevel-owner@vger.kernel.org>
Content-Disposition: inline; filename=reiserfs-should-end-alloc
From: Chris Mason <mason@suse.com>
Subject: [patch 5/6] reiserfs fix journal accounting in journal_transaction_should_end
Sender: linux-fsdevel-owner@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: akpm@osdl.org, linux-fsdevel@vger.kernel.org, reiserfs-list@namesys.com

reiserfs: journal_transaction_should_end should increase the count of blocks
allocated so the transaction subsystem can keep new writers from creating
a transaction that is too large.

diff -r 890bf922a629 fs/reiserfs/journal.c
--- a/fs/reiserfs/journal.c	Fri Jan 13 14:00:50 2006 -0500
+++ b/fs/reiserfs/journal.c	Fri Jan 13 14:01:36 2006 -0500
@@ -2854,6 +2854,9 @@ int journal_transaction_should_end(struc
 	    journal->j_cnode_free < (journal->j_trans_max * 3)) {
 		return 1;
 	}
+	/* protected by the BKL here */
+	journal->j_len_alloc += new_alloc;
+	th->t_blocks_allocated += new_alloc ;
 	return 0;
 }
 

--
