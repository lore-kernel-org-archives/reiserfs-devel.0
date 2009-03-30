From: Jeff Mahoney <jeffm@suse.com>
Subject: [patch 09/35 error-handling] reiserfs: add locking around error buffer
Date: Mon, 30 Mar 2009 14:02:24 -0400
Message-ID: <20090330181010.432220021@suse.com>
References: <20090330180215.951354436@suse.com>
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Content-Disposition: inline; filename=patches.fixes/reiserfs-error-buffer-locking
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, Linus Torvalds <torvalds@linux-foundation.org>, ReiserFS Development List <reiserfs-devel@vger.kernel.org>

 The formatting of the error buffer is race prone. It uses static buffers
 for both formatting and output. While overwriting the error buffer
 can product garbled output, overwriting the format buffer with incompatible
 % directives can cause crashes.

Signed-off-by: Jeff Mahoney <jeffm@suse.com>
---
 fs/reiserfs/prints.c |    5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

--- a/fs/reiserfs/prints.c
+++ b/fs/reiserfs/prints.c
@@ -184,7 +184,7 @@ static char *is_there_reiserfs_struct(ch
    printk ("bad key %lu %lu %lu %lu", key->k_dir_id, key->k_objectid, 
            key->k_offset, key->k_uniqueness); 
 */
-
+static DEFINE_SPINLOCK(error_lock);
 static void prepare_error_buf(const char *fmt, va_list args)
 {
 	char *fmt1 = fmt_buf;
@@ -192,6 +192,8 @@ static void prepare_error_buf(const char
 	char *p = error_buf;
 	int what;
 
+	spin_lock(&error_lock);
+
 	strcpy(fmt1, fmt);
 
 	while ((k = is_there_reiserfs_struct(fmt1, &what)) != NULL) {
@@ -237,6 +239,7 @@ static void prepare_error_buf(const char
 		fmt1 = k + 2;
 	}
 	vsprintf(p, fmt1, args);
+	spin_unlock(&error_lock);
 
 }
 


