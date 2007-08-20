From: Jeff Layton <jlayton@redhat.com>
Subject: [PATCH 4/4] Have reiser4 call generic_attrkill from its setattr operation
Date: Mon, 20 Aug 2007 16:53:33 -0400
Message-ID: <200708202053.l7KKrXRC017773@dantu.rdu.redhat.com>
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org
Cc: reiserfs-devel@vger.kernel.org

This is the only filesystem in -mm but not in mainline that seems to
be affected by this change...

Signed-off-by: Jeff Layton <jlayton@redhat.com>
---
 fs/reiser4/plugin/inode_ops.c |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/fs/reiser4/plugin/inode_ops.c b/fs/reiser4/plugin/inode_ops.c
index 48430f7..25a0093 100644
--- a/fs/reiser4/plugin/inode_ops.c
+++ b/fs/reiser4/plugin/inode_ops.c
@@ -436,6 +436,7 @@ int reiser4_setattr_common(struct dentry *dentry, struct iattr *attr)
 	int result;
 
 	inode = dentry->d_inode;
+	generic_attrkill(inode->i_mode, attr);
 	result = inode_change_ok(inode, attr);
 	if (result)
 		return result;
-- 
1.5.2.2

