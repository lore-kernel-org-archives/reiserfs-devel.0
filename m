From: Jeff Mahoney <jeffm@suse.com>
Subject: [PATCH] resize_reiserfs may use invalid bitmap blocks
Date: Mon, 19 Apr 2004 15:06:59 -0400
Message-ID: <40842353.9090409@suse.com>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------000802010603090805070303"
Return-path: <reiserfs-list-return-18062-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
To: ReiserFS Mailing List <reiserfs-list@namesys.com>

--------------000802010603090805070303
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1


Another problem in reiserfs_resize:

This time it's the writing of the new bitmaps. It writes them outside of
~ journal control, which is fine. It does it synchronously, and if the
transaction following it doesn't complete, then the new bitmaps aren't
used anyway.

However, it doesn't check to see if the writing of the new bitmap blocks
succeeded, so the bitmaps may contain invalid data later on.

Attached is a patch that checks the error status of the bitmap block and
returns -EIO as appropriate.

- -Jeff

- --
Jeff Mahoney
SuSE Labs
jeffm@suse.com
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.2 (GNU/Linux)
Comment: Using GnuPG with Thunderbird - http://enigmail.mozdev.org

iD8DBQFAhCNSLPWxlyuTD7IRAjA9AKCkdFGco8nKraGP11pY7Ya0aMkA2wCeNSou
/A+i7SeSTDRzfeM6V36h1xc=
=9ZE9
-----END PGP SIGNATURE-----

--------------000802010603090805070303
Content-Type: text/plain;
 name="reiserfs-resize-3.diff"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="reiserfs-resize-3.diff"

diff -u linux-2.6.5.kgdb/fs/reiserfs/resize.c linux-2.6.5.kgdb.afs/fs/reiserfs/resize.c
--- linux-2.6.5.kgdb/fs/reiserfs/resize.c	2004-04-03 22:36:55.000000000 -0500
+++ linux-2.6.5.kgdb.afs/fs/reiserfs/resize.c	2004-04-19 15:01:44.923208976 -0400
 -113,6 +117,11 @@
 	    memset (bitmap, 0, sizeof (struct reiserfs_bitmap_info) * SB_BMAP_NR(s));
 	    for (i = 0; i < bmap_nr; i++)
 		bitmap[i] = SB_AP_BITMAP(s)[i];
+
+	    /* This doesn't go through the journal, but it doesn't have to.
+	     * The changes are still atomic: We're synced up when the journal
+	     * transaction begins, and the new bitmaps don't matter if the
+	     * transaction fails. */
 	    for (i = bmap_nr; i < bmap_nr_new; i++) {
 		bitmap[i].bh = sb_getblk(s, i * s->s_blocksize * 8);
 		memset(bitmap[i].bh->b_data, 0, sb_blocksize(sb));
@@ -121,6 +130,10 @@
 		set_buffer_uptodate(bitmap[i].bh);
 		mark_buffer_dirty(bitmap[i].bh) ;
 		sync_dirty_buffer(bitmap[i].bh);
+		if (!buffer_uptodate (bitmap[i].bh)) {
+		    vfree (bitmap);
+		    return -EIO;
+		}
 		// update bitmap_info stuff
 		bitmap[i].first_zero_hint=1;
 		bitmap[i].free_count = sb_blocksize(sb) * 8 - 1;

--------------000802010603090805070303--
