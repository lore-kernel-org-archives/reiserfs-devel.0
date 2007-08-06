From: Jeff Layton <jlayton@redhat.com>
Subject: [PATCH 19/25] reiserfs: call attr_kill_to_mode from reiserfs_setattr
Date: Mon, 6 Aug 2007 09:55:03 -0400
Message-ID: <200708061355.l76Dt37g002360@dantu.rdu.redhat.com>
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org
Cc: reiserfs-devel@vger.kernel.org

..and only save off ia_valid after it returns

Signed-off-by: Jeff Layton <jlayton@redhat.com>
---
 fs/reiserfs/inode.c |    6 +++++-
 1 files changed, 5 insertions(+), 1 deletions(-)

diff --git a/fs/reiserfs/inode.c b/fs/reiserfs/inode.c
index ddde489..55b2aea 100644
--- a/fs/reiserfs/inode.c
+++ b/fs/reiserfs/inode.c
@@ -2896,7 +2896,11 @@ int reiserfs_setattr(struct dentry *dentry, struct iattr *attr)
 {
 	struct inode *inode = dentry->d_inode;
 	int error;
-	unsigned int ia_valid = attr->ia_valid;
+	unsigned int ia_valid;
+
+	attr_kill_to_mode(inode, attr);
+	ia_valid = attr->ia_valid;
+
 	reiserfs_write_lock(inode->i_sb);
 	if (attr->ia_valid & ATTR_SIZE) {
 		/* version 2 items will be caught by the s_maxbytes check
-- 
1.5.2.2

