From: Christian Mayrhuber <christian.mayrhuber@gmx.net>
Subject: Re: reiserfs logging patches udpated
Date: Wed, 24 Mar 2004 20:08:47 +0100
Message-ID: <200403242008.47533.christian.mayrhuber@gmx.net>
References: <1080149399.14737.77.camel@watt.suse.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-17437-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1080149399.14737.77.camel@watt.suse.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

On Wednesday 24 March 2004 18:29, Chris Mason wrote:
> Hello everyone,
>
> ftp.suse.com/pub/people/mason/patches/data-logging/experimental/2.6.5-rc2-m
>m2
>
> Has a new set of reiserfs patches.  These should also work on 2.6.5-rc2,
> but I did testing on top of -mm2 because I'm submitting part of the
> patch set to Andrew.
>
> New since the 2.6.4 code:
>
> - add reiserfs laptop mode support
> - removed patches that made it into mainline
> - fixed buffer refcount problem in reiserfs-writepage-ordered-race when
> block size < page size
> - fix buffer head leak in my invalidatepage func
> - fix bogus warning message about locked buffers during logging
>
> The series file has the list of the patches in the order they should be
> applied.
>
> Andrew, this subset is ready for testing -mm.  It's everything except
> the xattr and ACLs, I'm still trying to convince Hans those should go
> in.

What about marking them experimental in kconfig and disable them by default?
The switches are already in Jeff's patches.
Somebody keen on rock solidness should not enable them, while others could use 
them though.

-- 
lg, Chris

