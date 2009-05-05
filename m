From: Jeff Mahoney <jeffm@suse.com>
Subject: [patch 2/3] reiserfs: dont associate security.* with xattr files
Date: Tue, 05 May 2009 15:30:16 -0400
Message-ID: <20090505193206.840761438@suse.com>
References: <20090505193014.926371851@suse.com>
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Content-Disposition: inline; filename=reiserfs-fixup-security
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: ReiserFS Devel <reiserfs-devel@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>, LKML <linux-kernel@vger.kernel.org>
Cc: Al Viron <viro@ZenIV.linux.org.uk>

 The security.* xattrs are ignored for xattr files, so don't create them.

Signed-off-by: Jeff Mahoney <jeffm@suse.com>
---

 fs/reiserfs/xattr_security.c |   12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

--- a/fs/reiserfs/xattr_security.c
+++ b/fs/reiserfs/xattr_security.c
@@ -55,8 +55,16 @@ int reiserfs_security_init(struct inode
 			   struct reiserfs_security_handle *sec)
 {
 	int blocks = 0;
-	int error = security_inode_init_security(inode, dir, &sec->name,
-						 &sec->value, &sec->length);
+	int error;
+
+	sec->name = NULL;
+
+	/* Don't add selinux attributes on xattrs - they'll never get used */
+	if (IS_PRIVATE(dir))
+		return 0;
+
+	error = security_inode_init_security(inode, dir, &sec->name,
+					     &sec->value, &sec->length);
 	if (error) {
 		if (error == -EOPNOTSUPP)
 			error = 0;


