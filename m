From: Ivan Shapovalov <intelfx100@gmail.com>
Subject: [RFC] [PATCHv2 3/5] reiser4: discard support: enable discard functionality through a mount option.
Date: Tue,  6 May 2014 09:30:21 +0400
Message-ID: <1399354223-5334-4-git-send-email-intelfx100@gmail.com>
References: <1399354223-5334-1-git-send-email-intelfx100@gmail.com>
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=CVc59njxQUyBzASMaRsZGWRY43XpDCE/yVLscl5iuVw=;
        b=eBoTUwbD5romxjHkuAWT42OPkSrA5v8ZaDiWtiGo79OtGXZ4oUuzsU1wNSkppwIGsR
         /hzXU99q+1K0d8GQzgOEBvsCzRz8DcHOO3GF08mxytqaPb/dSv7Cw0YCE8nBvtN7GxNK
         zEDz5r602whxUawX0GTAj5ID7pbcuKKrUWCmpsn2BtSqZQ/jRDEZCubfJv6oAz9KeXkd
         Tl/4n3z2zsxw2Vjj35CyMhw5fEvnc291RU9xUoZcezLW4rN9JqZIFVZ3+EWCYONtqcsS
         2xR09L3uFvoS5Pml3f52r+JADFGQltSl7ZeFNfXmy3so+ZTyikrUvOjmcnQQMFC6qZ6f
         DdsQ==
In-Reply-To: <1399354223-5334-1-git-send-email-intelfx100@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-devel@vger.kernel.org
Cc: Ivan Shapovalov <intelfx100@gmail.com>

Discard subsystem is now enabled conditionally, using "discard" mount option.
For now there is no auto-detection in either direction.

Signed-off-by: Ivan Shapovalov <intelfx100@gmail.com>
---
 fs/reiser4/discard.c    | 9 +++++++++
 fs/reiser4/init_super.c | 2 ++
 fs/reiser4/super.h      | 4 +++-
 3 files changed, 14 insertions(+), 1 deletion(-)

diff --git a/fs/reiser4/discard.c b/fs/reiser4/discard.c
index 6f8bbfa..cf4c8f9 100644
--- a/fs/reiser4/discard.c
+++ b/fs/reiser4/discard.c
@@ -348,6 +348,11 @@ int discard_atom(txn_atom *atom)
 	struct list_head discard_set, *pos, *next;
 	struct discard_set_entry *entry, *next_entry;
 
+	if (!reiser4_is_set(reiser4_get_current_sb(), REISER4_DISCARD)) {
+		spin_unlock_atom(atom);
+		return 0;
+	}
+
 	if (list_empty(&atom->discard_set)) {
 		spin_unlock_atom(atom);
 		return 0;
@@ -395,6 +400,10 @@ extern int discard_set_add_extent(txn_atom *atom,
                                   const reiser4_block_nr *start,
                                   const reiser4_block_nr *len)
 {
+	if (!reiser4_is_set(reiser4_get_current_sb(), REISER4_DISCARD)) {
+		return 0;
+	}
+
 	if (*new_entry == NULL) {
 		/*
 		 * Optimization: try to merge new extent into the last one.
diff --git a/fs/reiser4/init_super.c b/fs/reiser4/init_super.c
index bd9c295..c3f9fde 100644
--- a/fs/reiser4/init_super.c
+++ b/fs/reiser4/init_super.c
@@ -459,6 +459,8 @@ int reiser4_init_super_data(struct super_block *super, char *opt_string)
 	PUSH_BIT_OPT("atomic_write", REISER4_ATOMIC_WRITE);
 	/* disable use of write barriers in the reiser4 log writer. */
 	PUSH_BIT_OPT("no_write_barrier", REISER4_NO_WRITE_BARRIER);
+	/* enable issuing of discard requests */
+	PUSH_BIT_OPT("discard", REISER4_DISCARD);
 
 	PUSH_OPT(p, opts,
 	{
diff --git a/fs/reiser4/super.h b/fs/reiser4/super.h
index 46e69fd..95c9d1c8 100644
--- a/fs/reiser4/super.h
+++ b/fs/reiser4/super.h
@@ -51,7 +51,9 @@ typedef enum {
 	/* enforce atomicity during write(2) */
 	REISER4_ATOMIC_WRITE = 6,
 	/* don't use write barriers in the log writer code. */
-	REISER4_NO_WRITE_BARRIER = 7
+	REISER4_NO_WRITE_BARRIER = 7,
+	/* enable issuing of discard requests */
+	REISER4_DISCARD = 8
 } reiser4_fs_flag;
 
 /*
-- 
1.9.2

