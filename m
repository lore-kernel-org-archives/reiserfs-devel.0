From: Oleg Drokin <green@namesys.com>
Subject: Re: Large Partition Performance Test
Date: Thu, 11 Apr 2002 23:43:16 +0400
Message-ID: <20020411234316.A3749@namesys.com>
References: <20020411181459.69516.qmail@web10002.mail.yahoo.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-10046-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Content-Disposition: inline
In-Reply-To: <20020411181459.69516.qmail@web10002.mail.yahoo.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: bill@billrees.com
Cc: reiserfs-list@namesys.com

Hello!

On Thu, Apr 11, 2002 at 11:14:59AM -0700, Bill Rees wrote:

> I upgraded my kernel to 2.4.19-pre6 with the speedup
> patch installed and still see similiar results as
> before.  As the amount of data on the partition

Good.

> Dual Athlon MP 1600+
> 512 gb system memory

HUH???

> Results:
> --------
> day/hour 00 00 seconds = 259

4 minutes 20 seconds to write 1.6G of data even in the beginning?!
This sounds too slow to me. Though RAID5 certainly can slow things down.

We will perform some tests tomorrow with your test script.

Thank you for the report.

Bye,
    Oleg
