From: Ivan Shapovalov <intelfx100@gmail.com>
Subject: [RFC] [PATCH] mkfs: implement discarding device at filesystem creation time.
Date: Thu,  8 May 2014 23:15:54 +0400
Message-ID: <1399576554-6053-2-git-send-email-intelfx100@gmail.com>
References: <1399576554-6053-1-git-send-email-intelfx100@gmail.com>
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=dyk8qXU8y4Huq+UEq0B+Ssf0MaB8+wO6KcubGifYmFk=;
        b=Y3PTbDGoHRG+ot0DqFyREQwArNgVE5P5WeNSTAazGEFYoVgGQ0ZUfK9/brTzS/JSN6
         2V6LlZmmEJjXzucad9je61BNc8Zh/CMthdQAhteVf9KLKvasBfi+kQw7sFiBIm2D7jgW
         SqBlu+7MBzOwVl424chC+N9ieVj2dDyn0BywX2bznMxPcJAB+6mH1e2ux2380/E0W0wB
         12guqi8tN9IQgLjlGRwclnv12QJ2QQCOy8IywWzGbCny2/5zXs1+qUZ/L5AnhzXZesTn
         slM2ZfneGPtmAuKcaUDFG+C9zG6f+j8Dtskmkzyu0iI7JvktZM4D8qWMDW3K7/uDH8pQ
         r+AA==
In-Reply-To: <1399576554-6053-1-git-send-email-intelfx100@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-devel@vger.kernel.org
Cc: Ivan Shapovalov <intelfx100@gmail.com>

A new flag, -d/--discard, is used for that purpose. No discard support
auto-detection is performed.
---
 progs/mkfs/mkfs.c | 33 +++++++++++++++++++++++++++++----
 1 file changed, 29 insertions(+), 4 deletions(-)

diff --git a/progs/mkfs/mkfs.c b/progs/mkfs/mkfs.c
index 43437d4..7b9bdea 100644
--- a/progs/mkfs/mkfs.c
+++ b/progs/mkfs/mkfs.c
@@ -34,7 +34,8 @@ typedef enum mkfs_behav_flags {
 	BF_YES        = 1 << 1,
 	BF_LOST       = 1 << 2,
 	BF_SHOW_PARM  = 1 << 3,
-	BF_SHOW_PLUG  = 1 << 4
+	BF_SHOW_PLUG  = 1 << 4,
+	BF_DISCARD    = 1 << 5
 } mkfs_behav_flags_t;
 
 /* Prints mkfs options */
@@ -62,7 +63,9 @@ static void mkfs_print_usage(char *name) {
 		"  -V, --version                 prints current version.\n"
 		"  -y, --yes                     assumes an answer 'yes' to all questions.\n"
 		"  -f, --force                   makes mkfs to use whole disk, not\n"
-		"                                block device or mounted partition.\n");
+		"                                block device or mounted partition.\n"
+		"  -d, --discard                 tells mkfs to discard given device\n"
+		"                                before creating the filesystem.\n");
 }
 
 /* Initializes used by mkfs exception streams */
@@ -128,6 +131,7 @@ int main(int argc, char *argv[]) {
 		{"print-profile", no_argument, NULL, 'p'},
 		{"print-plugins", no_argument, NULL, 'l'},
 		{"override", required_argument, NULL, 'o'},
+		{"discard", no_argument, NULL, 'd'},
 		{0, 0, 0, 0}
 	};
     
@@ -146,7 +150,7 @@ int main(int argc, char *argv[]) {
 	memset(hint.label, 0, sizeof(hint.label));
 
 	/* Parsing parameters */    
-	while ((c = getopt_long(argc, argv, "hVyfb:U:L:splo:?",
+	while ((c = getopt_long(argc, argv, "hVyfb:U:L:splo:d?",
 				long_options, (int *)0)) != EOF) 
 	{
 		switch (c) {
@@ -172,6 +176,9 @@ int main(int argc, char *argv[]) {
 		case 's':
 			flags |= BF_LOST;
 			break;
+		case 'd':
+			flags |= BF_DISCARD;
+			break;
 		case 'o':
 			aal_strncat(override, optarg,
 				    aal_strlen(optarg));
@@ -440,7 +447,25 @@ int main(int argc, char *argv[]) {
 				goto error_free_device;
 			}
 		}
-    
+
+		if (flags & BF_DISCARD) {
+			if (gauge) {
+				aal_gauge_rename(gauge, "Discarding %s ... ",
+						 host_dev);
+				aal_gauge_touch(gauge);
+			}
+
+			if ((aal_device_discard(device, 0, dev_len) != 0)) {
+				aal_error("Failed to discard %s (%s).",
+					  device->name, device->error);
+				/* discard is optional, don't fail the mkfs */
+			}
+
+			if (gauge) {
+				aal_gauge_done(gauge);
+			}
+		}
+
 		if (gauge) {
 			aal_gauge_rename(gauge, "Creating reiser4 on %s ... ",
 					 host_dev);
-- 
1.9.2

