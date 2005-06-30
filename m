From: Jens Axboe <axboe@suse.de>
Subject: [PATCH] reiser BUG in 2.6.13-rc1
Date: Thu, 30 Jun 2005 12:11:59 +0200
Message-ID: <20050630101157.GI2243@suse.de>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-24834-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org, reiserfs-list@namesys.com

Hi,

Reiser is derefencing an uninitialized pointer, causing an oops on boot.

Signed-off-by: Jens Axboe <axboe@suse.de>

diff --git a/fs/reiserfs/super.c b/fs/reiserfs/super.c
--- a/fs/reiserfs/super.c
+++ b/fs/reiserfs/super.c
@@ -1053,10 +1053,9 @@ static void handle_barrier_mode(struct s
 
 static void handle_attrs( struct super_block *s )
 {
-	struct reiserfs_super_block * rs;
+	struct reiserfs_super_block * rs = SB_DISK_SUPER_BLOCK (s);
 
 	if( reiserfs_attrs( s ) ) {
-		rs = SB_DISK_SUPER_BLOCK (s);
 		if( old_format_only(s) ) {
 			reiserfs_warning(s, "reiserfs: cannot support attributes on 3.5.x disk format" );
 			REISERFS_SB(s) -> s_mount_opt &= ~ ( 1 << REISERFS_ATTRS );

-- 
Jens Axboe

