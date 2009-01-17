From: Mike Frysinger <vapier@gentoo.org>
Subject: [PATCH] reiserfsck: support `fsck -f -n`
Date: Sat, 17 Jan 2009 11:19:28 -0500
Message-ID: <1232209168-25857-1-git-send-email-vapier@gentoo.org>
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-devel@vger.kernel.org
Cc: Roy Marples <roy@marples.name>

From: Roy Marples <roy@marples.name>

Every other fsck util out there supports non-interactive forcing and this
change brings reiserfsck into line.

Signed-off-by: Mike Frysinger <vapier@gentoo.org>
---
 fsck/main.c |    5 +++--
 1 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/fsck/main.c b/fsck/main.c
index 06d7bd2..cfee979 100644
--- a/fsck/main.c
+++ b/fsck/main.c
@@ -421,8 +421,9 @@ void warn_what_will_be_done (char * file_name, struct fsck_data * data)
 	(data->log == stdout) ? "stdout" : 
 	(data->log_file_name ? data->log_file_name : "fsck.run"));
     
-    if (!(data->options & OPT_YES) && !user_confirmed (warn_to, "\nDo you want to "
-	"run this program?[N/Yes] (note need to type Yes if you do):", "Yes\n"))
+    if (!(data->options & OPT_YES) && !(data->options & OPT_SILENT) &&
+	!user_confirmed (warn_to, "\nDo you want to run this program?[N/Yes] "
+	"(note need to type Yes if you do):", "Yes\n"))
 	exit (EXIT_USER);
 }
 
-- 
1.6.1

