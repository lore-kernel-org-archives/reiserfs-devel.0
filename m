From: Tahsin Erdogan <tahsin@google.com>
Subject: [PATCH 06/28] ext4: ea_inode owner should be the same as the inode owner
Date: Wed, 31 May 2017 01:14:55 -0700
Message-ID: <20170531081517.11438-6-tahsin@google.com>
References: <20170531081517.11438-1-tahsin@google.com>
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=uZ2kJMwdLk4VknuajjnYXaysr32vhEZVF4WMuApqNbo=;
        b=NZw9GEFGntuQK21LbfBBotGyOCGDRX3ItXBJjIEXYturIYK+33LAUKj3gxYyhtDbK3
         jpmaaaq23f5kZOZHT8m1NhWfUlX/KjY5ukbWxobLkb5fgekVklSGUBSskoXKZVVfiEAo
         iCz4wkEKbi8ikTOP7JZ+1JRX+P5M6PEdQZZ3Y7+GkyqaTnrZkrR1FO/ct+NcaP8Zx/7Q
         mRuaA+HujLEwC2fzXiWtgn8/0aX2oqm/b5GLFh1fYjCJ+lDU2f/7beiOAj7a32JK1JvN
         iHJnLCNb3v616khtZN6S7lQKDFU3F25dfgErzkWOJ4mi42Tx2YXl43Ea75BqBhff1n8k
         r//A==
In-Reply-To: <20170531081517.11438-1-tahsin@google.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jan Kara <jack@suse.com>, Theodore Ts'o <tytso@mit.edu>, Andreas Dilger <adilger.kernel@dilger.ca>, Dave Kleikamp <shaggy@kernel.org>, Alexander Viro <viro@zeniv.linux.org.uk>, Mark Fasheh <mfasheh@versity.com>, Joel Becker <jlbec@evilplan.org>, Jens Axboe <axboe@fb.com>, Deepa Dinamani <deepa.kernel@gmail.com>, Mike Christie <mchristi@redhat.com>, Fabian Frederick <fabf@skynet.be>, linux-ext4@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, jfs-discussion@lists.sourceforge.net, linux-fsdevel@vger.kernel.org, ocfs2-devel@oss.oracle.com, reiserfs-devel@vger.kernel.org, Tahsin Erdogan <tahsin@google.com>

Quota charging is based on the ownership of the inode. Currently, the
xattr inode owner is set to the caller which may be different from the
parent inode owner. This is inconsistent with how quota is charged for
xattr block and regular data block writes.

Signed-off-by: Tahsin Erdogan <tahsin@google.com>
---
 fs/ext4/xattr.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/fs/ext4/xattr.c b/fs/ext4/xattr.c
index 8e123533315f..32ad2f2870e9 100644
--- a/fs/ext4/xattr.c
+++ b/fs/ext4/xattr.c
@@ -826,6 +826,7 @@ static struct inode *ext4_xattr_inode_create(handle_t *handle,
 					     struct inode *inode)
 {
 	struct inode *ea_inode = NULL;
+	uid_t owner[2] = { i_uid_read(inode), i_gid_read(inode) };
 	int err;
 
 	/*
@@ -833,7 +834,7 @@ static struct inode *ext4_xattr_inode_create(handle_t *handle,
 	 * in the same group, or nearby one.
 	 */
 	ea_inode = ext4_new_inode(handle, inode->i_sb->s_root->d_inode,
-				  S_IFREG | 0600, NULL, inode->i_ino + 1, NULL,
+				  S_IFREG | 0600, NULL, inode->i_ino + 1, owner,
 				  EXT4_EA_INODE_FL);
 	if (!IS_ERR(ea_inode)) {
 		ea_inode->i_op = &ext4_file_inode_operations;
-- 
2.13.0.219.gdb65acc882-goog

