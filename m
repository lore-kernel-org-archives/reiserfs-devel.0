From: akpm@osdl.org
Subject: [patch 099/174] reiserfs: make resize option auto-get new device size
Date: Sun, 01 May 2005 01:48:07 -0700
Message-ID: <200505010848.j418mVwi006821@shell0.pdx.osdl.net>
Return-path: <reiserfs-list-return-23947-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: torvalds@osdl.org
Cc: akpm@osdl.org, blaisorblade@yahoo.it, mtk-manpages@gmx.net, reiserfs-dev@namesys.com, reiserfs-list@namesys.com, zam@namesys.com


From: Paolo 'Blaisorblade' Giarrusso <blaisorblade@yahoo.it>

It's trivial for the resize option to auto-get the underlying device size,
while it's harder for the user.  I've copied the code from jfs.

Since of the different reiserfs option parser (which does not use the
superior match_token used by almost every other filesystem), I've had to
use the "resize=auto" and not "resize" option to specify this behaviour. 
Changing the option parser to the kernel one wouldn't be bad but I've no
time to do this cleanup in this moment.

Btw, the mount(8) man page should be updated to include this option.  Cc
the relevant people, please (I hope I cc'ed the right people).

Cc: <reiserfs-dev@namesys.com>
Cc: <reiserfs-list@namesys.com>
Cc: <mtk-manpages@gmx.net>
Cc: Alex Zarochentsev <zam@namesys.com>
Signed-off-by: Paolo 'Blaisorblade' Giarrusso <blaisorblade@yahoo.it>
Signed-off-by: Andrew Morton <akpm@osdl.org>
---

 fs/reiserfs/super.c |   21 ++++++++++++++-------
 1 files changed, 14 insertions(+), 7 deletions(-)

diff -puN fs/reiserfs/super.c~reiserfs-make-resize-option-auto-get-new-device-size fs/reiserfs/super.c
--- 25/fs/reiserfs/super.c~reiserfs-make-resize-option-auto-get-new-device-size	2005-05-01 01:17:45.966868472 -0700
+++ 25-akpm/fs/reiserfs/super.c	2005-05-01 01:28:17.966789880 -0700
@@ -889,12 +889,18 @@ static int reiserfs_parse_options (struc
 	    char * p;
 	    
 	    p = NULL;
-	    /* "resize=NNN" */
-	    *blocks = simple_strtoul (arg, &p, 0);
-	    if (*p != '\0') {
-		/* NNN does not look like a number */
-		reiserfs_warning (s, "reiserfs_parse_options: bad value %s", arg);
-		return 0;
+	    /* "resize=NNN" or "resize=auto" */
+
+	    if (!strcmp(arg, "auto")) {
+		    /* From JFS code, to auto-get the size.*/
+		    *blocks = s->s_bdev->bd_inode->i_size >> s->s_blocksize_bits;
+	    } else {
+		    *blocks = simple_strtoul (arg, &p, 0);
+		    if (*p != '\0') {
+			/* NNN does not look like a number */
+			reiserfs_warning (s, "reiserfs_parse_options: bad value %s", arg);
+			return 0;
+		    }
 	    }
 	}
 
@@ -903,7 +909,8 @@ static int reiserfs_parse_options (struc
 		unsigned long val = simple_strtoul (arg, &p, 0);
 		/* commit=NNN (time in seconds) */
 		if ( *p != '\0' || val >= (unsigned int)-1) {
-			reiserfs_warning (s, "reiserfs_parse_options: bad value %s", arg);			return 0;
+			reiserfs_warning (s, "reiserfs_parse_options: bad value %s", arg);
+			return 0;
 		}
 		*commit_max_age = (unsigned int)val;
 	}
_
