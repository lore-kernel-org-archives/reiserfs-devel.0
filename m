From: Mikulas Patocka <mikulas@twibright.com>
Subject: [PATCH] reiserfs: check kstrdup failure
Date: Tue, 24 May 2016 22:51:27 +0200 (CEST)
Message-ID: <alpine.DEB.2.02.1605242249270.5924@leontynka>
Mime-Version: 1.0
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-devel@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org

Check out-of-memory failure of the kstrdup option. Note that the argument
"arg" may be NULL (in that case kstrup returns NULL), so out of memory
condition happened if arg was non-NULL and kstrdup returned NULL.

The patch also changes the call to replace_mount_options - if we didn't
pass any filesystem-specific options, we don't call replace_mount_options
(thus we don't erase existing reported options).

Note that to properly report options after remount, the reiserfs 
filesystem should implement the show_options method. Without the 
show_options method, options changed with remount replace existing 
options.

Signed-off-by: Mikulas Patocka <mpatocka@redhat.com>

---
 fs/reiserfs/super.c |    9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

Index: linux-4.6/fs/reiserfs/super.c
===================================================================
--- linux-4.6.orig/fs/reiserfs/super.c	2016-05-19 20:59:46.000000000 +0200
+++ linux-4.6/fs/reiserfs/super.c	2016-05-19 21:00:00.000000000 +0200
@@ -1393,7 +1393,7 @@ static int reiserfs_remount(struct super
 	unsigned long safe_mask = 0;
 	unsigned int commit_max_age = (unsigned int)-1;
 	struct reiserfs_journal *journal = SB_JOURNAL(s);
-	char *new_opts = kstrdup(arg, GFP_KERNEL);
+	char *new_opts;
 	int err;
 	char *qf_names[REISERFS_MAXQUOTAS];
 	unsigned int qfmt = 0;
@@ -1401,6 +1401,10 @@ static int reiserfs_remount(struct super
 	int i;
 #endif
 
+	new_opts = kstrdup(arg, GFP_KERNEL);
+	if (arg && !new_opts)
+		return -ENOMEM;
+
 	sync_filesystem(s);
 	reiserfs_write_lock(s);
 
@@ -1546,7 +1550,8 @@ static int reiserfs_remount(struct super
 	}
 
 out_ok_unlocked:
-	replace_mount_options(s, new_opts);
+	if (new_opts)
+		replace_mount_options(s, new_opts);
 	return 0;
 
 out_err_unlock:
