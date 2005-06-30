From: Hans Reiser <reiser@namesys.com>
Subject: Re: [PATCH] reiser BUG in 2.6.13-rc1
Date: Thu, 30 Jun 2005 10:42:21 -0700
Message-ID: <42C42EFD.8050306@namesys.com>
References: <20050630101157.GI2243@suse.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-24848-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20050630101157.GI2243@suse.de>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jens Axboe <axboe@suse.de>, Edward Shishkin <edward@namesys.com>
Cc: linux-kernel@vger.kernel.org, reiserfs-list@namesys.com, Andrew Morton <akpm@osdl.org>

Jens Axboe wrote:

>Hi,
>
>Reiser is derefencing an uninitialized pointer, causing an oops on boot.
>
>Signed-off-by: Jens Axboe <axboe@suse.de>
>
>diff --git a/fs/reiserfs/super.c b/fs/reiserfs/super.c
>--- a/fs/reiserfs/super.c
>+++ b/fs/reiserfs/super.c
>@@ -1053,10 +1053,9 @@ static void handle_barrier_mode(struct s
> 
> static void handle_attrs( struct super_block *s )
> {
>-	struct reiserfs_super_block * rs;
>+	struct reiserfs_super_block * rs = SB_DISK_SUPER_BLOCK (s);
> 
> 	if( reiserfs_attrs( s ) ) {
>-		rs = SB_DISK_SUPER_BLOCK (s);
> 		if( old_format_only(s) ) {
> 			reiserfs_warning(s, "reiserfs: cannot support attributes on 3.5.x disk format" );
> 			REISERFS_SB(s) -> s_mount_opt &= ~ ( 1 << REISERFS_ATTRS );
>
>  
>
Thanks Jens.

Edward, how is the fedora boot bug finding going? Is this it by any chance?

Hans
