From: Shawn Rutledge <e_cloud@yahoo.com>
Subject: Re: ReiserFS on a flash device?
Date: Mon, 28 Jul 2003 00:05:47 -0700
Sender: Shawn Rutledge <rutledge@ecloud.org>
Message-ID: <20030728070547.GF894@ecloud.org>
References: <200307261640.13629.swsnyder@insightbb.com> <1059303331.17569.119.camel@haron.namesys.com> <20030728023345.GD1686@matchmail.com> <1059368036.6406.0.camel@haron.namesys.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-15087-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <1059368036.6406.0.camel@haron.namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

On Mon, Jul 28, 2003 at 08:53:57AM +0400, Yury Umanets wrote:
> On Mon, 2003-07-28 at 06:33, Mike Fedyk wrote:
> > On Sun, Jul 27, 2003 at 02:55:31PM +0400, Yury Umanets wrote:
> > > Default journal size is too big (32MB) for usual embedded device. I
> > > mean, that flash is expensive and it is pity to loss 32MB for journal :)
> > 
> > What?  You mean it isn't reduced in size based on block device size like
> > with ext3?
> 
> Yes, is isn't. Use reiserfstune to make it smaller.

Well I'm glad to hear it's possible to use ReiserFS on small devices,
but I think that requiring a kernel patch, or a GRUB patch, to handle
different journal sizes is not good.  Are there plans to have the kernel
and GRUB detect it at runtime?

-- 
  _______                                                Shawn T. Rutledge
 (_  | |_)                      e_cloud@yahoo.com * http://ecloud.org:8080
 __) | | \________________________________________________________________
