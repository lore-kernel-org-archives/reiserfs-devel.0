From: Yury Umanets <umka@namesys.com>
Subject: Re: ReiserFS on a flash device?
Date: Mon, 28 Jul 2003 08:53:57 +0400
Message-ID: <1059368036.6406.0.camel@haron.namesys.com>
References: <200307261640.13629.swsnyder@insightbb.com>
	 <1059303331.17569.119.camel@haron.namesys.com>
	 <20030728023345.GD1686@matchmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-15084-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20030728023345.GD1686@matchmail.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Mike Fedyk <mfedyk@matchmail.com>
Cc: Steve Snyder <swsnyder@insightbb.com>, ReiserFS Mailing List <reiserfs-list@namesys.com>

On Mon, 2003-07-28 at 06:33, Mike Fedyk wrote:
> On Sun, Jul 27, 2003 at 02:55:31PM +0400, Yury Umanets wrote:
> > Default journal size is too big (32MB) for usual embedded device. I
> > mean, that flash is expensive and it is pity to loss 32MB for journal :)
> 
> What?  You mean it isn't reduced in size based on block device size like
> with ext3?

Yes, is isn't. Use reiserfstune to make it smaller.
> 
> IIRC, it defaults to 2-4MB on a 100MB device.
-- 
We're flying high, we're watching the world passes by...

