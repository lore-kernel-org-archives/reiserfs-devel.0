From: Russell Coker <russell@coker.com.au>
Subject: Re: reiserfs on redhat advanced server?
Date: Fri, 31 Jan 2003 17:21:36 +0100
Message-ID: <200301311721.36389.russell@coker.com.au>
References: <20030130173522.3aa4d0e1.pegasus@nerv.eu.org> <200301311600.42194.russell@coker.com.au> <1044026534.15685.220.camel@tiny.suse.com>
Reply-To: Russell Coker <russell@coker.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-12598-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1044026534.15685.220.camel@tiny.suse.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Chris Mason <mason@suse.com>
Cc: ReiserFS <reiserfs-list@namesys.com>

On Fri, 31 Jan 2003 16:22, Chris Mason wrote:
> > I agree.  I have fairly vanilla 2.4.20 kernels running high performance
> > mail servers and other tasks on ReiserFS.  The only patches I have are
> > LSM and a patch one of the ReiserFS developers pointed me to for
> > performance.
>
> A highly qualified admin can go out and find the small number of patches
> their configuration really needs, and this will always be smaller than
> the list of patches a distro includes (BTW, I thought you also needed
> block-highmem?)

I could do with a patch for kswapd, that's all I really need.  But that isn't 
a major issue as performance dies before kswapd becomes an issue anyway.

> Most people don't have the time or energy to manage that however.

True.  However it must be a PITA for them if they are using SUSE for example 
but the RH kernel has the patches they need...

-- 
http://www.coker.com.au/selinux/   My NSA Security Enhanced Linux packages
http://www.coker.com.au/bonnie++/  Bonnie++ hard drive benchmark
http://www.coker.com.au/postal/    Postal SMTP/POP benchmark
http://www.coker.com.au/~russell/  My home page

