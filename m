From: Oleg Drokin <green@namesys.com>
Subject: Re: Large Partition Performance Test
Date: Fri, 12 Apr 2002 17:29:02 +0400
Message-ID: <20020412172902.A23772@namesys.com>
References: <20020412133937.A21820@namesys.com> <20020412132133.2596.qmail@web10007.mail.yahoo.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-10059-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Content-Disposition: inline
In-Reply-To: <20020412132133.2596.qmail@web10007.mail.yahoo.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: bill@billrees.com
Cc: reiserfs-list@namesys.com

Hello!

On Fri, Apr 12, 2002 at 06:21:33AM -0700, Bill Rees wrote:

> That seems to have done the trick.  Which is the most
> stable release that you would recommend that would
> include this fix?

Huh? Fix? This mount options is in kernel for ages! ( cannot say for
how long exactly, but certainly more than for half of year).
Too bad is not documented well.
We now recommend 2.4.18 kernel that contains all critical fixes.
When 2.4.19 will eb out, it will become out recommended version, if
nothign bad won't happen with it.

We also have this new block allocator alrogithm, I recently posted to the list,
which should also have positive impact on workload like yours .
But we cannot recommend it for productional use yet.

Bye,
    Oleg
