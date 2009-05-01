From: Frederic Weisbecker <fweisbec@gmail.com>
Subject: [PATCH 6/6] kill-the-BKL/reiserfs: release the write lock on flush_commit_list()
Date: Fri,  1 May 2009 04:44:22 +0200
Message-ID: <1241145862-21700-7-git-send-email-fweisbec@gmail.com>
References: <1241145862-21700-1-git-send-email-fweisbec@gmail.com>
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:from:to:cc:subject:date
         :message-id:x-mailer:in-reply-to:references;
        bh=5uNCX8zMx8npcw7LuTRtrFylw4qukUDJBWEdvERim3s=;
        b=I9YbLJBXVTf4GZqgZfZvQLogu5M828OPIa/ARsg5uOvDyMbuaVNVybXXtTTAtfuU0M
         pOTYFBmMPU7CmWRO+p03IYrsHojtRNawtL7bgI395jWwM+t44ZeEpq++EdKpp+6ZwkHc
         QjlGNWDu/CE16J33X8byGIJUSquwA9vbxq8Uk=
In-Reply-To: <1241145862-21700-1-git-send-email-fweisbec@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ingo Molnar <mingo@elte.hu>
Cc: LKML <linux-kernel@vger.kernel.org>, Frederic Weisbecker <fweisbec@gmail.com>, Jeff Mahoney <jeffm@suse.com>, ReiserFS Development List <reiserfs-devel@vger.kernel.org>, Chris Mason <chris.mason@oracle.com>, Alexander Beregalov <a.beregalov@gmail.com>, Alessio Igor Bogani <abogani@texware.it>, Jonathan Corbet <corbet@lwn.net>, Alexander Viro <viro@zeniv.linux.org.uk>

flush_commit_list() uses ll_rw_block() to commit the pending log blocks.
ll_rw_block() might sleep, and the bkl was released at this point. Then
we can also relax the write lock at this point.

[ Impact: release the reiserfs write lock when it is not needed ]

Cc: Jeff Mahoney <jeffm@suse.com>
Cc: Chris Mason <chris.mason@oracle.com>
Cc: Alexander Beregalov <a.beregalov@gmail.com>
Signed-off-by: Frederic Weisbecker <fweisbec@gmail.com>
---
 fs/reiserfs/journal.c |    7 +++++--
 1 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/fs/reiserfs/journal.c b/fs/reiserfs/journal.c
index 373d080..b1ebd5a 100644
--- a/fs/reiserfs/journal.c
+++ b/fs/reiserfs/journal.c
@@ -1120,8 +1120,11 @@ static int flush_commit_list(struct super_block *s,
 		    SB_ONDISK_JOURNAL_SIZE(s);
 		tbh = journal_find_get_block(s, bn);
 		if (tbh) {
-			if (buffer_dirty(tbh))
-			    ll_rw_block(WRITE, 1, &tbh) ;
+			if (buffer_dirty(tbh)) {
+		            reiserfs_write_unlock(s);
+			    ll_rw_block(WRITE, 1, &tbh);
+			    reiserfs_write_lock(s);
+			}
 			put_bh(tbh) ;
 		}
 	}
-- 
1.6.2.3

