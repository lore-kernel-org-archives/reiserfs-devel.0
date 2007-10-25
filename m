From: Dushan Tcholich <dusanc@gmail.com>
Subject: [PATCH 52/8] status_flags.c cleanup
Date: Thu, 25 Oct 2007 17:04:43 +0200
Message-ID: <1193324683.15901.69.camel@krshina3.gekom>
Reply-To: dusanc@gmail.com
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="=-uMqqiL32C1EvD0qjd4mL"
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
To: reiser4 <reiserfs-devel@vger.kernel.org>, Edward Shishkin <edward@namesys.com>


--=-uMqqiL32C1EvD0qjd4mL
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

orig:	total: 6 errors, 8 warnings, 175 lines checked
patched:total: 0 errors, 2 warnings, 179 lines checked
leftovers:

WARNING: line over 80 characters
#128: FILE: status_flags.c:128:
+               *extended =
le64_to_cpu(get_unaligned(&statuspage->extended_status));

WARNING: line over 80 characters
#149: FILE: status_flags.c:149:
+       put_unaligned(cpu_to_le64(extended_status),
&statuspage->extended_status);



--=-uMqqiL32C1EvD0qjd4mL
Content-Disposition: attachment; filename=status_flags.c.patch
Content-Type: text/x-patch; name=status_flags.c.patch; charset=UTF-8
Content-Transfer-Encoding: 7bit

Signed-off-by: Dushan Tcholich <dusanc@gmail.com>
--- status_flags.c.orig	2007-10-25 16:58:35.000000000 +0200
+++ status_flags.c	2007-10-25 17:03:07.000000000 +0200
@@ -1,7 +1,8 @@
 /* Copyright 2001, 2002, 2003 by Hans Reiser, licensing governed by
  * reiser4/README */
 
-/* Functions that deal with reiser4 status block, query status and update it, if needed */
+/* Functions that deal with reiser4 status block, query status and update it,
+ * if needed */
 
 #include <linux/bio.h>
 #include <linux/highmem.h>
@@ -12,8 +13,8 @@
 #include "status_flags.h"
 #include "super.h"
 
-/* This is our end I/O handler that marks page uptodate if IO was successful. It also
-   unconditionally unlocks the page, so we can see that io was done.
+/* This is our end I/O handler that marks page uptodate if IO was successful.
+   It also unconditionally unlocks the page, so we can see that io was done.
    We do not free bio, because we hope to reuse that. */
 static int reiser4_status_endio(struct bio *bio, unsigned int bytes_done,
 				int err)
@@ -92,18 +93,19 @@ int reiser4_status_init(reiser4_block_nr
 /* Query the status of fs. Returns if the FS can be safely mounted.
    Also if "status" and "extended" parameters are given, it will fill
    actual parts of status from disk there. */
-int reiser4_status_query(u64 * status, u64 * extended)
+int reiser4_status_query(u64 *status, u64 *extended)
 {
 	struct super_block *sb = reiser4_get_current_sb();
 	struct reiser4_status *statuspage;
 	int retval;
 
-	if (!get_super_private(sb)->status_page) {	// No status page?
+	if (!get_super_private(sb)->status_page) {	/* No status page? */
 		return REISER4_STATUS_MOUNT_UNKNOWN;
 	}
 	statuspage = (struct reiser4_status *)
 	    kmap_atomic(get_super_private(sb)->status_page, KM_USER0);
-	switch ((long)le64_to_cpu(get_unaligned(&statuspage->status))) {	// FIXME: this cast is a hack for 32 bit arches to work.
+	switch ((long)le64_to_cpu(get_unaligned(&statuspage->status))) {
+	/* FIXME: this cast is a hack for 32 bit arches to work. */
 	case REISER4_STATUS_OK:
 		retval = REISER4_STATUS_MOUNT_OK;
 		break;
@@ -129,15 +131,15 @@ int reiser4_status_query(u64 * status, u
 	return retval;
 }
 
-/* This function should be called when something bad happens (e.g. from reiser4_panic).
-   It fills the status structure and tries to push it to disk. */
+/* This function should be called when something bad happens (e.g. from
+   reiser4_panic). It fills the status structure and tries to push it to disk.*/
 int reiser4_status_write(__u64 status, __u64 extended_status, char *message)
 {
 	struct super_block *sb = reiser4_get_current_sb();
 	struct reiser4_status *statuspage;
 	struct bio *bio = get_super_private(sb)->status_bio;
 
-	if (!get_super_private(sb)->status_page) {	// No status page?
+	if (!get_super_private(sb)->status_page) {	/* No status page? */
 		return -1;
 	}
 	statuspage = (struct reiser4_status *)
@@ -155,14 +157,16 @@ int reiser4_status_write(__u64 status, _
 	bio->bi_vcnt = 1;
 	bio->bi_size = sb->s_blocksize;
 	bio->bi_end_io = reiser4_status_endio;
-	lock_page(get_super_private(sb)->status_page);	// Safe as nobody should touch our page.
+	lock_page(get_super_private(sb)->status_page);	/* Safe as nobody should
+							 * touch our page.
 	/* We can block now, but we have no other choice anyway */
 	submit_bio(WRITE, bio);
 	blk_run_address_space(reiser4_get_super_fake(sb)->i_mapping);
-	return 0;		// We do not wait for io to finish.
+	return 0;		/* We do not wait for io to finish. */
 }
 
-/* Frees the page with status and bio structure. Should be called by disk format at umount time */
+/* Frees the page with status and bio structure. Should be called by disk format
+ * at umount time */
 int reiser4_status_finish(void)
 {
 	struct super_block *sb = reiser4_get_current_sb();

--=-uMqqiL32C1EvD0qjd4mL--

