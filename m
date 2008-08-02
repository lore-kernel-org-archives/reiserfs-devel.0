From: Huang Weiyi <weiyi.huang@gmail.com>
Subject: fs/reiserfs/super.c: removed duplicated #include
Date: Sat, 02 Aug 2008 21:06:51 +0800
Message-ID: <20080802210318.D638.WEIYI.HUANG@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:date:from:to:subject
         :message-id:mime-version:content-type:content-transfer-encoding
         :x-mailer;
        bh=4P0NXHTeO9UnH3n9BeG1MgNk37QFEpq6AOrsZDON7Og=;
        b=BBpWfmdrCQCexzHvr8dTqWSaNUzSyZdwS/j8Yo53TFMNDsRBA73xy6NMUtWM3ZVCXW
         mk5yL4wG5FelqNjxbfXFhvQTKeQAe1gCs0D1z2I8GIzKTGoUjTBbKKytaAwut52AH9rC
         KqRwiGQn+ZDbnde871vKicPX6NvVShRrKSlTI=
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-devel@vger.kernel.org

Removed duplicated #include <linux/quotaops.h> in 
fs/reiserfs/super.c.

Signed-off-by: Huang Weiyi <weiyi.huang@gmail.com>

diff --git a/fs/reiserfs/super.c b/fs/reiserfs/super.c
index 282a135..d318c7e 100644
--- a/fs/reiserfs/super.c
+++ b/fs/reiserfs/super.c
@@ -27,7 +27,6 @@
 #include <linux/mnt_namespace.h>
 #include <linux/mount.h>
 #include <linux/namei.h>
-#include <linux/quotaops.h>

 struct file_system_type reiserfs_fs_type;


