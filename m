From: Bernhard Sadlowski <sadlowsk@mathematik.Uni-Bielefeld.DE>
Subject: Re: Stress test failure for reiserfs, but ext3 ok on Linux 2.4.20
Date: Wed, 15 Jan 2003 12:51:00 +0100
Sender: Bernhard Sadlowski <sadlowsk@Mathematik.Uni-Bielefeld.DE>
Message-ID: <20030115115100.GB16645@mathematik.uni-bielefeld.de>
References: <20030115023559.GA14694@mathematik.uni-bielefeld.de> <20030115134315.A31068@namesys.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-12360-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <20030115134315.A31068@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Oleg Drokin <green@namesys.com>
Cc: reiserfs-list@namesys.com

On 15 Jan 2003 13:43, Oleg Drokin <green@namesys.com> wrote:
> Hm. This resembles me something.
> Can you reproduce the same problem if you apply patches from
> ftp://ftp.namesys.com/pub/reiserfs-for-2.4/testing/quota-2.4.20/
> These patches add quota support to reiserfs, but also change some
> new inode-related operation to prevent deadlocks like you are seeing.

The unpatched kernel shows the hangs much earlier, so I assume that the
above patches solve the problem. With the patches the load goes up very
slowly but steady to "100" and I/O does not freeze anymore. vmstat and
iostat still show activity. I assume you don't need any sysrq-t output
now.

Will the patches be included in 2.4.21?

Bernhard
