From: Vitaly Fertman <vitaly@namesys.com>
Subject: Re: Large Filesystem Support?
Date: Wed, 16 Mar 2005 12:36:24 +0300
Message-ID: <200503161236.24270.vitaly@namesys.com>
References: <20050313091306.GB4160@naveen-osx.lan> <200503141741.10954.vitaly@namesys.com> <20050316012915.GA29457@naveen.gfunk.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20050316012915.GA29457@naveen.gfunk.org>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Naveen Nathan <naveen@cox.net>
Cc: reiserfs-list@namesys.com

On Wednesday 16 March 2005 04:29, Naveen Nathan wrote:
> Thanks for the patch, however I do not think it's working (yet), and/or
> there is some misconfiguration on our server.
> 
> From both the unpatched and patched versions of libaal and reiser4progs
> 1.0.4.
> 
> 
> checking for _FILE_OFFSET_BITS value needed for large files... no
> checking for _LARGE_FILES value needed for large files... no

the patches change cofigure.in, so you need to run autoconf before 
running confgure.

> I've included a typescript for the compile and install of both
> libaal and the reiser 4 utils. This may help to analyze what
> is going on.

thanks for compilation warnings, a few wrong castings were fixed.

> Also, it may be helpful, but I forgot to mention that the kernel
> also has support for large block devices. I had also tried
> reiser 3.6 and it could only make a 2.8TB partition.
> 
> Regards,
> Naveen Nathan

-- 
Thanks,
Vitaly Fertman
