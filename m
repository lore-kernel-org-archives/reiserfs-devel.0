From: Jia-Ju Bai <baijiaju1990@gmail.com>
Subject: [PATCH] fs: reiserfs: Remove unnecessary check of bh in remove_from_transaction()
Date: Sat, 27 Jul 2019 16:40:19 +0800
Message-ID: <20190727084019.11307-1-baijiaju1990@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=i2a3JghIDojvoauDxYM8+buIOlZvvNl0l8VTKuMMZH8=;
        b=q2uw0fTIS/jP7eRCk4gk3NZjvZG0YSTKE75V0UeNxXZqIDfGKMqV1uFflZpgrOhCHI
         ATzEm7sn4Z2iGNw6KEbIruUmyXGhnb6KMjD+QZZlTsRInt4m6mPzrazdIHs8vuIxdfOT
         MPxQ/tJnkU664AK3OkYgt0D4poVuKgezP/dhbeAo8llzj4dqKIeQze1LG8Kl5IN5hrqs
         wpWcEooBJj9POJ9FqZegcHcVGB8Ry7PqVRa6lOFjjn0RY0fAC0MietLKoMNG/Zc6Int/
         +XW6RY4buw8rcfkrqluIx3ManuCEQp4rfMKHythf7ArzK3ume35VMHHs+HSo/OvXG5YK
         jzYA==
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: jack@suse.cz, akpm@linux-foundation.org, arnd@arndb.de, hariprasad.kelam@gmail.com, linux.bhar@gmail.com
Cc: reiserfs-devel@vger.kernel.org, linux-kernel@vger.kernel.org, Jia-Ju Bai <baijiaju1990@gmail.com>

On lines 3430-3434, bh has been assured to be non-null:
    cn = get_journal_hash_dev(sb, journal->j_hash_table, blocknr);
    if (!cn || !cn->bh) {
        return ret;
    }
    bh = cn->bh;

Thus, the check of bh on line 3447 is unnecessary and can be removed.
Thank Andrew Morton for good advice.

Signed-off-by: Jia-Ju Bai <baijiaju1990@gmail.com>
---
 fs/reiserfs/journal.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/fs/reiserfs/journal.c b/fs/reiserfs/journal.c
index 4517a1394c6f..11155b8513db 100644
--- a/fs/reiserfs/journal.c
+++ b/fs/reiserfs/journal.c
@@ -3444,9 +3444,8 @@ static int remove_from_transaction(struct super_block *sb,
 	if (cn == journal->j_last) {
 		journal->j_last = cn->prev;
 	}
-	if (bh)
-		remove_journal_hash(sb, journal->j_hash_table, NULL,
-				    bh->b_blocknr, 0);
+	remove_journal_hash(sb, journal->j_hash_table, NULL,
+			    bh->b_blocknr, 0);
 	clear_buffer_journaled(bh);	/* don't log this one */
 
 	if (!already_cleaned) {
-- 
2.17.0

