From: Tahsin Erdogan <tahsin@google.com>
Subject: [PATCH 07/28] ext4: call journal revoke when freeing ea_inode blocks
Date: Wed, 31 May 2017 01:14:56 -0700
Message-ID: <20170531081517.11438-7-tahsin@google.com>
References: <20170531081517.11438-1-tahsin@google.com>
Return-path: <linux-fsdevel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=K+v/1BbjqIJ+eW9Xv6ECClBNdS3KyTcu1WOVgMupFvU=;
        b=CHJvsFfgvxd/fD96ocBuo87Z72Dl2MdIh9+C8r5gaW7jS4bVB2sB+u9vzYpj8kKpoU
         y7toepbaJZgI+42E01s4DTOFmQ6/oTsl/eDMisnHMZQNrR7K+Wc3ve+pg1HeyjCtqjVd
         o54kiZyqx6aYZGLiBtgvTwQo3vBQ+nWDZvdbhCTzxkXmuysHr+lV13QEBHh4SZCjd/E0
         yioB7tyE5PtqdzzfIQsLWXtK1KmXoF2daAmD+KXbZeBhiXjSqf56xl4ZYpvxkQ7Xz+3Q
         QhenPFnw2ibToyg276f0Wx2NgXaGbHEjrJ7qAez48mi5topdDg4XgCZVaIwbhBgJyahV
         DKBA==
In-Reply-To: <20170531081517.11438-1-tahsin@google.com>
Sender: linux-fsdevel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jan Kara <jack@suse.com>, Theodore Ts'o <tytso@mit.edu>, Andreas Dilger <adilger.kernel@dilger.ca>, Dave Kleikamp <shaggy@kernel.org>, Alexander Viro <viro@zeniv.linux.org.uk>, Mark Fasheh <mfasheh@versity.com>, Joel Becker <jlbec@evilplan.org>, Jens Axboe <axboe@fb.com>, Deepa Dinamani <deepa.kernel@gmail.com>, Mike Christie <mchristi@redhat.com>, Fabian Frederick <fabf@skynet.be>, linux-ext4@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, jfs-discussion@lists.sourceforge.net, linux-fsdevel@vger.kernel.org, ocfs2-devel@oss.oracle.com, reiserfs-devel@vger.kernel.org, Tahsin Erdogan <tahsin@google.com>

ea_inode contents are treated as metadata, that's why it is journaled
during initial writes. Failing to call revoke during freeing could cause
user data to be overwritten with original ea_inode contents during journal
replay.

Signed-off-by: Tahsin Erdogan <tahsin@google.com>
---
 fs/ext4/extents.c  | 3 ++-
 fs/ext4/indirect.c | 3 ++-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/fs/ext4/extents.c b/fs/ext4/extents.c
index 3e36508610b7..e0a8425ff74d 100644
--- a/fs/ext4/extents.c
+++ b/fs/ext4/extents.c
@@ -2488,7 +2488,8 @@ int ext4_ext_index_trans_blocks(struct inode *inode, int extents)
 
 static inline int get_default_free_blocks_flags(struct inode *inode)
 {
-	if (S_ISDIR(inode->i_mode) || S_ISLNK(inode->i_mode))
+	if (S_ISDIR(inode->i_mode) || S_ISLNK(inode->i_mode) ||
+	    ext4_test_inode_flag(inode, EXT4_INODE_EA_INODE))
 		return EXT4_FREE_BLOCKS_METADATA | EXT4_FREE_BLOCKS_FORGET;
 	else if (ext4_should_journal_data(inode))
 		return EXT4_FREE_BLOCKS_FORGET;
diff --git a/fs/ext4/indirect.c b/fs/ext4/indirect.c
index bc15c2c17633..7ffa290cbb8e 100644
--- a/fs/ext4/indirect.c
+++ b/fs/ext4/indirect.c
@@ -829,7 +829,8 @@ static int ext4_clear_blocks(handle_t *handle, struct inode *inode,
 	int	flags = EXT4_FREE_BLOCKS_VALIDATED;
 	int	err;
 
-	if (S_ISDIR(inode->i_mode) || S_ISLNK(inode->i_mode))
+	if (S_ISDIR(inode->i_mode) || S_ISLNK(inode->i_mode) ||
+	    ext4_test_inode_flag(inode, EXT4_INODE_EA_INODE))
 		flags |= EXT4_FREE_BLOCKS_FORGET | EXT4_FREE_BLOCKS_METADATA;
 	else if (ext4_should_journal_data(inode))
 		flags |= EXT4_FREE_BLOCKS_FORGET;
-- 
2.13.0.219.gdb65acc882-goog

