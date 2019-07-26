From: Jia-Ju Bai <baijiaju1990@gmail.com>
Subject: [PATCH] fs: reiserfs: Fix possible null-pointer dereferences in remove_from_transaction()
Date: Fri, 26 Jul 2019 16:38:38 +0800
Message-ID: <20190726083838.8301-1-baijiaju1990@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=OErtjgtck0WYHrq2s+gRLUV620lMFnBrd6HnTxIAPgU=;
        b=UAhTdssUA4+XWhrHM2GbqjnQIy3n3cxguHpOBXBKFR5OuQj5lqh7lPgCDf4wjYe53m
         /jD86Y6YqBz/X3y43vrb0CGz02kJeFecG2r8rINfDHOhw8oGnOJNFPGiAkuvDXLDgc+U
         im9PeG6/7ekRqdmCeihHPpNGG0b6o1rLb/q9CwiRFuC1yrlKC84EN904QY5a97Ezn6fx
         zA+svGsMmSk1js2bnWypOWvortNwPTv1XfwDYRT5aW91HhvTSwoEFK4WZAuDPMRsfdcR
         rsClamSBeGWsTBlEtHgMJkoNXobLsVaLb1ixUFOQ73Q+pmDx07hWUaB4/y/fD9Dypptj
         fwew==
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: jack@suse.cz, akpm@linux-foundation.org, arnd@arndb.de, linux.bhar@gmail.com, hariprasad.kelam@gmail.com
Cc: reiserfs-devel@vger.kernel.org, linux-kernel@vger.kernel.org, Jia-Ju Bai <baijiaju1990@gmail.com>

In remove_from_transaction(), there is an if statement on line 3447 to
check whether bh is NULL:
    if (bh)

When bh is NULL, it is used on line 3450:
    clear_buffer_journaled(bh);
and lines 3453-3456:
    clear_buffer_journal_dirty(bh);
    clear_buffer_dirty(bh);
    clear_buffer_journal_test(bh);
    put_bh(bh);

Thus, possible null-pointer dereferences may occur.

To fix these bugs, bh is checked before being used.

These bugs are found by a static analysis tool STCheck written by us.

Signed-off-by: Jia-Ju Bai <baijiaju1990@gmail.com>
---
 fs/reiserfs/journal.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/fs/reiserfs/journal.c b/fs/reiserfs/journal.c
index 4517a1394c6f..d115578597b6 100644
--- a/fs/reiserfs/journal.c
+++ b/fs/reiserfs/journal.c
@@ -3444,12 +3444,13 @@ static int remove_from_transaction(struct super_block *sb,
 	if (cn == journal->j_last) {
 		journal->j_last = cn->prev;
 	}
-	if (bh)
+	if (bh) {
 		remove_journal_hash(sb, journal->j_hash_table, NULL,
 				    bh->b_blocknr, 0);
-	clear_buffer_journaled(bh);	/* don't log this one */
+		clear_buffer_journaled(bh);	/* don't log this one */
+	}
 
-	if (!already_cleaned) {
+	if (!already_cleaned && bh) {
 		clear_buffer_journal_dirty(bh);
 		clear_buffer_dirty(bh);
 		clear_buffer_journal_test(bh);
-- 
2.17.0

