From: Russell Coker <russell@coker.com.au>
Subject: Re: Corrupted/unreadable journal: reiser vs. ext3
Date: Wed, 12 Feb 2003 17:28:53 +0100
Message-ID: <200302121728.53272.russell@coker.com.au>
References: <NDBBJPAGKLCMDEIEKOPBKEKHKFAA.mailinglists@websitemanagers.com.au> <200302121515.46953.russell@coker.com.au> <46110589437.20030212162613@tnonline.net>
Reply-To: Russell Coker <russell@coker.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-12720-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <46110589437.20030212162613@tnonline.net>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Anders Widman <andewid@tnonline.net>, reiserfs-list@namesys.com

On Wed, 12 Feb 2003 16:26, Anders Widman wrote:
> >> Unplanned downtime do cause lot of harm to any business.
> >
> > It's better to stop when there's a serious error than to blindly continue
> > and make things worse.
>
> I  (and  I  think  no  one  else)  never  said  continue blindly. Most
> users/workstations do not have RAID and probably never will.

Hard drive costs are constantly decreasing while the value of data is 
constantly increasing.  I think that the use of RAID will increase steadily.

> The  others  want to make Linux a viable option for "normal" users and
> want Linux to be able to replace Windows or Mac OS. The only way I see
> that happen is if Linux starts to get more userfriendly and safe.

I guess you're not familiar with what NT does then.

NT 3.5x would sometimes get confused about it's data and umount the file 
system in question to avoid the risk of damaging data.

In case of a serious kernel error NT will give a BSOD in situations where 
Linux by default will print an Oops message and continue running.

-- 
http://www.coker.com.au/selinux/   My NSA Security Enhanced Linux packages
http://www.coker.com.au/bonnie++/  Bonnie++ hard drive benchmark
http://www.coker.com.au/postal/    Postal SMTP/POP benchmark
http://www.coker.com.au/~russell/  My home page

