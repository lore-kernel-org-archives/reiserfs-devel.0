From: Oleg Drokin <green@namesys.com>
Subject: Re: Stress test failure for reiserfs, but ext3 ok on Linux 2.4.20
Date: Wed, 15 Jan 2003 14:58:04 +0300
Message-ID: <20030115145804.B31603@namesys.com>
References: <20030115023559.GA14694@mathematik.uni-bielefeld.de> <20030115134315.A31068@namesys.com> <20030115115100.GB16645@mathematik.uni-bielefeld.de>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-12361-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <20030115115100.GB16645@mathematik.uni-bielefeld.de>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Bernhard Sadlowski <sadlowsk@mathematik.Uni-Bielefeld.DE>
Cc: reiserfs-list@namesys.com

Hello!

On Wed, Jan 15, 2003 at 12:51:00PM +0100, Bernhard Sadlowski wrote:

> > Hm. This resembles me something.
> > Can you reproduce the same problem if you apply patches from
> > ftp://ftp.namesys.com/pub/reiserfs-for-2.4/testing/quota-2.4.20/
> > These patches add quota support to reiserfs, but also change some
> > new inode-related operation to prevent deadlocks like you are seeing.
> The unpatched kernel shows the hangs much earlier, so I assume that the
> above patches solve the problem. With the patches the load goes up very
> slowly but steady to "100" and I/O does not freeze anymore. vmstat and
> iostat still show activity. I assume you don't need any sysrq-t output
> now.

Ok. That's a good sign.

> Will the patches be included in 2.4.21?

No, they require quota support tha won't be included into 2.4 because of
new quota formats and stuff.
I will extract relevant bits from the patch though.
I will send you short version without quota once it will be ready.

Thank you.

Bye,
    Oleg
