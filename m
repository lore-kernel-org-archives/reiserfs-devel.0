From: Jan Kara <jack@suse.cz>
Subject: [PATCH] Fix return value in reiserfs allocator
Date: Mon, 7 Nov 2005 15:36:43 +0100
Message-ID: <20051107143643.GM4143@atrey.karlin.mff.cuni.cz>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="ftEhullJWpWg/VHq"
Return-path: <reiserfs-list-return-26797-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
To: reiserfs-list@namesys.com
Cc: akpm@osdl.org

--ftEhullJWpWg/VHq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

  Hello,

  the attached patch makes reiserfs correctly return EDQUOT when the
allocation failed due to quotas (so far we just returned ENOSPC).
Please apply.

								Honza

--ftEhullJWpWg/VHq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="reiser-2.6.14-rc5-1-reiser_error_return.diff"

Return correct error code if allocation failed.

Signed-off-by: Jan Kara <jack@suse.cz>

diff -rupX /home/jack/.kerndiffexclude linux-2.6.14-rc5/fs/reiserfs/file.c linux-2.6.14-rc5-1-reiser_error_return/fs/reiserfs/file.c
--- linux-2.6.14-rc5/fs/reiserfs/file.c	2005-10-25 08:53:25.000000000 +0200
+++ linux-2.6.14-rc5-1-reiser_error_return/fs/reiserfs/file.c	2005-11-07 08:29:38.000000000 +0100
@@ -251,12 +251,12 @@ static int reiserfs_allocate_blocks_for_
 						       blocks_to_allocate,
 						       blocks_to_allocate);
 			if (res != CARRY_ON) {
-				res = -ENOSPC;
+				res = res == QUOTA_EXCEEDED ? -EDQUOT : -ENOSPC;
 				pathrelse(&path);
 				goto error_exit;
 			}
 		} else {
-			res = -ENOSPC;
+			res = res == QUOTA_EXCEEDED ? -EDQUOT : -ENOSPC;
 			pathrelse(&path);
 			goto error_exit;
 		}

--ftEhullJWpWg/VHq--
