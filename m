From: Adrian Bunk <bunk@kernel.org>
Subject: [2.6 patch] reiserfs/procfs.c: remove CVS keywords
Date: Tue, 20 May 2008 00:58:40 +0300
Message-ID: <20080519215840.GT17716@cs181133002.pp.htv.fi>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Content-Disposition: inline
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-devel@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

This patch removes CVS keywords that weren't updated for a long time 
from comments.

Signed-off-by: Adrian Bunk <bunk@kernel.org>

---

 fs/reiserfs/procfs.c |    3 ---
 1 file changed, 3 deletions(-)

a41d213debad92b6672c39b577baf58641b5c54c diff --git a/fs/reiserfs/procfs.c b/fs/reiserfs/procfs.c
index b9dbeec..37173fa 100644
--- a/fs/reiserfs/procfs.c
+++ b/fs/reiserfs/procfs.c
@@ -8,8 +8,6 @@
 
 /* proc info support a la one created by Sizif@Botik.RU for PGC */
 
-/* $Id: procfs.c,v 1.1.8.2 2001/07/15 17:08:42 god Exp $ */
-
 #include <linux/module.h>
 #include <linux/time.h>
 #include <linux/seq_file.h>
@@ -621,7 +619,6 @@ int reiserfs_global_version_in_proc(char *buffer, char **start,
 #endif
 
 /*
- * $Log: procfs.c,v $
  * Revision 1.1.8.2  2001/07/15 17:08:42  god
  *  . use get_super() in procfs.c
  *  . remove remove_save_link() from reiserfs_do_truncate()

