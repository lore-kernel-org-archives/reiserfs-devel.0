From: Russell Coker <russell@coker.com.au>
Subject: Re: reiserfs on redhat advanced server?
Date: Fri, 31 Jan 2003 16:00:42 +0100
Message-ID: <200301311600.42194.russell@coker.com.au>
References: <20030130173522.3aa4d0e1.pegasus@nerv.eu.org> <1044021310.15684.154.camel@tiny.suse.com> <3E3A8515.5010701@namesys.com>
Reply-To: Russell Coker <russell@coker.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-12592-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <3E3A8515.5010701@namesys.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Hans Reiser <reiser@namesys.com>
Cc: ReiserFS <reiserfs-list@namesys.com>

On Fri, 31 Jan 2003 15:15, Hans Reiser wrote:
> >The fact that nobody actually ships a vanilla kernel should make it
> >pretty clear the stock releases are not ready for the tasks our
> >customers need them for.
>
> This is not clear to me at all.

I agree.  I have fairly vanilla 2.4.20 kernels running high performance mail 
servers and other tasks on ReiserFS.  The only patches I have are LSM and a 
patch one of the ReiserFS developers pointed me to for performance.

The ReiserFS patch made a significant performance difference which is required 
for my use (the servers would not be able to function properly under peak 
load without it).  However with the possible exception of SUSE no 
distribution supports it.

The only thing I am missing which is in a distro kernel is the aa1 fix for the 
kswapd issue we discussed here (and I decided that it's not enough of a 
problem at the moment to justify replacing kernels on such important machines 
with kernels that have a 300,000 line patch).

> >The fact that our customers pay us to add
> >patches instead of using the stock kernel for free is also important.
>
> There is a difference between using a distro kernel because it has some
> missing feature (desiring untested by the masses features is
> reasonable), and using it because it is more stable (thinking features
> untested by the masses for 6 weeks are stable is unreasonable).

I am more likely to use the aa1 patch because of SUSE shipping it.  The fact 
that the SUSE customers are not complaining suggests that it's good.

Also a problem I have is that I am often forced to upgrade sooner than the 
distro's support.  By the time a distro supports a new kernel then I've 
usually already put it through such a burn-in that having the distro-tested 
one provides little extra benefit.

-- 
http://www.coker.com.au/selinux/   My NSA Security Enhanced Linux packages
http://www.coker.com.au/bonnie++/  Bonnie++ hard drive benchmark
http://www.coker.com.au/postal/    Postal SMTP/POP benchmark
http://www.coker.com.au/~russell/  My home page

