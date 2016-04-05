From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: [BUG] Big fiability issue?
Date: Tue, 5 Apr 2016 17:43:45 +0200
Message-ID: <5703DD31.50604@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------010503060304090109050906"
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=to:cc:from:subject:message-id:date:user-agent:mime-version;
        bh=YL+Ij/pwJXHuQjKna5uyVAY+uu29PvXSVD1PsHwUDSw=;
        b=is6IHV2Zev83jzjbw1Gg7g+PoUnQk41ZgmBWc/w+bigxqzqIur7DQnIFpxPV1xJnzE
         d7wAOIpiG1StGr0BVRdE0tab3FFajviXrDo9L727yjdt2hQra4xv72vsMUv+Bcnm7dzl
         vuShq5OovwpDvATSmr8aH1hY8VmtbbaMCvFtmqeTZ8EAm1LqZ2fH+7zRYkpgDkOQc28z
         Gbba8r7gqxA0+twRKb5ov/Fn0GbMoEEcPaOK4TmCQF3OC9tdLJIKO//XTjU3CQqozJeX
         R/LZAl1YovS6lZQ6RYmE4siyXLksrqoZHvTJAfwU7DBkFctRpC7Adk7BIUpoPy5ouyro
         Da3w==
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
To: =?UTF-8?Q?Mathieu_B=c3=a9langer?= <b747xx@gmail.com>
Cc: Reiserfs development mailing list <reiserfs-devel@vger.kernel.org>

This is a multi-part message in MIME format.
--------------010503060304090109050906
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Hello Mathieu,

I found that by default reiser4 still relies on a block layer feature,
which is not longer supported. This is so-called "barriers". And yes,
on the power outage bad things are bound to happen. However, it
is up to bad luck.

The attached patch removes the rest of block barriers support in
reiser4. So, now we honestly wait for IO completion of wandered
blocks (overwrite set) before submitting a journal header (journal
footer).

Not sure if it will address your problem though. Also, data corruption
after rw-mounting of checked (rebuild-fs) partition is still a concern.

Thanks,
Edward.

--------------010503060304090109050906
Content-Type: text/x-patch;
 name="reiser4-drop-barriers-support.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="reiser4-drop-barriers-support.patch"

Drop residual block barriers support.

Signed-off-by: Edward Shishkin <edward.shishkin@gmail.com>
---
 fs/reiser4/init_super.c |    2 --
 fs/reiser4/super.h      |    2 --
 fs/reiser4/wander.c     |   47 +++++++++++------------------------------------
 fs/reiser4/writeout.h   |    2 +-
 4 files changed, 12 insertions(+), 41 deletions(-)

--- a/fs/reiser4/init_super.c
+++ b/fs/reiser4/init_super.c
@@ -492,8 +492,6 @@ int reiser4_init_super_data(struct super
 	PUSH_BIT_OPT("dont_load_bitmap", REISER4_DONT_LOAD_BITMAP);
 	/* disable transaction commits during write() */
 	PUSH_BIT_OPT("atomic_write", REISER4_ATOMIC_WRITE);
-	/* disable use of write barriers in the reiser4 log writer. */
-	PUSH_BIT_OPT("no_write_barrier", REISER4_NO_WRITE_BARRIER);
 	/* enable issuing of discard requests */
 	PUSH_BIT_OPT("discard", REISER4_DISCARD);
 	/* disable hole punching at flush time */
--- a/fs/reiser4/super.h
+++ b/fs/reiser4/super.h
@@ -50,8 +50,6 @@ typedef enum {
 	REISER4_DONT_LOAD_BITMAP = 5,
 	/* enforce atomicity during write(2) */
 	REISER4_ATOMIC_WRITE = 6,
-	/* don't use write barriers in the log writer code. */
-	REISER4_NO_WRITE_BARRIER = 7,
 	/* enable issuing of discard requests */
 	REISER4_DISCARD = 8,
 	/* disable hole punching at flush time */
--- a/fs/reiser4/wander.c
+++ b/fs/reiser4/wander.c
@@ -224,11 +224,6 @@ static void done_commit_handle(struct co
 	assert("zam-690", list_empty(&ch->tx_list));
 }
 
-static inline int reiser4_use_write_barrier(struct super_block * s)
-{
-	return !reiser4_is_set(s, REISER4_NO_WRITE_BARRIER);
-}
-
 /* fill journal header block data  */
 static void format_journal_header(struct commit_handle *ch)
 {
@@ -420,7 +415,7 @@ store_wmap_actor(txn_atom * atom UNUSED_
    set is written to wandered locations and all wander records are written
    also. Updated journal header blocks contains a pointer (block number) to
    first wander record of the just written transaction */
-static int update_journal_header(struct commit_handle *ch, int use_barrier)
+static int update_journal_header(struct commit_handle *ch)
 {
 	struct reiser4_super_info_data *sbinfo = get_super_private(ch->super);
 	jnode *jh = sbinfo->journal_header;
@@ -430,7 +425,7 @@ static int update_journal_header(struct
 	format_journal_header(ch);
 
 	ret = write_jnodes_to_disk_extent(jh, 1, jnode_get_block(jh), NULL,
-					  use_barrier ? WRITEOUT_BARRIER : 0);
+					  WRITEOUT_FLUSH_FUA);
 	if (ret)
 		return ret;
 
@@ -450,7 +445,7 @@ static int update_journal_header(struct
 /* This function is called after write-back is finished. We update journal
    footer block and free blocks which were occupied by wandered blocks and
    transaction wander records */
-static int update_journal_footer(struct commit_handle *ch, int use_barrier)
+static int update_journal_footer(struct commit_handle *ch)
 {
 	reiser4_super_info_data *sbinfo = get_super_private(ch->super);
 
@@ -461,7 +456,7 @@ static int update_journal_footer(struct
 	format_journal_footer(ch);
 
 	ret = write_jnodes_to_disk_extent(jf, 1, jnode_get_block(jf), NULL,
-					  use_barrier ? WRITEOUT_BARRIER : 0);
+					  WRITEOUT_FLUSH_FUA);
 	if (ret)
 		return ret;
 
@@ -713,7 +708,7 @@ static int write_jnodes_to_disk_extent(
 	flush_queue_t *fq, int flags)
 {
 	struct super_block *super = reiser4_get_current_sb();
-	int write_op = ( flags & WRITEOUT_BARRIER ) ? WRITE_FLUSH_FUA : WRITE;
+	int write_op = ( flags & WRITEOUT_FLUSH_FUA ) ? WRITE_FLUSH_FUA : WRITE;
 	jnode *cur = first;
 	reiser4_block_nr block;
 
@@ -1101,7 +1096,6 @@ static int alloc_tx(struct commit_handle
 static int commit_tx(struct commit_handle *ch)
 {
 	flush_queue_t *fq;
-	int barrier;
 	int ret;
 
 	/* Grab more space for wandered records. */
@@ -1126,23 +1120,16 @@ static int commit_tx(struct commit_handl
 	reiser4_fq_put(fq);
 	if (ret)
 		return ret;
- 	barrier = reiser4_use_write_barrier(ch->super);
-	if (!barrier) {
-		ret = current_atom_finish_all_fq();
-		if (ret)
-			return ret;
-	}
-	ret = update_journal_header(ch, barrier);
-	if (!barrier || ret)
+	ret = current_atom_finish_all_fq();
+	if (ret)
 		return ret;
-	return current_atom_finish_all_fq();
+	return update_journal_header(ch);
 }
 
 static int write_tx_back(struct commit_handle * ch)
 {
 	flush_queue_t *fq;
 	int ret;
-	int barrier;
 
 	fq = get_fq_for_current_atom();
 	if (IS_ERR(fq))
@@ -1153,22 +1140,10 @@ static int write_tx_back(struct commit_h
 	reiser4_fq_put(fq);
 	if (ret)
 		return ret;
-
-	barrier = reiser4_use_write_barrier(ch->super);
-	if (!barrier) {
-		ret = current_atom_finish_all_fq();
-		if (ret)
-			return ret;
-	}
-	ret = update_journal_footer(ch, barrier);
+	ret = current_atom_finish_all_fq();
 	if (ret)
 		return ret;
-	if (barrier) {
-		ret = current_atom_finish_all_fq();
-		if (ret)
-			return ret;
-	}
-	return 0;
+	return update_journal_footer(ch);
 }
 
 /* We assume that at this moment all captured blocks are marked as RELOC or
@@ -1486,7 +1461,7 @@ static int replay_transaction(const stru
 		}
 	}
 
-	ret = update_journal_footer(&ch, 0);
+	ret = update_journal_footer(&ch);
 
       free_ow_set:
 
--- a/fs/reiser4/writeout.h
+++ b/fs/reiser4/writeout.h
@@ -4,7 +4,7 @@
 
 #define WRITEOUT_SINGLE_STREAM (0x1)
 #define WRITEOUT_FOR_PAGE_RECLAIM  (0x2)
-#define WRITEOUT_BARRIER (0x4)
+#define WRITEOUT_FLUSH_FUA (0x4)
 
 extern int reiser4_get_writeout_flags(void);
 

--------------010503060304090109050906--
