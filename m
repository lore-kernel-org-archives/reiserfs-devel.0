From: Ivan Shapovalov <intelfx100@gmail.com>
Subject: [PATCHv5 06/10] reiser4: txnmgr: move "empty atom" shortcut slightly below.
Date: Fri, 13 Feb 2015 03:48:15 +0300
Message-ID: <1423788499-30430-7-git-send-email-intelfx100@gmail.com>
References: <1423788499-30430-1-git-send-email-intelfx100@gmail.com>
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=bKBTYBklYs/bh3vq6xf4JMc2SgD5aPPL01zHQeducCk=;
        b=tPdWocUTGUn7exKS1PlYfe/TxvtAV1VebXKgwMS2bBetbaGT7GgUag2CYxyQrpl4Wa
         Cu7FDcp+VE3dITkTSYaUu1vGmucsjnvSkEOhG+BLDLdQZOXqcIfCWs7nDMDlD1RWMFiL
         EyNzCvWy1UG2gnCCleB6sgoJDo7VRmPEcXhTV/GtYuhEM02XmfG16xSes5utNVU5p99w
         7vx7kcViuxAVGiDnd+SH2G2G0HrxH0k0jv+ZlDaQ7/IQLxH2wh3inY6uq3huwyV1Jkgr
         U5CF8EcHVdGCfggglrxM40CpZ1SensGDRflk46ldHF5AIxfqh4XKSeYzE7dt1/lXx+U6
         pO5g==
In-Reply-To: <1423788499-30430-1-git-send-email-intelfx100@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-devel@vger.kernel.org
Cc: Ivan Shapovalov <intelfx100@gmail.com>

reiser4_trim_fs() generate empty (atom->capture_count == 0) atoms which
still have non-empty delete sets. That is, such atoms take a "goto done"
shortcut in commit_current_atom().

First, this shortcut must not preclude calling current_atom_complete_writes()
to process and detach atom's flush queues (otherwise atom_isclean() will
return false).

Second, reiser4_post_write_back_hook() needs to be called explicitly
to process atom's delete sets.

Signed-off-by: Ivan Shapovalov <intelfx100@gmail.com>
---
 fs/reiser4/txnmgr.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/fs/reiser4/txnmgr.c b/fs/reiser4/txnmgr.c
index 2862940..5084722 100644
--- a/fs/reiser4/txnmgr.c
+++ b/fs/reiser4/txnmgr.c
@@ -1064,9 +1064,6 @@ static int commit_current_atom(long *nr_submitted, txn_atom ** atom)
 		return RETERR(-E_REPEAT);
 	}
 
-	if ((*atom)->capture_count == 0)
-		goto done;
-
 	/* Up to this point we have been flushing and after flush is called we
 	   return -E_REPEAT.  Now we can commit.  We cannot return -E_REPEAT
 	   at this point, commit should be successful. */
@@ -1078,6 +1075,14 @@ static int commit_current_atom(long *nr_submitted, txn_atom ** atom)
 	if (ret)
 		return ret;
 
+	if ((*atom)->capture_count == 0) {
+		/* Process the atom's delete set.
+		 * Even if the atom has no captured nodes, the delete set may
+		 * still be non-empty (see e. g. reiser4_trim_fs()). */
+		reiser4_post_write_back_hook();
+		goto done;
+	}
+
 	assert("zam-906", list_empty(ATOM_WB_LIST(*atom)));
 
 	/* isolate critical code path which should be executed by only one
@@ -1100,8 +1105,8 @@ static int commit_current_atom(long *nr_submitted, txn_atom ** atom)
 	reiser4_invalidate_list(ATOM_WB_LIST(*atom));
 	assert("zam-927", list_empty(&(*atom)->inodes));
 
+done:
 	spin_lock_atom(*atom);
- done:
 	reiser4_atom_set_stage(*atom, ASTAGE_DONE);
 	ON_DEBUG((*atom)->committer = NULL);
 
-- 
2.3.0

