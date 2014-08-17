From: Ivan Shapovalov <intelfx100@gmail.com>
Subject: [RFC] [PATCHv2 3/7] reiser4: txnmgr: free allocated but unneeded atom in atom_begin_and_assign_to_txnh().
Date: Sun, 17 Aug 2014 20:26:31 +0400
Message-ID: <1408292795-1841-4-git-send-email-intelfx100@gmail.com>
References: <1408292795-1841-1-git-send-email-intelfx100@gmail.com>
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=K29S+DyO1faBOvI6K1eGIBKPjE767LeRJE7SpOFWc5g=;
        b=Qwj8MBkrVd9BaMqqt4HyVUWyXAroeYiN2H9AnVi9eB8KN4POnzdnPGT8VtAu8+IRvl
         FlQEHpcQyxGsgAD5fdcllgJA/kx2y41b6UHud+KX2JIhJUa7R9Y6+jvWGhQQmTAjZBAW
         7yBKxWxNzpgCRowVp176XHCbwAM/A6cDNV7jrPVYyxLFFfywHykgWmNGEHQnnCpfa1b/
         RuGiHlwb4jWur+zHbS/8l6F6+sY2vJBhAOH9mI1IAw+6CoAdrCJOfiRAvPhFEeUyOBy0
         vJkAZPZ1MxfJbH59gsj+5k2s4/HTkHiMwU9GivXRIkAG3q5V12RF+jSmEevd/+zPh1v+
         vUdQ==
In-Reply-To: <1408292795-1841-1-git-send-email-intelfx100@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-devel@vger.kernel.org
Cc: edward.shishkin@gmail.com, Ivan Shapovalov <intelfx100@gmail.com>

It is unclear why it hasn't been done before, as there was a
corresponding notice, and such change apparently does not carry any side
effects.

Do this to avoid duplicating code in the next commit.

Signed-off-by: Ivan Shapovalov <intelfx100@gmail.com>
---
 fs/reiser4/txnmgr.c | 20 +++++---------------
 1 file changed, 5 insertions(+), 15 deletions(-)

diff --git a/fs/reiser4/txnmgr.c b/fs/reiser4/txnmgr.c
index d73ecb9..68070a9 100644
--- a/fs/reiser4/txnmgr.c
+++ b/fs/reiser4/txnmgr.c
@@ -709,6 +709,9 @@ static int atom_begin_and_assign_to_txnh(txn_atom ** atom_alloc, txn_handle * tx
 			return RETERR(-ENOMEM);
 	}
 
+	atom = *atom_alloc;
+	*atom_alloc = NULL;
+
 	/* and, also, txnmgr spin lock should be taken before jnode and txnh
 	   locks. */
 	mgr = &get_super_private(reiser4_get_current_sb())->tmgr;
@@ -717,18 +720,14 @@ static int atom_begin_and_assign_to_txnh(txn_atom ** atom_alloc, txn_handle * tx
 
 	/* Check whether new atom still needed */
 	if (txnh->atom != NULL) {
-		/* NOTE-NIKITA probably it is rather better to free
-		 * atom_alloc here than thread it up to reiser4_try_capture() */
-
 		spin_unlock_txnh(txnh);
 		spin_unlock_txnmgr(mgr);
 
+		kmem_cache_free(_atom_slab, atom);
+
 		return -E_REPEAT;
 	}
 
-	atom = *atom_alloc;
-	*atom_alloc = NULL;
-
 	atom_init(atom);
 
 	assert("jmacd-17", atom_isclean(atom));
@@ -2031,15 +2030,6 @@ int reiser4_try_capture(jnode *node, znode_lock_mode lock_mode,
 		goto repeat;
 	}
 
-	/* free extra atom object that was possibly allocated by
-	   try_capture_block().
-
-	   Do this before acquiring jnode spin lock to
-	   minimize time spent under lock. --nikita */
-	if (atom_alloc != NULL) {
-		kmem_cache_free(_atom_slab, atom_alloc);
-	}
-
 	if (ret != 0) {
 		if (ret == -E_BLOCK) {
 			assert("nikita-3360",
-- 
2.0.4

