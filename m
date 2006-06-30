From: Alexander Zarochentsev <zam@namesys.com>
Subject: Re: Reiser4 on top of software raid 1 - synchronous write "problem"?
Date: Fri, 30 Jun 2006 14:37:04 +0400
Message-ID: <200606301437.04644.zam@namesys.com>
References: <N1-SucH3Ugv3E@Safe-mail.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-28872-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <N1-SucH3Ugv3E@Safe-mail.net>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com
Cc: Diego Pinheiro <diegopp@safe-mail.net>

On Friday 30 June 2006 01:44, Diego Pinheiro wrote:
> Hi all,
>
> I got a ZAM-1055 "disable_write_barrier", "using synchronous write"
> notice when trying to use a reiser4 on top of a software raid 1
> (dmraid).
 
> I know it's just a notice, but should I experiment any performance
> loss because of the synchronous writes?

I don't think so.  A number of optimizations (copy on capture, for 
example) should be done in reiser4 to see any effect of working write 
barrier support.

Best,
Alex.

