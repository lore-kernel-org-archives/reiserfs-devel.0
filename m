From: Russell Coker <russell@coker.com.au>
Subject: Re: 2.4.20 at kernel.org and data logging
Date: Sun, 19 Jan 2003 11:45:24 +0100
Message-ID: <200301191145.24503.russell@coker.com.au>
References: <0E18D85A21D2874080456C3B8A12E83E01009FAD@cof110avexu4.global.avaya.com> <200301181125.16752.russell@coker.com.au> <1042905430.31095.2343.camel@tiny.suse.com>
Reply-To: Russell Coker <russell@coker.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-12439-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1042905430.31095.2343.camel@tiny.suse.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Chris Mason <mason@suse.com>
Cc: "Sewell, Cassandra D  (Cassandra)" <csewell@avaya.com>, reiserfs-list@namesys.com

On Sat, 18 Jan 2003 16:57, Chris Mason wrote:
> > I found the benefit to be much smaller than I had hoped.  The patches in
> > question have a number of other performance improvements which made a
> > huge and noticable difference.  data=journal seemed to make a small
> > difference, but nothing exciting.
>
> The benefit from data=journal varies largely by the size of the files in
> use.  But Russell, you might be hitting other bottlenecks having to do
> with reading the directory items off disk (that many directories means
> lots of inode).

The kswapd issue is part of it.  I am considering the aa kernels...

> Also, we should probably try switching you to a highmem io enabled
> kernel, I'm almost done with a patch to put the 2.4.21 data logging code
> in the -aa kernel.

I have the following enabled already, is this what you refer to or is it 
something else?

HIGHMEM I/O support
CONFIG_HIGHIO
  If you want to be able to do I/O to high memory pages, say Y.
  Otherwise low memory pages are used as bounce buffers causing a
  degrade in performance.

-- 
http://www.coker.com.au/selinux/   My NSA Security Enhanced Linux packages
http://www.coker.com.au/bonnie++/  Bonnie++ hard drive benchmark
http://www.coker.com.au/postal/    Postal SMTP/POP benchmark
http://www.coker.com.au/~russell/  My home page

