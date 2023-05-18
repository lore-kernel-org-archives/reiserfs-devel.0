From: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
Subject: [PATCH] fs/reiserfs/xattr.c: Remove duplicate include
Date: Thu, 18 May 2023 16:30:11 +0800
Message-ID: <20230518083011.30694-1-jiapeng.chong@linux.alibaba.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-devel@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Jiapeng Chong <jiapeng.chong@linux.alibaba.com>, Abaci Robot <abaci@linux.alibaba.com>

./fs/reiserfs/xattr.c: linux/xattr.h is included more than once.

Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Link: https://bugzilla.openanolis.cn/show_bug.cgi?id=5236
Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
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
2.20.1.7.g153144c

