From: Russell Coker <russell@coker.com.au>
Subject: Re: Corrupted/unreadable journal: reiser vs. ext3
Date: Wed, 12 Feb 2003 15:15:46 +0100
Message-ID: <200302121515.46953.russell@coker.com.au>
References: <NDBBJPAGKLCMDEIEKOPBKEKHKFAA.mailinglists@websitemanagers.com.au> <11104354750.20030212144219@tnonline.net>
Reply-To: Russell Coker <russell@coker.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-12715-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <11104354750.20030212144219@tnonline.net>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Anders Widman <andewid@tnonline.net>, reiserfs-list@namesys.com

On Wed, 12 Feb 2003 14:42, Anders Widman wrote:
> > A) Immediately re-mount the drive read-only, and wait for the sysadmin to
> > either re-mount rw or to do some other data recovery/repair
>
> This  would be devastating for some form of servers and cause downtime
> and  loss  of  work  for  plenty. Consider an application server, or a
> document  server within a company. If writes were prohibited then lots
> of programs do stop function, or saving fails.

Servers should have RAID.  There is no excuse.  With RAID the regular disk 
errors should not be an issue.

> Unplanned downtime do cause lot of harm to any business.

It's better to stop when there's a serious error than to blindly continue and 
make things worse.

> Easy  to  blame  MS, but Bad Blocks handling from FAT12 and ever since
> has probably saved more data than not having it.
>
> Just  because  MS  does  things it does not mean they are bad and that
> Linux   world  should  refuse  to  do  something similar. That is just
> shooting yourself in the foot.

The FAT bad block handling was developed when RAID was virtually unknown (and 
not available for PCs) and when no commonly available hard drives had the 
ability to relocate bad blocks (the drive controller received the analog 
signal from the disk heads - there was no abstraction).

Now all machines other than laptops are getting RAID, all hard drives support 
re-mapping bad sectors, and the entire situation is different.

Bad block handling is only needed for laptops.

-- 
http://www.coker.com.au/selinux/   My NSA Security Enhanced Linux packages
http://www.coker.com.au/bonnie++/  Bonnie++ hard drive benchmark
http://www.coker.com.au/postal/    Postal SMTP/POP benchmark
http://www.coker.com.au/~russell/  My home page

