From: Laurent Riffard <laurent.riffard@free.fr>
Subject: Re: 2.6.16-rc6-mm2: reiser4 BUG when unmounting fs
Date: Wed, 22 Mar 2006 19:38:53 +0100
Message-ID: <442199BD.8080005@free.fr>
References: <20060318044056.350a2931.akpm@osdl.org>	 <442061C0.4020702@free.fr>  <44206428.1080005@free.fr> <1143013406.6245.46.camel@tribesman.namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-list-return-28315-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1143013406.6245.46.camel@tribesman.namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: "Vladimir V. Saveliev" <vs@namesys.com>
Cc: Andrew Morton <akpm@osdl.org>, Kernel development list <linux-kernel@vger.kernel.org>, reiserfs-list@namesys.com


Le 22.03.2006 08:43, Vladimir V. Saveliev a écrit :
> Hello
> On Tue, 2006-03-21 at 21:38 +0100, Laurent Riffard wrote:
>>Le 21.03.2006 21:27, Laurent Riffard a écrit :
>>
>>>Le 18.03.2006 13:40, Andrew Morton a écrit :
>>>>ftp://ftp.kernel.org/pub/linux/kernel/people/akpm/patches/2.6/2.6.16-rc6/2.6.16-rc6-mm2/
>>>
>>>Hello, 
>>>
>>>This BUG is 100% reproducible. Simply boot to runlevel 1 and then 
>>>unmount a reiser4 fs:
>>
> 
> The attached patch fixes the problem.

Ok, it works fine now.

Thanks.

> ------------------------------------------------------------------------
> 
>  fs/reiser4/page_cache.c |    4 ----
>  1 files changed, 4 deletions(-)
> 
> diff -puN fs/reiser4/page_cache.c~reiser4-fix-bd_inode fs/reiser4/page_cache.c
> --- linux-2.6.16-rc6-mm2/fs/reiser4/page_cache.c~reiser4-fix-bd_inode	2006-03-21 06:42:42.000000000 +0300
> +++ linux-2.6.16-rc6-mm2-vs/fs/reiser4/page_cache.c	2006-03-21 07:21:54.000000000 +0300
> @@ -198,10 +198,6 @@ init_fake_inode(struct super_block *supe
>  {
>  	assert("nikita-2168", fake->i_state & I_NEW);
>  	fake->i_mapping->a_ops = &formatted_fake_as_ops;
> -	fake->i_blkbits = super->s_blocksize_bits;
> -	fake->i_size = ~0ull;
> -	fake->i_rdev = super->s_bdev->bd_dev;
> -	fake->i_bdev = super->s_bdev;
>  	*pfake = fake;
>  	/* NOTE-NIKITA something else? */
>  	unlock_new_inode(fake);
> 
> _

-- 
laurent
