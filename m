From: Manuel Krause <manuel.krause@mb.tu-ilmenau.de>
Subject: Re: slightly [OT] highmem (was Re: 2.4.20 at kernel.org and data
 logging)
Date: Fri, 24 Jan 2003 01:18:44 +0100
Message-ID: <3E308664.5010705@mb.tu-ilmenau.de>
References: <0E18D85A21D2874080456C3B8A12E83E01009FAD@cof110avexu4.global.avaya.com> <1042905430.31095.2343.camel@tiny.suse.com> <3E307657.2010200@mb.tu-ilmenau.de> <200301240040.14310.russell@coker.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-12472-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Russell Coker <russell@coker.com.au>
Cc: reiserfs-list <reiserfs-list@namesys.com>

On 01/24/2003 12:40 AM, Russell Coker wrote:
> On Fri, 24 Jan 2003 00:10, Manuel Krause wrote:
> 
>>* Does enabled highmem support make any sense for mem<1G ?
> 
> You need highmem if you want more than 980M.  People usually refer to 1G, and 
> if you don't mind wasting 20M then that's near enough.

Mmh. So I wasn't really clear with my questions?

Does it give advantages for 512M systems like mine if I enabled 
higmem4GB / highmem64GB with "pae" or does it produce more overhead that 
you mention below?

Thank you,

Manuel

> Which of the overhead of highmem or the loss of 20M of RAM out of 1G is 
> something that could be debated.

