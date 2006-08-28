From: Alexander Zarochentsev <zam@namesys.com>
Subject: Re: Possible bug with FIBMAP
Date: Mon, 28 Aug 2006 12:33:47 +0400
Message-ID: <200608281233.48338.zam@namesys.com>
References: <200608271057.12684.un_brice@vleu.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-29707-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200608271057.12684.un_brice@vleu.net>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com
Cc: Brice Arnould <un_brice@vleu.net>

On 27 August 2006 12:57, Brice Arnould wrote:
> Hi
>
> Two users of a hack I wrote told me that
> http://vleu.net/shake/fb_r4.c (also attached with the mail)
> returned "FIBMAP=-22, FIGETBSZ=4096"
> on some of their files on reiser4 filesystems.
>
> Does this value of "-22" have a special meaning (would be strange),
> or is it a bug in Reiser4 ?
> I can ask them for more details, if you want.

Reiser4: restore FIBMAP ioctl support for packed files

restore FIBMAP ioctl support for packed files,
don't report block numbers for not yet mapped to
disk nodes.

Signed-off-by: Alexander Zarochentsev <zam@namesys.com>
---
 fs/reiser4/plugin/item/item.c |    2 +-
 fs/reiser4/plugin/item/tail.c |    2 ++
 2 files changed, 3 insertions(+), 1 deletion(-)

--- linux-2.6-git.orig/fs/reiser4/plugin/item/item.c
+++ linux-2.6-git/fs/reiser4/plugin/item/item.c
@@ -614,7 +614,7 @@ item_plugin item_plugins[LAST_ITEM_ID] =
 				.write = reiser4_write_tail,
 				.read = reiser4_read_tail,
 				.readpage = readpage_tail,
-				.get_block = NULL,
+				.get_block = get_block_address_tail,
 				.append_key = append_key_tail,
 				.init_coord_extension =
 				init_coord_extension_tail
--- linux-2.6-git.orig/fs/reiser4/plugin/item/tail.c
+++ linux-2.6-git/fs/reiser4/plugin/item/tail.c
@@ -791,6 +791,8 @@ get_block_address_tail(const coord_t * c
 	assert("nikita-3252", znode_get_level(coord->node) == LEAF_LEVEL);
 
 	*block = *znode_get_block(coord->node);
+	if (reiser4_blocknr_is_fake(block))
+		*block = 0;
 	return 0;
 }
 

