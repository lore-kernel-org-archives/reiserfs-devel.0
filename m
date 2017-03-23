From: Jan Kara <jack@suse.cz>
Subject: Re: [PATCH] reiserfs: avoid a -Wmaybe-uninitialized warning
Date: Thu, 23 Mar 2017 19:25:51 +0100
Message-ID: <20170323182551.GA32502@quack2.suse.cz>
References: <20170323150627.347589-1-arnd@arndb.de>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="KsGdsel6WgEHnImy"
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170323150627.347589-1-arnd@arndb.de>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Andrew Morton <akpm@linux-foundation.org>, Jan Kara <jack@suse.cz>, reiserfs-devel@vger.kernel.org, linux-kernel@vger.kernel.org


--KsGdsel6WgEHnImy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu 23-03-17 16:06:13, Arnd Bergmann wrote:
> The latest gcc-7.0.1 snapshot warns about an unintialized variable use:
> 
> In file included from fs/reiserfs/lbalance.c:8:0:
> fs/reiserfs/lbalance.c: In function 'leaf_item_bottle.isra.3':
> fs/reiserfs/reiserfs.h:1279:13: error: '*((void *)&n_ih+8).v' may be used uninitialized in this function [-Werror=maybe-uninitialized]
>   v2->v = (v2->v & cpu_to_le64(15ULL << 60)) | cpu_to_le64(offset);
>            ~~^~~
> fs/reiserfs/reiserfs.h:1279:13: error: '*((void *)&n_ih+8).v' may be used uninitialized in this function [-Werror=maybe-uninitialized]
>   v2->v = (v2->v & cpu_to_le64(15ULL << 60)) | cpu_to_le64(offset);
> 
> This happens because the offset/type pair that is stored in
> ih.key.u.k_offset_v2 is actually uninitialized when we call
> set_le_ih_k_offset() and set_le_ih_k_type(). After we have called both,
> all data is correct, but the first of the two reads uninitialized data
> for the type field and writes it back before it gets overwritten.
> 
> This works around the warning by initializing the k_offset_v2 through
> the slightly larger memcpy().
> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Thanks. I've queued up slightly updated patch (attached).

								Honza

> ---
>  fs/reiserfs/lbalance.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/fs/reiserfs/lbalance.c b/fs/reiserfs/lbalance.c
> index 249594a821e0..8eed8f5f6881 100644
> --- a/fs/reiserfs/lbalance.c
> +++ b/fs/reiserfs/lbalance.c
> @@ -475,7 +475,7 @@ static void leaf_item_bottle(struct buffer_info *dest_bi,
>  			 * 'cpy_bytes'; create new item header;
>  			 * n_ih = new item_header;
>  			 */
> -			memcpy(&n_ih, ih, SHORT_KEY_SIZE);
> +			memcpy(&n_ih, ih, KEY_SIZE);
>  
>  			/* Endian safe, both le */
>  			n_ih.ih_version = ih->ih_version;
> -- 
> 2.9.0
> 
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR

--KsGdsel6WgEHnImy
Content-Type: text/x-patch; charset=us-ascii
Content-Disposition: attachment; filename="0001-reiserfs-avoid-a-Wmaybe-uninitialized-warning.patch"

From ab4949640d6674b617b314ad3c2c00353304bab9 Mon Sep 17 00:00:00 2001
From: Arnd Bergmann <arnd@arndb.de>
Date: Thu, 23 Mar 2017 16:06:13 +0100
Subject: [PATCH] reiserfs: avoid a -Wmaybe-uninitialized warning

The latest gcc-7.0.1 snapshot warns about an unintialized variable use:

In file included from fs/reiserfs/lbalance.c:8:0:
fs/reiserfs/lbalance.c: In function 'leaf_item_bottle.isra.3':
fs/reiserfs/reiserfs.h:1279:13: error: '*((void *)&n_ih+8).v' may be used uninitialized in this function [-Werror=maybe-uninitialized]
  v2->v = (v2->v & cpu_to_le64(15ULL << 60)) | cpu_to_le64(offset);
           ~~^~~
fs/reiserfs/reiserfs.h:1279:13: error: '*((void *)&n_ih+8).v' may be used uninitialized in this function [-Werror=maybe-uninitialized]
  v2->v = (v2->v & cpu_to_le64(15ULL << 60)) | cpu_to_le64(offset);

This happens because the offset/type pair that is stored in
ih.key.u.k_offset_v2 is actually uninitialized when we call
set_le_ih_k_offset() and set_le_ih_k_type(). After we have called both,
all data is correct, but the first of the two reads uninitialized data
for the type field and writes it back before it gets overwritten.

This works around the warning by initializing the k_offset_v2 through
the slightly larger memcpy().

[JK: Remove now unused define and make it obvious we initialize the key]

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
Signed-off-by: Jan Kara <jack@suse.cz>
---
 fs/reiserfs/lbalance.c | 2 +-
 fs/reiserfs/reiserfs.h | 1 -
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/fs/reiserfs/lbalance.c b/fs/reiserfs/lbalance.c
index 249594a821e0..f5cebd70d903 100644
--- a/fs/reiserfs/lbalance.c
+++ b/fs/reiserfs/lbalance.c
@@ -475,7 +475,7 @@ static void leaf_item_bottle(struct buffer_info *dest_bi,
 			 * 'cpy_bytes'; create new item header;
 			 * n_ih = new item_header;
 			 */
-			memcpy(&n_ih, ih, SHORT_KEY_SIZE);
+			memcpy(&n_ih.ih_key, &ih->ih_key, KEY_SIZE);
 
 			/* Endian safe, both le */
 			n_ih.ih_version = ih->ih_version;
diff --git a/fs/reiserfs/reiserfs.h b/fs/reiserfs/reiserfs.h
index 2adcde137c3f..5dcf3ab83886 100644
--- a/fs/reiserfs/reiserfs.h
+++ b/fs/reiserfs/reiserfs.h
@@ -1326,7 +1326,6 @@ struct cpu_key {
 #define KEY_NOT_FOUND 0
 
 #define KEY_SIZE (sizeof(struct reiserfs_key))
-#define SHORT_KEY_SIZE (sizeof (__u32) + sizeof (__u32))
 
 /* return values for search_by_key and clones */
 #define ITEM_FOUND 1
-- 
2.10.2


--KsGdsel6WgEHnImy--
