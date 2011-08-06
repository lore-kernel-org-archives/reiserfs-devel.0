From: Thomas Meyer <thomas@m3y3r.de>
Subject: [PATCH] reiserfs: use kstrdup()
Date: Sat, 06 Aug 2011 17:39:08 +0200
Message-ID: <1312645151.5589.137.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-devel@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

From: Thomas Meyer <thomas@m3y3r.de>

 Use kstrdup rather than duplicating its implementation

 The semantic patch that makes this output is available
 in scripts/coccinelle/api/kstrdup.cocci.

 More information about semantic patching is available at
 http://coccinelle.lip6.fr/

Signed-off-by: Thomas Meyer <thomas@m3y3r.de>
---

diff -u -p a/fs/reiserfs/super.c b/fs/reiserfs/super.c
--- a/fs/reiserfs/super.c 2011-07-26 00:46:10.533500551 +0200
+++ b/fs/reiserfs/super.c 2011-08-01 20:57:26.561121140 +0200
@@ -1021,8 +1021,7 @@ static int reiserfs_parse_options(struct
 							 "on filesystem root.");
 					return 0;
 				}
-				qf_names[qtype] =
-				    kmalloc(strlen(arg) + 1, GFP_KERNEL);
+				qf_names[qtype] = kstrdup(arg, GFP_KERNEL);
 				if (!qf_names[qtype]) {
 					reiserfs_warning(s, "reiserfs-2502",
 							 "not enough memory "
@@ -1030,7 +1029,6 @@ static int reiserfs_parse_options(struct
 							 "quotafile name.");
 					return 0;
 				}
-				strcpy(qf_names[qtype], arg);
 				*mount_options |= 1 << REISERFS_QUOTA;
 			} else {
 				if (qf_names[qtype] !=



