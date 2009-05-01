From: Frederic Weisbecker <fweisbec@gmail.com>
Subject: [PATCH 2/6] kill-the-BKL/reiserfs: release the write lock before rescheduling on do_journal_end()
Date: Fri,  1 May 2009 04:44:18 +0200
Message-ID: <1241145862-21700-3-git-send-email-fweisbec@gmail.com>
References: <1241145862-21700-1-git-send-email-fweisbec@gmail.com>
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:from:to:cc:subject:date
         :message-id:x-mailer:in-reply-to:references;
        bh=aucFcOtcsbQ4QBIqgARDpFX6qhjyXgCrm0soB1xOtRk=;
        b=JOBo/PYQ2doRszwsNOIjqmH7mNTZ6Uetp/uvaijQjitoHiSpn1l5oR6HgeBWU8wz4w
         d/nJt2Xg4Ur9i1JqsZvCSUsG9ANznnHxmfBXn2ZTLcTux7br5gzcFsXL6TjjpBwU6xr0
         Bf2pnVamAkof79VCgcy3gcj/x+xWJF+h6AG+0=
In-Reply-To: <1241145862-21700-1-git-send-email-fweisbec@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ingo Molnar <mingo@elte.hu>
Cc: LKML <linux-kernel@vger.kernel.org>, Frederic Weisbecker <fweisbec@gmail.com>, Jeff Mahoney <jeffm@suse.com>, ReiserFS Development List <reiserfs-devel@vger.kernel.org>, Chris Mason <chris.mason@oracle.com>, Alexander Beregalov <a.beregalov@gmail.com>, Alessio Igor Bogani <abogani@texware.it>, Jonathan Corbet <corbet@lwn.net>, Alexander Viro <viro@zeniv.linux.org.uk>

When do_journal_end() copies data to the journal blocks buffers in memory,
it reschedules if needed between each block copied and dirtyfied.

We can also release the write lock at this rescheduling stage,
like did the bkl implicitly.

[ Impact: release the reiserfs write lock when it is not needed ]

Cc: Jeff Mahoney <jeffm@suse.com>
Cc: Chris Mason <chris.mason@oracle.com>
Cc: Alexander Beregalov <a.beregalov@gmail.com>
Signed-off-by: Frederic Weisbecker <fweisbec@gmail.com>
---
 fs/reiserfs/journal.c |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/fs/reiserfs/journal.c b/fs/reiserfs/journal.c
index 7976d7d..373d080 100644
--- a/fs/reiserfs/journal.c
+++ b/fs/reiserfs/journal.c
@@ -4232,7 +4232,9 @@ static int do_journal_end(struct reiserfs_transaction_handle *th,
 		next = cn->next;
 		free_cnode(sb, cn);
 		cn = next;
+		reiserfs_write_unlock(sb);
 		cond_resched();
+		reiserfs_write_lock(sb);
 	}
 
 	/* we are done  with both the c_bh and d_bh, but
-- 
1.6.2.3

