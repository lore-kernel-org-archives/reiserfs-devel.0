From: Russell Coker <russell@coker.com.au>
Subject: Re: How to mount reiserfs with a relocated journal? -- Figured out
Date: Fri, 11 Jul 2003 17:43:21 +1000
Message-ID: <200307111743.21259.russell@coker.com.au>
References: <003701c3477d$33239580$6401a8c0@doug>
Reply-To: Russell Coker <russell@coker.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-14881-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <003701c3477d$33239580$6401a8c0@doug>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Doug Bazarnic <doug@cavecreek.net>
Cc: ReiserFS <reiserfs-list@namesys.com>

I'm replying to the list because I believe that this will interest other 
people and that it is not something you desired to keep secret.  Also if I 
get something wrong then someone will correct me.  ;)

On Fri, 11 Jul 2003 17:22, Doug Bazarnic wrote:
> Are you aware if these cards require drivers under linux?

There is a driver in the stock kernel.  Enable CONFIG_BLK_DEV_UMEM.

> I've just read the literature on the flash cards and they mtbf is
> 1,000,000 hours, not writes.

That sounds reasonably good, although it might be based on "typical usage 
patterns"...

BTW  Did you know that disk life depends on altitude?  If you run a hard drive 
at the top of a mountain or below sea level then that may dramatically 
decrease it's life.  Due to manufacturing issues some drives in a series will 
work better in mountains than others, manufacturers are capable of supplying 
such drives if they feel inclined.  If you get a drive that due to 
manufacturing issues will work best below sea level and run it on a mountain 
you won't expect it to last the MTBF time.

Unless you are doing exactly what the manufacturer thinks a "typical" user 
will do then don't count on getting a MTBF.

> Do you know if having a larger journal slows things down, or speeds
> things up?

If there is no seek time (as is the case with Flash and umem cards) then there 
is no penalty to making it larger AFAIK.  Whether there is any benefit is 
another issue.

For my client I designed a system with a 1G umem card which would be used for 
32M journals for two important file systems and the other 960M was to be used 
for a partition mounted under /var/spool for performance critical data that 
was to be written synchronously.  I judged that 960M of virtually instant 
storage (that did not affect the speed of the other partitions in the RAID 
device in any way) would be of much greater benefit than larger journals.

If you are using a database that has it's own journalling system then maybe 
you could have the database journal on the umem device, which may give better 
performance gains than anything you could do at the FS level.

-- 
http://www.coker.com.au/selinux/   My NSA Security Enhanced Linux packages
http://www.coker.com.au/bonnie++/  Bonnie++ hard drive benchmark
http://www.coker.com.au/postal/    Postal SMTP/POP benchmark
http://www.coker.com.au/~russell/  My home page

