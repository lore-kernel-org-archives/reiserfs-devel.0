From: "Vladimir V. Saveliev" <vs@namesys.com>
Subject: Re: [reiser4] reiser4 panicked cowardly: zam-397
Date: Mon, 15 May 2006 17:16:23 +0400
Message-ID: <1147698983.6956.10.camel@tribesman.namesys.com>
References: <44663B84.6070401@free.fr>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="=-kpOqMllI1FB3XziZuI3+"
Return-path: <reiserfs-list-return-28616-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <44663B84.6070401@free.fr>
List-Id: <reiserfs-devel.vger.kernel.org>
To: Laurent Riffard <laurent.riffard@free.fr>
Cc: reiserfs-list@namesys.com

--=-kpOqMllI1FB3XziZuI3+
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

hello

On Sat, 2006-05-13 at 22:03 +0200, Laurent Riffard wrote:
> Hello,
> 
> I've been hit by a couple of reiser4 panic due to zam-397 assertion. 
> It's more or less reproducible. How can I help debug this ? 

This looks like known bug in debugging code.
Please try to reproduce the problem with the attached patch.

> ~~
> laurent
> 

--=-kpOqMllI1FB3XziZuI3+
Content-Disposition: attachment; filename=reiser4-fix-block-alloc-assertions.patch
Content-Type: text/x-patch; name=reiser4-fix-block-alloc-assertions.patch; charset=utf-8
Content-Transfer-Encoding: 7bit

 fs/reiser4/plugin/space/bitmap.c |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff -puN fs/reiser4/plugin/space/bitmap.c~reiser4-fix-block-alloc-assertions fs/reiser4/plugin/space/bitmap.c
--- linux-2.6.17-rc3-mm1/fs/reiser4/plugin/space/bitmap.c~reiser4-fix-block-alloc-assertions	2006-05-15 13:45:57.000000000 +0400
+++ linux-2.6.17-rc3-mm1-vs/fs/reiser4/plugin/space/bitmap.c	2006-05-15 13:51:30.000000000 +0400
@@ -1113,7 +1113,7 @@ alloc_blocks_forward(reiser4_blocknr_hin
 
 	assert("zam-398", super != NULL);
 	assert("zam-412", hint != NULL);
-	assert("zam-397", hint->blk < reiser4_block_count(super));
+	assert("zam-397", hint->blk <= reiser4_block_count(super));
 
 	if (hint->max_dist == 0)
 		search_end = reiser4_block_count(super);
@@ -1160,7 +1160,7 @@ static int alloc_blocks_backward(reiser4
 
 	assert("zam-969", super != NULL);
 	assert("zam-970", hint != NULL);
-	assert("zam-971", hint->blk < reiser4_block_count(super));
+	assert("zam-971", hint->blk <= reiser4_block_count(super));
 
 	search_start = hint->blk;
 	if (hint->max_dist == 0 || search_start <= hint->max_dist)

_

--=-kpOqMllI1FB3XziZuI3+--

