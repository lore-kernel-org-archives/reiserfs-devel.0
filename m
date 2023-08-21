From: Shigeru Yoshida <syoshida@redhat.com>
Subject: [PATCH] reiserfs: Replace 1-element array with C99 style flex-array
Date: Mon, 21 Aug 2023 13:33:12 +0900
Message-ID: <20230821043312.1444068-1-syoshida@redhat.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1692592404;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=Br/Gj1T78wovSAQTl1ZJ6wGykRttQ/DnXY6mK9SoBdM=;
        b=W75Wqdtx8X2ApusXGgIs+AXv/B6oqjlVMKEInzUQ5yl4AZvIS5bDAPFhX4EEq7y4tU1rjv
        W2CVQ55fcGw022eVbe4f4FekjzFdmaA+tMygXqOdBJQs89duhEdImzxbUJ/0fA5dTbHIEV
        2pYenDNqJseRugerXFSI3D9AcR4lvfc=
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-devel@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, brauner@kernel.org, dchinner@redhat.com, dsterba@suse.com, axboe@kernel.dk, viro@zeniv.linux.org.uk, Shigeru Yoshida <syoshida@redhat.com>

UBSAN found the following issue:

================================================================================
UBSAN: array-index-out-of-bounds in fs/reiserfs/journal.c:4166:22
index 1 is out of range for type '__le32 [1]'

This is because struct reiserfs_journal_desc uses 1-element array for
dynamically sized array member, j_realblock.

This patch fixes this issue by replacing the 1-element array member with C99
style flex-array.  This patch also fixes the same issue in struct
reiserfs_journal_commit as the same manner.

Fixes: f466c6fdb3b1 ("move private bits of reiserfs_fs.h to fs/reiserfs/reiserfs.h")
Signed-off-by: Shigeru Yoshida <syoshida@redhat.com>
---
 fs/reiserfs/reiserfs.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/fs/reiserfs/reiserfs.h b/fs/reiserfs/reiserfs.h
index 55e85256aae8..8ed547893ae9 100644
--- a/fs/reiserfs/reiserfs.h
+++ b/fs/reiserfs/reiserfs.h
@@ -2699,7 +2699,7 @@ struct reiserfs_iget_args {
 #define get_journal_desc_magic(bh) (bh->b_data + bh->b_size - 12)
 
 #define journal_trans_half(blocksize) \
-	((blocksize - sizeof (struct reiserfs_journal_desc) + sizeof (__u32) - 12) / sizeof (__u32))
+	((blocksize - sizeof(struct reiserfs_journal_desc) - 12) / sizeof(__u32))
 
 /* journal.c see journal.c for all the comments here */
 
@@ -2711,7 +2711,7 @@ struct reiserfs_journal_desc {
 	__le32 j_len;
 
 	__le32 j_mount_id;	/* mount id of this trans */
-	__le32 j_realblock[1];	/* real locations for each block */
+	__le32 j_realblock[];	/* real locations for each block */
 };
 
 #define get_desc_trans_id(d)   le32_to_cpu((d)->j_trans_id)
@@ -2726,7 +2726,7 @@ struct reiserfs_journal_desc {
 struct reiserfs_journal_commit {
 	__le32 j_trans_id;	/* must match j_trans_id from the desc block */
 	__le32 j_len;		/* ditto */
-	__le32 j_realblock[1];	/* real locations for each block */
+	__le32 j_realblock[];	/* real locations for each block */
 };
 
 #define get_commit_trans_id(c) le32_to_cpu((c)->j_trans_id)
-- 
2.41.0

