From: Christian Mayrhuber <christian.mayrhuber@gmx.net>
Subject: Re: kernel 2.4.27 reiserfs quotas patch
Date: Mon, 23 Aug 2004 17:31:52 +0200
Message-ID: <200408231731.52174.christian.mayrhuber@gmx.net>
References: <cgd0l9$6o0$1@sea.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-20461-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <cgd0l9$6o0$1@sea.gmane.org>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jeff Meyer <jeffm@andersonlabs.com>, reiserfs-list@namesys.com

On Monday 23 August 2004 16:54, Jeff Meyer wrote:
> Does anyone know where I could find or even if they exist the patches to
> use reiserfs with quotas for the 2.4.27 kernel?  I currently am using
> reiserfs with quotas on kernel 2.4.26 utilizing the patches for kernel
> 2.4.25.
>
>
> Thanks,
>
> Jeff

You can use Chris Masons patches from 2.4.25. These include quotas.
ftp://ftp.suse.com/pub/people/mason/patches/data-logging/2.4.25/

These currently have a fsync() bug (the same holds true for 2.6.7+)
which does not lead to data loss.
Chris Mason wrote he is preparing fixes for both 2.4.x and 2.6.x.

-- 
lg, Chris
