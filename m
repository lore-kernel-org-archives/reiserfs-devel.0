From: B S Srinidhi <srinidhi@deeproot.co.in>
Subject: Re: Status of quota support for reiserfs on 2.6.x kernels
Date: Wed, 15 Dec 2004 11:46:39 +0530
Message-ID: <1103091400.1518.29.camel@srinidhi.com>
References: <20041123105332.02470503.philippe.gramoulle@mmania.com>
	 <200411231406.43497.christian.mayrhuber@gmx.net>
	 <loom.20041215T011250-550@post.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-22778-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <loom.20041215T011250-550@post.gmane.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

Hello,

On Wed, 2004-12-15 at 00:29 +0000, Klaus Thorn wrote:
> Christian Mayrhuber <christian.mayrhuber <at> gmx.net> writes:
> > Quotas are in kernel 2.6 and supported by ext2,ext3,reiserfs,xfs.
> > Reiserfs doesn't need an extra patch for quotas, data journalling
> > or extended attributes. Everything is right there for
> > kernels > 2.6.5 if I remember right.
> 
> I tried to use quota with 2.6.7 and got two serious problems:
> 

I'm running 2.6.9 kernel with quota and ACL support enabled and both are
running just fine. I'm able to mount (at bootup) the Reiserfs partition
with user quota and group quota enabled. 

I was facing some problems with 2.6.4 kernel, though.

Regards,
-- 
B S Srinidhi <srinidhi@deeproot.co.in>
DeepRoot Linux Pvt. Ltd.

