From: Jeff Mahoney <jeffm@suse.com>
Subject: Re: [PATCH] reiserfsprogs: id_map_init off-by-one
Date: Thu, 20 Apr 2006 15:14:32 -0400
Message-ID: <4447DD98.8060505@suse.com>
References: <20060420191040.GA7261@locomotive.unixthugs.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-28513-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20060420191040.GA7261@locomotive.unixthugs.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: ReiserFS List <reiserfs-list@namesys.com>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Jeff Mahoney wrote:
>  The following patch fixes a bug where reiserfsck will crash if OIDs up around
>  the maximum are in use. The problem is that INDEX_COUNT ends up rounding down
>  and the last chunk isn't allocated, causing a segfault.
> 
> --- reiserfsprogs-3.6.19/fsck/uobjectid.c	2004-06-17 15:57:39.000000000 -0400
> +++ reiserfsprogs-3.6.19.devel/fsck/uobjectid.c	2006-04-20 15:05:45.000000000 -0400
> @@ -33,7 +33,7 @@ id_map_t *id_map_init() {
>      __u32 i;
>   
>      map = getmem(sizeof(id_map_t));
> -    map->index = mem_alloc(INDEX_COUNT * sizeof(void *));
> +    map->index = mem_alloc((INDEX_COUNT + 1) * sizeof(void *));
>  
>      for (i = 0; i < INDEX_COUNT; i++) {
>  	if (map->index[i] != (void *)0)

Of course, this fix is wrong. It eliminates the bug, since the memory is
allocated, but it's not properly initialized.

- -Jeff

- --
Jeff Mahoney
SUSE Labs
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.2 (GNU/Linux)
Comment: Using GnuPG with Thunderbird - http://enigmail.mozdev.org

iD8DBQFER92YLPWxlyuTD7IRAkuqAKCaETt3ur8/n2qK1GCKq1FtfJiT0QCfeMRx
NgMpCoJ3Zhj8mvYMqDpDoHI=
=GxSn
-----END PGP SIGNATURE-----
