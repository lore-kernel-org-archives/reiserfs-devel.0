From: Mike Fedyk <mfedyk@matchmail.com>
Subject: Re: ReiserFS on a flash device?
Date: Sun, 27 Jul 2003 19:33:45 -0700
Message-ID: <20030728023345.GD1686@matchmail.com>
References: <200307261640.13629.swsnyder@insightbb.com> <1059303331.17569.119.camel@haron.namesys.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-15083-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <1059303331.17569.119.camel@haron.namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Yury Umanets <umka@namesys.com>
Cc: Steve Snyder <swsnyder@insightbb.com>, ReiserFS Mailing List <reiserfs-list@namesys.com>

On Sun, Jul 27, 2003 at 02:55:31PM +0400, Yury Umanets wrote:
> Default journal size is too big (32MB) for usual embedded device. I
> mean, that flash is expensive and it is pity to loss 32MB for journal :)

What?  You mean it isn't reduced in size based on block device size like
with ext3?

IIRC, it defaults to 2-4MB on a 100MB device.
