From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: [patch 2/2]reiser4: remove not used readahead stuff
Date: Fri, 20 Dec 2013 19:49:18 +0100
Message-ID: <52B4912E.7070401@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------020509050301060503050808"
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:user-agent:mime-version:to:subject
         :content-type;
        bh=fbnDnzyD/NPj+6hvcl/V3HJCh3D7m4EH9y0SxUqgFrQ=;
        b=yNw59eEM1XEzi5LIbOHzttrNqUjYE+8uoBO/WivCOAqYStawPnNSLjblXEiW/xO0Kk
         OweVBJX1xR9Z/toJJsck2sLy8QLbjP+nXrkiBzx9UhQoxgkFUhyIn+4muzl+3WR1EPlN
         9Nn2HC9BA+qCBA3/rdEII+qHEtN94Mi551BfAEOSEkpYsmSAPU6cRhVPcu7Z0hh0z/hF
         xZ5wuBylICHtfL6iAAj2nE/RIo1VefKTUtQoQLREf4kInKDWcRgAxGUnhtFiakl26H0R
         R2YrlrNzNWMDoOhOieIEHiBtD6EatsUqP/96XLm/HomXumjkdJPNHFREXM7wJ1ql4rm/
         p0Qg==
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
To: ReiserFS Development mailing list <reiserfs-devel@vger.kernel.org>

This is a multi-part message in MIME format.
--------------020509050301060503050808
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit



--------------020509050301060503050808
Content-Type: text/x-patch;
 name="reiser4-cleanups.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="reiser4-cleanups.patch"

Clean up not used readahead stuff

Signed-off-by: Edward Shishkin <edward.shishkin@gmail.com>
---
 fs/reiser4/fsdata.c    |    1 -
 fs/reiser4/fsdata.h    |    2 --
 fs/reiser4/readahead.h |   10 ----------
 3 files changed, 13 deletions(-)

--- linux-3.12.5.orig/fs/reiser4/fsdata.c
+++ linux-3.12.5/fs/reiser4/fsdata.c
@@ -704,7 +704,6 @@ static reiser4_file_fsdata *create_fsdat
 				  reiser4_ctx_gfp_mask_get());
 	if (fsdata != NULL) {
 		memset(fsdata, 0, sizeof *fsdata);
-		fsdata->ra1.max_window_size = VM_MAX_READAHEAD * 1024;
 		fsdata->back = file;
 		INIT_LIST_HEAD(&fsdata->dir.linkage);
 	}
--- linux-3.12.5.orig/fs/reiser4/fsdata.h
+++ linux-3.12.5/fs/reiser4/fsdata.h
@@ -117,8 +117,6 @@ typedef struct reiser4_file_fsdata {
 	struct {
 		hint_t hint;
 	} reg;
-	struct reiser4_file_ra_state ra1;
-
 } reiser4_file_fsdata;
 
 extern int reiser4_init_file_fsdata(void);
--- linux-3.12.5.orig/fs/reiser4/readahead.h
+++ linux-3.12.5/fs/reiser4/readahead.h
@@ -26,16 +26,6 @@ typedef struct {
 void formatted_readahead(znode * , ra_info_t *);
 void reiser4_init_ra_info(ra_info_t *rai);
 
-struct reiser4_file_ra_state {
-	loff_t start;		/* Current window */
-	loff_t size;
-	loff_t next_size;	/* Next window size */
-	loff_t ahead_start;	/* Ahead window */
-	loff_t ahead_size;
-	loff_t max_window_size;	/* Maximum readahead window */
-	loff_t slow_start;	/* enlarging r/a size algorithm. */
-};
-
 extern void reiser4_readdir_readahead_init(struct inode *dir, tap_t *tap);
 
 /* __READAHEAD_H__ */

--------------020509050301060503050808--
