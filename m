From: Russell Coker <russell@coker.com.au>
Subject: Re: How to build a big file server
Date: Thu, 5 Jun 2003 20:29:41 +1000
Message-ID: <200306052029.41437.russell@coker.com.au>
References: <1054800852.1997.15.camel@wusel.schnulli.de> <20030605090435.GE7950@namesys.com> <1054804624.1997.39.camel@wusel.schnulli.de>
Reply-To: Russell Coker <russell@coker.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-14427-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1054804624.1997.39.camel@wusel.schnulli.de>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Heinz-Josef Claes <hjclaes@web.de>, reiserfs-list@namesys.com

On Thu, 5 Jun 2003 19:17, Heinz-Josef Claes wrote:
> Perhaps this is a good idea. I'll try to test the performance. Since the
> servers are only used for an (additional) online backup (like
> snapshots), there will not be really critical data on them. I'll see if
> the performance win is worth the risk :-)

Are you backing up file by file or saving backup volumes?  IE Will you have a 
file on the backup server for each file on a live machine, or will the backup 
machine be filled with tar files?

If you are storing tar files or similar then a umem device will provide little 
benefit.  In which case you will probably want a machine with two PCI buses 
and two hardware RAID cards and run software RAID-0 across them.

-- 
http://www.coker.com.au/selinux/   My NSA Security Enhanced Linux packages
http://www.coker.com.au/bonnie++/  Bonnie++ hard drive benchmark
http://www.coker.com.au/postal/    Postal SMTP/POP benchmark
http://www.coker.com.au/~russell/  My home page

