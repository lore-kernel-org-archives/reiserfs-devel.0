From: Oleg Drokin <green@namesys.com>
Subject: Re: Kernel Error
Date: Tue, 1 Oct 2002 10:18:50 +0400
Message-ID: <20021001101850.A5925@namesys.com>
References: <200210010704.15161.cabernet@internode.on.net>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-11584-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <200210010704.15161.cabernet@internode.on.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Brian Marr <cabernet@internode.on.net>
Cc: Reiserfs List <reiserfs-list@namesys.com>

Hello!

On Tue, Oct 01, 2002 at 07:04:15AM +0930, Brian Marr wrote:
> Suse 8.0 kernel 2.4.18 AMD 1530Mhz cpu
> Can anyone enlighten me on the possible cause of this problem ? The system 
> continues to run ok - but I would value your feedback.
> Brian Marr
> Sep 29 11:27:18 linux kernel: invalid operand: 0000
> Sep 29 11:27:18 linux kernel: CPU:    0
> Sep 29 11:27:18 linux kernel: EIP:    0010:[__free_pages_ok+43/660]    
> Tainted: P

Your kernel is tainted which most probably means you are loading some binary
only kernel module (like NVidia driver).
You should either reproduse without ever loading this module or ask
the module provider what to do.
Also this problem itself have nothing to do with reiserfs at all, you may
have more luck at SuSE support.

The oops itself is a sign of a failure of one of sanity checks at the beginning
of __free_pages_ok (in mm/page_alloc.c)

This is also not looks very harmless, if somebody changes some sytem data at
will, there is no guaratnies somebody not changing your own data before it
goes to disk.

Bye,
    Oleg
