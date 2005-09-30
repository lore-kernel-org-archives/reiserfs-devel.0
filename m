From: David Masover <ninja@slaphack.com>
Subject: Re: Different size of partion between reiser4 and reiserFS 3.6
Date: Fri, 30 Sep 2005 12:54:50 -0500
Message-ID: <433D7BEA.3090207@slaphack.com>
References: <200509301233.20008.xxlucas@seznam.cz> <433D3274.7050305@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-26361-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <433D3274.7050305@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "Vladimir V. Saveliev" <vs@namesys.com>
Cc: luc <xxlucas@seznam.cz>, reiserfs-list@namesys.com

Vladimir V. Saveliev wrote:
> Hello

> reiser4 subtracted amount of reserved space. Probably it should have not done that.

Yes, it should.  Otherwise, I'd start getting out-of-space errors when
I've still got almost 20 gigs left.

If Reiser3 reserves anything, it should also subtract that.

If users really want to see how much space is available for
repartitioning, they should be using some form of fdisk anyway.
