From: Russell Coker <russell@coker.com.au>
Subject: Re: slightly [OT] highmem (was Re: 2.4.20 at kernel.org and data logging)
Date: Fri, 24 Jan 2003 00:40:14 +0100
Message-ID: <200301240040.14310.russell@coker.com.au>
References: <0E18D85A21D2874080456C3B8A12E83E01009FAD@cof110avexu4.global.avaya.com> <1042905430.31095.2343.camel@tiny.suse.com> <3E307657.2010200@mb.tu-ilmenau.de>
Reply-To: Russell Coker <russell@coker.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-12471-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <3E307657.2010200@mb.tu-ilmenau.de>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Manuel Krause <manuel.krause@mb.tu-ilmenau.de>
Cc: reiserfs-list <reiserfs-list@namesys.com>

On Fri, 24 Jan 2003 00:10, Manuel Krause wrote:
> * Does enabled highmem support make any sense for mem<1G ?

You need highmem if you want more than 980M.  People usually refer to 1G, and 
if you don't mind wasting 20M then that's near enough.

Which of the overhead of highmem or the loss of 20M of RAM out of 1G is 
something that could be debated.

-- 
http://www.coker.com.au/selinux/   My NSA Security Enhanced Linux packages
http://www.coker.com.au/bonnie++/  Bonnie++ hard drive benchmark
http://www.coker.com.au/postal/    Postal SMTP/POP benchmark
http://www.coker.com.au/~russell/  My home page

