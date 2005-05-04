From: Vladimir Saveliev <vs@namesys.com>
Subject: Re: When Reiser4 will be officially included in the kernel? ...
Date: Wed, 04 May 2005 20:12:40 +0400
Message-ID: <1115223159.4741.58.camel@tribesman.namesys.com>
References: <42727F32.60301@futuretg.com>
	 <1115198582.4456.32.camel@tribesman.namesys.com>
	 <4278C117.7020805@superbug.demon.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-23977-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <4278C117.7020805@superbug.demon.co.uk>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: James Courtier-Dutton <James@superbug.demon.co.uk>
Cc: "Dr. Giovanni A. Orlando" <gorlando@futuretg.com>, Hans Reiser <reiser@namesys.com>, reiserfs-list@namesys.com

Hello

On Wed, 2005-05-04 at 16:33, James Courtier-Dutton wrote:
> Vladimir Saveliev wrote:
> > Hello
> > 
> > On Fri, 2005-04-29 at 22:38, Dr. Giovanni A. Orlando wrote:
> > 
> >>Hi Everyone,
> >>
> >>    Looking on the latest 2.6.11.4, I don't see yet Reiser4 officially 
> >>included between the supported FS.
> >>
> >>    Reiser4 had been released almost one year ago, and ... does not 
> >>belong yet to the kernel?
> >>
> >>    Hans, do you know some date for this?
> >>
> >>    In the past Andrew Morton, did this job, I don't know who (if 
> >>someone) are working on this matter.
> >>
> >>    It is not fundamental, just a simple but important curiosity.
> >>
> > 
> > 
> > We are working to address lkml objections (they objected to core kernel
> > patches reiser4 relays on) and reiser4 stability.
> > When it is done (can not estimate, sorry) - then we will ask for
> > inclusion. 
> > 
> > 
> >>Thanks,
> >>Giovanni.
> >>
> 
> What exactly did they object to? Are their objections easily addressed?
> 

They were on principle against 
ftp://ftp.ru.kernel.org/pub/linux/kernel/people/akpm/patches/2.6/2.6.12-rc3/2.6.12-rc3-mm2/broken-out/reiser4-allow-drop_inode-implementation.patch
ftp://ftp.ru.kernel.org/pub/linux/kernel/people/akpm/patches/2.6/2.6.10-rc3/2.6.10-rc3-mm1/broken-out/reiser4-perthread-pages.patch
ftp://ftp.ru.kernel.org/pub/linux/kernel/people/akpm/patches/2.6/2.6.12-rc3/2.6.12-rc3-mm2/broken-out/reiser4-export-inode_lock.patch

and few older patches.
We are currently trying to eliminate the need in
reiser4-export-inode_lock.patch which is the last of bad patches.

This one seems to be the hardest to get rid of.

> James
> 

