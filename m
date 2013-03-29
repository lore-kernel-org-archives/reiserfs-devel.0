From: Jan Kara <jack@suse.cz>
Subject: [PATCH] reiserfs: Fix warning and inode leak when deleting inode with xattrs
Date: Fri, 29 Mar 2013 17:09:44 +0100
Message-ID: <1364573384-19459-1-git-send-email-jack@suse.cz>
Return-path: <stable-owner@vger.kernel.org>
Sender: stable-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-fsdevel@vger.kernel.org
Cc: reiserfs-devel@vger.kernel.org, Pawel Zawora <pzawora@gmail.com>, Jan Kara <jack@suse.cz>, stable@vger.kernel.org

After commit 21d8a15a (lookup_one_len: don't accept . and ..) reiserfs
started failing to delete xattrs from inode. This was due to a buggy
test for '.' and '..' in fill_with_dentries() which resulted in passing
'.' and '..' entries to lookup_one_len() in some cases. That returned
error and so we failed to iterate over all xattrs of and inode.

Fix the test in fill_with_dentries() along the lines of the one in
lookup_one_len().

Reported-by: Pawel Zawora <pzawora@gmail.com>
CC: stable@vger.kernel.org
Signed-off-by: Jan Kara <jack@suse.cz>
---
 fs/reiserfs/xattr.c |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/fs/reiserfs/xattr.c b/fs/reiserfs/xattr.c
index c196369..4cce1d9 100644
--- a/fs/reiserfs/xattr.c
+++ b/fs/reiserfs/xattr.c
@@ -187,8 +187,8 @@ fill_with_dentries(void *buf, const char *name, int namelen, loff_t offset,
 	if (dbuf->count == ARRAY_SIZE(dbuf->dentries))
 		return -ENOSPC;
 
-	if (name[0] == '.' && (name[1] == '\0' ||
-			       (name[1] == '.' && name[2] == '\0')))
+	if (name[0] == '.' && (namelen < 2 ||
+			       (namelen == 2 && name[1] == '.')))
 		return 0;
 
 	dentry = lookup_one_len(name, dbuf->xadir, namelen);
-- 
1.7.1
