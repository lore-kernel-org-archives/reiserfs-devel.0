From: Robert Tiismus <robert@fi.tartu.ee>
Subject: Re: Catastrophe with mailboxes on ReiserFS
Date: Wed, 9 Oct 2002 11:06:36 +0300 (EEST)
Message-ID: <Pine.LNX.4.44.0210091041350.880-100000@fii.fi.tartu.ee>
References: <20021009094215.B11954@namesys.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-11624-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20021009094215.B11954@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Oleg Drokin <green@namesys.com>
Cc: reiserfs-list@namesys.com

On Wed, 9 Oct 2002, Oleg Drokin wrote:

> Hello!
>
> On Tue, Oct 08, 2002 at 11:55:42PM +0300, Robert Tiismus wrote:
> > malfunction with the new hardware. I think that when closing the side
> > panel, I misaligned the scsi cable from the connector and disk access
> > malfunctioned. Then, after rebooting the system, everything seemed ok, besides
> > this unfortunate inident with three mailboxes :(
>
> Behaviour of hardware is unpredicatble on bad wiring and that kind of stuff.
>
> > Is it possible, that VBT happened during following reboot?
>
> If the wiring was already ok, then this is very unlikely.
>
> Also you probably want to run reiserfsck on that disk to make sure
> no other damage happened.
Thank you. Reiserfsck said that all is ok. It's just that I have seen nothing
similar happening with other filesystems. I would prefer disappearing
data to leaking data. Am I completely wrong, when I say that because of
'tail packing' in ReiserFS, it can leak information with more
probability than, lets say ext2 or ufs or...? Will notails option give
me more secure FS? I have to assure company management, and myself, that this
incident happened not because I put ReiserFS on new server. It could
have happened also with other filesystems :)

Robert Tiismus

