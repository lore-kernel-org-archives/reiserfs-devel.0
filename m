From: Russell Coker <russell@coker.com.au>
Subject: Re: ReiserFS is not suitable for a root FS.
Date: Sat, 17 May 2003 21:32:34 +1000
Message-ID: <200305172132.34865.russell@coker.com.au>
References: <200305172030.58775.russell@coker.com.au> <200305172109.53538.russell@coker.com.au> <20030517112446.GA20672@namesys.com>
Reply-To: Russell Coker <russell@coker.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-14140-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20030517112446.GA20672@namesys.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Oleg Drokin <green@namesys.com>
Cc: ReiserFS <reiserfs-list@namesys.com>

On Sat, 17 May 2003 21:24, Oleg Drokin wrote:
> > Having the kernel just trash system memory because of bad data on disk is
> > a bug.
>
> You cannot check all the on disk values, this is too bik performance
> impact. Nobody does that in Linux, I think.

I really doubt that.

On 99.99% of all machines in use the data can be checked much faster than it 
can be read from disk.  There is little benefit in not checking, but there 
are huge problems when something goes wrong if you don't check.

Corrupted disks are not uncommon.  Otherwise we wouldn't need fsck programs!

-- 
http://www.coker.com.au/selinux/   My NSA Security Enhanced Linux packages
http://www.coker.com.au/bonnie++/  Bonnie++ hard drive benchmark
http://www.coker.com.au/postal/    Postal SMTP/POP benchmark
http://www.coker.com.au/~russell/  My home page

