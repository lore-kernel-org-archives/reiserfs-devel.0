From: Yury Umanets <umka@namesys.com>
Subject: Re: ReiserFS on a flash device?
Date: Mon, 28 Jul 2003 11:31:16 +0400
Message-ID: <1059377476.21411.3.camel@haron.namesys.com>
References: <200307261640.13629.swsnyder@insightbb.com>
	 <1059303331.17569.119.camel@haron.namesys.com>
	 <20030728023345.GD1686@matchmail.com>
	 <1059368036.6406.0.camel@haron.namesys.com>
	 <20030728070547.GF894@ecloud.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-15088-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20030728070547.GF894@ecloud.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Shawn Rutledge <e_cloud@yahoo.com>
Cc: reiserfs-list@namesys.com

On Mon, 2003-07-28 at 11:05, Shawn Rutledge wrote:
> On Mon, Jul 28, 2003 at 08:53:57AM +0400, Yury Umanets wrote:
> > On Mon, 2003-07-28 at 06:33, Mike Fedyk wrote:
> > > On Sun, Jul 27, 2003 at 02:55:31PM +0400, Yury Umanets wrote:
> > > > Default journal size is too big (32MB) for usual embedded device. I
> > > > mean, that flash is expensive and it is pity to loss 32MB for journal :)
> > > 
> > > What?  You mean it isn't reduced in size based on block device size like
> > > with ext3?
> > 
> > Yes, is isn't. Use reiserfstune to make it smaller.
> 

> Well I'm glad to hear it's possible to use ReiserFS on small devices,
> but I think that requiring a kernel patch, or a GRUB patch, to handle
> different journal sizes is not good.  Are there plans to have the kernel
> and GRUB detect it at runtime?
Support for non-standard journal is merged to kernel recently. Use last
pre or wait until next stable kernel is released.

GRUB is able to with with it too. Use
ftp://ftp.namesys.com/pub/misc-patches/grub-0.93-reiserfs-non-standard-journal.diff for that.

Regards.

-- 
We're flying high, we're watching the world passes by...

