From: Russell Coker <bofh@coker.com.au>
Subject: Re: Reiserfs with Samba vs NetApp Filer
Date: Sat, 12 Oct 2002 10:52:22 +0200
Message-ID: <200210121052.22603.bofh@coker.com.au>
References: <Pine.LNX.4.33L2.0210100853240.1670-100000@localhost.localdomain> <200210112022.27319.russell@coker.com.au> <3DA72DEB.4040809@namesys.com>
Reply-To: Russell Coker <bofh@coker.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-list-return-11658-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <3DA72DEB.4040809@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Hans Reiser <reiser@namesys.com>
Cc: reiserfs-list@namesys.com

On Fri, 11 Oct 2002 22:00, Hans Reiser wrote:
> except that WAFL (at least it was in 1996 when I last benchmarked one)
> is memory bandwidth bound, not disk or CPU bound, when configured with
> 14 disk drives.  They do a nice job of zero-copy optimizing from what I
> understand.

Hmm, I wonder what the difference in memory bandwidth between a P4 and a 
NetApp device is.  Maybe the P4 has 3 times the memory bandwidth of the 
NetApp...

Also most people seem to run into a limit of PCI bus bandwidth first.  Then 
after surmounting that by using two PCI buses with hardware RAID controllers 
and running software RAID across them the next issue becomes cable tangle.

S-ATA should solve the cable issue.  PCI-X should solve the PCI bottleneck.  
Then it'll be interesting to see what the bottleneck is.

> I should also mention that actually most of these fileservers are disk
> space bound not performance bound for most of their users, at least that
> was true when I was a sysadmin back in the old days....

I think that's about to change (if it hasn't already).  3ware sells RAID 
controllers that do 8 or 12 drives.  200G ATA drives are now on sale, and 
320G drives will be available soon.

12 * 320G should solve the disk space issue for most people...

-- 
http://www.coker.com.au/bonnie++/     Bonnie++ hard drive benchmark
http://www.coker.com.au/postal/       Postal SMTP/POP benchmark
http://www.coker.com.au/projects.html Projects I am working on
http://www.coker.com.au/~russell/     My home page

