From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: [patch 3/4] reiser4: create and lookup do not take nameidata
Date: Sun, 21 Oct 2012 19:59:23 +0200
Message-ID: <508437FB.2020801@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------080403070702000800000701"
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:user-agent:mime-version:to:subject
         :content-type;
        bh=aqOf26SXuLeN1TgPNqOY1xRAOq64Wg8pq4IQFnbM2dE=;
        b=06a44V345avooTbUbCz9NgsosFDLGLf+3lc44XSQGTkBTp9KRdbak+a1o9sanXGcrf
         xGqmX6hlJ14IkmIyJJrhfC3slCo9NbdSpF3TJEuGIwLqvg8vGvoB4F3+nvfkT+x2oRd5
         uVOcQ3dvaIfM/UDLmjaNn9rOXI00AP4SfNwF48GXR7W1T0rUgQZrJhpYr0w71L/097hT
         F9of9u5r/z6VJXcNEOIdcQvpOSo9S5XZ84eKCfPlWJRzn/8OlMG3TaQ58AyEEA+PJXik
         iOYYMLbMyd/3Ek4EYzZ9zGZ6LCeFYjVVYzCQMRPuNmjUYHLdOQuKXn1ugdxYGT3xqyyO
         Qwtg==
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
To: reiserfs-devel@vger.kernel.org

This is a multi-part message in MIME format.
--------------080403070702000800000701
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit



--------------080403070702000800000701
Content-Type: text/x-patch;
 name="reiser4-adjust-create-and-lookup.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="reiser4-adjust-create-and-lookup.patch"

From 33fca1ec4438abc5540185ade3599661048d3c91 Mon Sep 17 00:00:00 2001
From: Ivan Shapovalov <intelfx100@gmail.com>
Date: Thu, 4 Oct 2012 13:49:06 +0400
Subject: [PATCH] Adjust reiser4 for 3.6: ->create() and ->lookup() do not
take nameidata.

---
 fs/reiser4/plugin/inode_ops.c | 8 ++++----
 fs/reiser4/plugin/object.h    | 4 ++--
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/fs/reiser4/plugin/inode_ops.c b/fs/reiser4/plugin/inode_ops.c
index 1f4be3d..b784dc5 100644
--- a/fs/reiser4/plugin/inode_ops.c
+++ b/fs/reiser4/plugin/inode_ops.c
@@ -21,14 +21,14 @@ static int create_vfs_object(struct inode *parent, struct dentry *dentry,
  * @parent: inode of parent directory
  * @dentry: dentry of new object to create
  * @mode: the permissions to use
- * @nameidata:
+ * @exclusive:
  *
  * This is common implementation of vfs's create method of struct
  * inode_operations.
  * Creates regular file using file plugin from parent directory plugin set.
  */
 int reiser4_create_common(struct inode *parent, struct dentry *dentry,
-			  umode_t mode, struct nameidata *nameidata)
+			  umode_t mode, bool exclusive)
 {
 	reiser4_object_create_data data;
 	file_plugin *fplug;
@@ -52,14 +52,14 @@ void check_light_weight(struct inode *inode, struct inode *parent);
  * reiser4_lookup_common - lookup of inode operations
  * @parent: inode of directory to lookup into
  * @dentry: name to look for
- * @nameidata:
+ * @flags:
  *
  * This is common implementation of vfs's lookup method of struct
  * inode_operations.
  */
 struct dentry *reiser4_lookup_common(struct inode *parent,
 				     struct dentry *dentry,
-				     struct nameidata *nameidata)
+				     unsigned int flags)
 {
 	reiser4_context *ctx;
 	int result;
diff --git a/fs/reiser4/plugin/object.h b/fs/reiser4/plugin/object.h
index 260ba27..49f11ae 100644
--- a/fs/reiser4/plugin/object.h
+++ b/fs/reiser4/plugin/object.h
@@ -10,10 +10,10 @@
 
 /* common implementations of inode operations */
 int reiser4_create_common(struct inode *parent, struct dentry *dentry,
-			  umode_t mode, struct nameidata *);
+			  umode_t mode, bool);
 struct dentry *reiser4_lookup_common(struct inode *parent,
 				      struct dentry *dentry,
-				      struct nameidata *nameidata);
+				      unsigned int);
 int reiser4_link_common(struct dentry *existing, struct inode *parent,
 			struct dentry *newname);
 int reiser4_unlink_common(struct inode *parent, struct dentry *victim);
-- 
1.7.12.2


--------------080403070702000800000701--
