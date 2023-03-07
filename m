From: <ye.xingchen@zte.com.cn>
Subject: =?UTF-8?B?W1BBVENIXSByZWlzZXJmczogcmVtb3ZlIGR1cGxpY2F0ZSBpbmNsdWRlIGhlYWRlciBpbiB4YXR0ci5j?=
Date: Tue, 7 Mar 2023 15:17:05 +0800 (CST)
Message-ID: <202303071517050653678@zte.com.cn>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: brauner@kernel.org
Cc: dchinner@redhat.com, willy@infradead.org, viro@zeniv.linux.org.uk, reiserfs-devel@vger.kernel.org, linux-kernel@vger.kernel.org

From: Ye Xingchen <ye.xingchen@zte.com.cn>

linux/xattr.h is included more than once.

Signed-off-by: Ye Xingchen <ye.xingchen@zte.com.cn>
---
 fs/reiserfs/xattr.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/fs/reiserfs/xattr.c b/fs/reiserfs/xattr.c
index 651027967159..ed1984775a4f 100644
--- a/fs/reiserfs/xattr.c
+++ b/fs/reiserfs/xattr.c
@@ -43,7 +43,6 @@
 #include <linux/fs.h>
 #include <linux/file.h>
 #include <linux/pagemap.h>
-#include <linux/xattr.h>
 #include "xattr.h"
 #include "acl.h"
 #include <linux/uaccess.h>
-- 
2.25.1
