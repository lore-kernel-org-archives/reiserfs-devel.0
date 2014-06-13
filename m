From: Ivan Shapovalov <intelfx100@gmail.com>
Subject: [RFC] [PATCHv4 4/4] reiser4: discard support: enable discard functionality through a mount option.
Date: Fri, 13 Jun 2014 18:58:14 +0400
Message-ID: <1402671494-24513-5-git-send-email-intelfx100@gmail.com>
References: <1402671494-24513-1-git-send-email-intelfx100@gmail.com>
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=+2ANdSELl96mPYTc/3L4Ti8NmH0P5V2Id6CH0CjX+as=;
        b=oqU8ADHkYMPGD88n3572kGC7mmWaJ/ZfPslB49VtnX6pZX/hQNMsHuU7ZwlN87kCjz
         T5N4aNYJAqSvCm6RFPoZZ7C8NySyd8kdWfh6iHRfp1RPUNPEbowhFiaI46Af6ORwK8Pi
         ic8RJhnValtwgUE4A8xd8DfkUliZjWCupcLLHwXIRwJZwGED8tPlTigDdDWs8mNMkKtS
         B+FyYQ7Dczeu0T2jPxAmK/MtpuSsj9KSxB+vqZpPLERymID2Ytx9wy0BcTKt/qW3dZcG
         B3RT621EnNR7MjA29yTgHETnMKenyR+zCn/XphTWWeBtR+YZ1kZGlN2zrWj71nqQSALU
         pB3w==
In-Reply-To: <1402671494-24513-1-git-send-email-intelfx100@gmail.com>
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
index 0f1f54d..9a73622 100644
--- a/fs/reiser4/discard.c
+++ b/fs/reiser4/discard.c
@@ -378,6 +378,11 @@ int discard_atom(txn_atom *atom)
 	struct list_head discard_set, *pos, *next;
 	struct discard_set_entry *entry, *next_entry;
 
+	if (!reiser4_is_set(reiser4_get_current_sb(), REISER4_DISCARD)) {
+		spin_unlock_atom(atom);
+		return 0;
+	}
+
 	assert("intelfx-28", atom != NULL);
 
 	if (list_empty(&atom->discard_set)) {
@@ -430,6 +435,10 @@ extern int discard_set_add_extent(txn_atom *atom,
                                   const reiser4_block_nr *start,
                                   const reiser4_block_nr *len)
 {
+	if (!reiser4_is_set(reiser4_get_current_sb(), REISER4_DISCARD)) {
+		return 0;
+	}
+
 	assert("intelfx-29", atom != NULL);
 	assert("intelfx-30", new_entry != NULL);
 	assert("intelfx-31", start != NULL);
diff --git a/fs/reiser4/init_super.c b/fs/reiser4/init_super.c
index 620a0f5..1ff8dad 100644
--- a/fs/reiser4/init_super.c
+++ b/fs/reiser4/init_super.c
@@ -494,6 +494,8 @@ int reiser4_init_super_data(struct super_block *super, char *opt_string)
 	PUSH_BIT_OPT("atomic_write", REISER4_ATOMIC_WRITE);
 	/* disable use of write barriers in the reiser4 log writer. */
 	PUSH_BIT_OPT("no_write_barrier", REISER4_NO_WRITE_BARRIER);
+	/* enable issuing of discard requests */
+	PUSH_BIT_OPT("discard", REISER4_DISCARD);
 
 	PUSH_OPT(p, opts,
 	{
diff --git a/fs/reiser4/super.h b/fs/reiser4/super.h
index 0c73845..895c3f3 100644
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
2.0.0

