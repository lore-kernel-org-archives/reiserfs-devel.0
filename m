From: Milan Buska <milan.buska@gmail.com>
Subject: Re: Reiser4
Date: Fri, 17 Dec 2010 20:35:49 +0100
Message-ID: <20101217193549.GA1646@ishi>
References: <20101217162550.GA1864@ishi>
 <4D0BA308.5050602@gmail.com>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <4D0BA308.5050602@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Edward Shishkin <edward.shishkin@gmail.com>
Cc: reiserfs-devel@vger.kernel.org

17. Dec (Friday) v 18:51:04 +0100 2010, edward.shishkin@gmail.com napsal(a):
> Milan Buska wrote:
> >Hi all.
> 
> Hello.
> 
> >I have a few questions.
> >
> >1, fs reiser4 is limited by file size
> 
> file size is limited by MAX_LFS_FILESIZE,
> see definition in ./include/linux/fs.h

Much of it I understand. I'm not a programmer.

#if BITS_PER_LONG==32
#define MAX_LFS_FILESIZE	(((u64)PAGE_CACHE_SIZE << (BITS_PER_LONG-1))-1) 
#elif BITS_PER_LONG==64
#define MAX_LFS_FILESIZE 	0x7fffffffffffffffUL
#endif

I have to learn more

> 
> >2, is there any connection between the reiser4 and SATA disk
> 
> not sure what do you mean..

I think I was still ripe in this forum.

Thanks

-- 
Remember, no question is too stupid and no problem too small
             -- We've all been beginners
