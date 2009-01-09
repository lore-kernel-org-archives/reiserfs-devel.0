From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: patch [2/4] reiser4progs: make -p preen
Date: Fri, 09 Jan 2009 03:16:13 +0300
Message-ID: <4966974D.9020104@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------080700080808040107020406"
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
To: Reiserfs mailing list <reiserfs-devel@vger.kernel.org>

This is a multi-part message in MIME format.
--------------080700080808040107020406
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit




--------------080700080808040107020406
Content-Type: text/x-patch;
 name="reiser4progs-make-p-preen.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="reiser4progs-make-p-preen.patch"

Alias -p "preen" to -a "auto"
Fix by Anders Aagaard <aagaande@gmail.com>

Signed-off-by: Edward Shishkin<edward.shishkin@gmail.com>
---
 reiser4progs-1.0.6-orig/doc/fsck.reiser4.8 |    5 ++++-
 reiser4progs-1.0.6-orig/progs/fsck/fsck.c  |    9 +++++----
 2 files changed, 9 insertions(+), 5 deletions(-)

--- reiser4progs-1.0.6-orig/doc/fsck.reiser4.8.orig
+++ reiser4progs-1.0.6-orig/doc/fsck.reiser4.8
@@ -54,7 +54,7 @@ supresses gauges.
 ignored.
 .SH PLUGIN OPTIONS
 .TP
-.B -p, --print-profile
+.B --print-profile
 prints the plugin profile. This is the set of default plugins used for all
 parts of a filesystem -- format, nodes, files, directories, hashes, etc. If
 --override is specified, then prints modified plugins.
@@ -82,6 +82,9 @@ assumes an answer 'yes' to all questions
 .B -f, --force
 forces fsck to use whole disk, not block device or mounted partition.
 .TP
+.B -p, --preen
+automatically repair minor corruptions on the filesystem.
+.TP
 .B -c, --cache N
 tunes number of nodes in the libreiser4 tree buffer cache
 .RS
--- reiser4progs-1.0.6-orig/progs/fsck/fsck.c.orig
+++ reiser4progs-1.0.6-orig/progs/fsck/fsck.c
@@ -28,7 +28,7 @@ static void fsck_print_usage(char *name)
 		"  -q, --quiet                   supresses gauges\n"
 		"  -r                            ignored\n"
 		"Plugins options:\n"
-		"  -p, --print-profile           prints the plugin profile.\n"
+		"  --print-profile               prints the plugin profile.\n"
 		"  -l, --print-plugins           prints all known plugins.\n"
 		"  -o, --override TYPE=PLUGIN    overrides the default plugin of the type\n"
 	        "                                \"TYPE\" by the plugin \"PLUGIN\" in the\n"
@@ -39,6 +39,7 @@ static void fsck_print_usage(char *name)
 		"  -y, --yes                     assumes an answer 'yes' to all questions.\n"
 		"  -f, --force                   makes fsck to use whole disk, not block\n"
 		"                                device or mounted partition.\n"
+		"  -p, --preen                   automatically repair the filesysem.\n"
 		"  -c, --cache N                 number of nodes in tree buffer cache\n");
 }
 
@@ -140,6 +141,7 @@ static errno_t fsck_init(fsck_parse_t *d
 		{"no-log", no_argument, NULL, 'n'},
 		{"auto", no_argument, NULL, 'a'},
 		{"force", no_argument, NULL, 'f'},
+		{"preen", no_argument, NULL, 'p'},
 		{"cache", required_argument, 0, 'c'},
 		{"override", required_argument, NULL, 'o'},
 		/* Fsck hidden options. */
@@ -190,6 +192,8 @@ static errno_t fsck_init(fsck_parse_t *d
 		case 'f':
 			aal_set_bit(&data->options, FSCK_OPT_FORCE);
 			break;
+		case 'p':
+			/* Fall through to auto, as preen is an alias for -a */
 		case 'a':
 			aal_set_bit(&data->options, FSCK_OPT_AUTO);
 			break;
@@ -226,9 +230,6 @@ static errno_t fsck_init(fsck_parse_t *d
 		case 'l':
 			mode = RM_SHOW_PLUG;
 			break;
-		case 'p':
-			mode = RM_SHOW_PARM;
-			break;
 		case 'o':
 			aal_strncat(override, optarg, aal_strlen(optarg));
 			aal_strncat(override, ",", 1);


--------------080700080808040107020406--
