From: Jeff Mahoney <jeffm@suse.com>
Subject: [PATCH] Another reiserfs_resize fix (unlock_super called incorrectly)
Date: Mon, 19 Apr 2004 14:48:38 -0400
Message-ID: <40841F06.6020606@suse.com>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------060508000206020300010409"
Return-path: <reiserfs-list-return-18061-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
To: ReiserFS Mailing List <reiserfs-list@namesys.com>

--------------060508000206020300010409
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1


Here's another fix for reiserfs_resize().

If reiserfs_allocate_list_bitmaps() fails, it calls unlock_super on the
sb. This is incorrect, as it didn't lock it initially. do_remount_sb
calls lock_super and unlock_super surrounding the ->remount_fs call,
regardless of error.

The attach patch removes the unlock_super call.

- -Jeff

- --
Jeff Mahoney
SuSE Labs
jeffm@suse.com
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.2 (GNU/Linux)
Comment: Using GnuPG with Thunderbird - http://enigmail.mozdev.org

iD8DBQFAhB8GLPWxlyuTD7IRAq/hAJ9AKMIo26EnvGyjHmaEBh1TaPsnsACfVYvf
PY4TWrNLusOt6WWPjCWjPrs=
=Uc5g
-----END PGP SIGNATURE-----

--------------060508000206020300010409
Content-Type: text/plain;
 name="reiserfs-resize-2.diff"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="reiserfs-resize-2.diff"

diff -rup linux-2.6.5.kgdb/fs/reiserfs/resize.c linux-2.6.5.kgdb.afs/fs/reiserfs/resize.c
--- linux-2.6.5.kgdb/fs/reiserfs/resize.c	2004-04-19 10:28:53.692014416 -0400
+++ linux-2.6.5.kgdb.afs/fs/reiserfs/resize.c	2004-04-19 14:43:05.148440616 -0400
@@ -82,7 +82,6 @@
 	    /* reallocate journal bitmaps */
 	    if (reiserfs_allocate_list_bitmaps(s, jbitmap, bmap_nr_new) < 0) {
 		printk("reiserfs_resize: unable to allocate memory for journal bitmaps\n");
-		unlock_super(s) ;
 		return -ENOMEM ;
 	    }
 	    /* the new journal bitmaps are zero filled, now we copy in the bitmap

--------------060508000206020300010409--
