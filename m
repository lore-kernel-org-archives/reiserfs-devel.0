From: Tahsin Erdogan <tahsin@google.com>
Subject: [PATCH 22/28] ext4: move struct ext4_xattr_inode_array to xattr.h
Date: Wed, 31 May 2017 01:15:11 -0700
Message-ID: <20170531081517.11438-22-tahsin@google.com>
References: <20170531081517.11438-1-tahsin@google.com>
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=yju8xEl1J2Kk4cuIuPkyDNK35rDK+fPjqvKnXji9LFU=;
        b=iOTR96WAwM2M7TV6fogfYDhtIKToTyb7dT65/RMzT+9KbH9zsThnAaC4kh3MOYceS0
         f1XW7qHYNzZshkWduMPCj0DG0/911Uwzl1XdLCl9SM0pMFt1WrJB25dif60Wh5+WoFWb
         MgJKLbH19r8MwCoyXqhWFRL+Bger2rwdlbbo98/PShHsF2RR5IQE9bEMGGaiSP1mO4eM
         wwrwvocgTJTxeqPHNcy0Jt6EzVqzPaxTvSk047ms+bCcakIhoopn/Qi6+UEWSue/tNA+
         jNx+PoCdkBM00aDOrUzOeZ6gwtlMErfQzQCxF/r0/0OlZ9jZ2LK+wlNA2Nmd+ikb6L//
         dz9A==
In-Reply-To: <20170531081517.11438-1-tahsin@google.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jan Kara <jack@suse.com>, Theodore Ts'o <tytso@mit.edu>, Andreas Dilger <adilger.kernel@dilger.ca>, Dave Kleikamp <shaggy@kernel.org>, Alexander Viro <viro@zeniv.linux.org.uk>, Mark Fasheh <mfasheh@versity.com>, Joel Becker <jlbec@evilplan.org>, Jens Axboe <axboe@fb.com>, Deepa Dinamani <deepa.kernel@gmail.com>, Mike Christie <mchristi@redhat.com>, Fabian Frederick <fabf@skynet.be>, linux-ext4@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, jfs-discussion@lists.sourceforge.net, linux-fsdevel@vger.kernel.org, ocfs2-devel@oss.oracle.com, reiserfs-devel@vger.kernel.org, Tahsin Erdogan <tahsin@google.com>

Since this is a xattr specific data structure it is cleaner to keep it in
xattr header file.

Signed-off-by: Tahsin Erdogan <tahsin@google.com>
---
 fs/ext4/ext4.h  | 4 ----
 fs/ext4/xattr.h | 5 +++++
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/fs/ext4/ext4.h b/fs/ext4/ext4.h
index 603edb5ff304..580fdb753f29 100644
--- a/fs/ext4/ext4.h
+++ b/fs/ext4/ext4.h
@@ -2232,10 +2232,6 @@ struct mmpd_data {
 # define ATTRIB_NORET	__attribute__((noreturn))
 # define NORET_AND	noreturn,
 
-struct ext4_xattr_inode_array {
-	unsigned int count;		/* # of used items in the array */
-	struct inode *inodes[0];
-};
 /* bitmap.c */
 extern unsigned int ext4_count_free(char *bitmap, unsigned numchars);
 void ext4_inode_bitmap_csum_set(struct super_block *sb, ext4_group_t group,
diff --git a/fs/ext4/xattr.h b/fs/ext4/xattr.h
index 323eba54f72f..adf761518a73 100644
--- a/fs/ext4/xattr.h
+++ b/fs/ext4/xattr.h
@@ -117,6 +117,11 @@ struct ext4_xattr_ibody_find {
 	struct ext4_iloc iloc;
 };
 
+struct ext4_xattr_inode_array {
+	unsigned int count;		/* # of used items in the array */
+	struct inode *inodes[0];
+};
+
 extern const struct xattr_handler ext4_xattr_user_handler;
 extern const struct xattr_handler ext4_xattr_trusted_handler;
 extern const struct xattr_handler ext4_xattr_security_handler;
-- 
2.13.0.219.gdb65acc882-goog

