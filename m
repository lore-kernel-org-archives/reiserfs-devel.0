From: Roy Marples <roy@marples.name>
Subject: [PATCH 08/10] reiserfsck: support `fsck -f -n`
Date: Thu, 11 Oct 2012 13:39:49 -0400
Message-ID: <20121011200116.0913E200A4@oldboy.suse.de>
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-devel@vger.kernel.org

Every other fsck util out there supports non-interactive forcing and this
change brings reiserfsck into line.

Signed-off-by: Roy Marples <roy@marples.name>
Signed-off-by: Mike Frysinger <vapier@gentoo.org>
Signed-off-by: Jeff Mahoney <jeffm@suse.com>
---
 fsck/main.c |    5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/fsck/main.c b/fsck/main.c
index e4253af..31e97bf 100644
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
1.7.10.4


