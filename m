From: Dieter =?iso-8859-15?q?N=FCtzel?= <Dieter.Nuetzel@hamburg.de>
Subject: Re: Catastrophe with mailboxes on ReiserFS
Date: Wed, 9 Oct 2002 16:02:34 +0200
Message-ID: <200210091602.34904.Dieter.Nuetzel@hamburg.de>
References: <20021009094215.B11954@namesys.com> <Pine.LNX.4.44.0210091041350.880-100000@fii.fi.tartu.ee> <20021009121811.A22948@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-11627-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20021009121811.A22948@namesys.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Oleg Drokin <green@namesys.com>
Cc: ReiserFS List <reiserfs-list@namesys.com>

Am Mittwoch, 9. Oktober 2002 10:18 schrieb Oleg Drokin:
> Hello!
>
> On Wed, Oct 09, 2002 at 11:06:36AM +0300, Robert Tiismus wrote:
> > > Also you probably want to run reiserfsck on that disk to make sure
> > > no other damage happened.
> >
> > Thank you. Reiserfsck said that all is ok. It's just that I have seen
> > nothing
>
> This is good.
>
> > similar happening with other filesystems. I would prefer disappearing
> > data to leaking data. Am I completely wrong, when I say that because of
> > 'tail packing' in ReiserFS, it can leak information with more
> > probability than, lets say ext2 or ufs or...? Will notails option give
>
> No, tail packing should have no effect on leakign data.
> Anyway tail packing is only takes effect for files less than 16K in size.
>
> > me more secure FS? I have to assure company management, and myself, that
> > this
>
> notails will have no effect on that.
>
> > incident happened not because I put ReiserFS on new server. It could
> > have happened also with other filesystems :)
>
> Indeed it seems that you've got either some metadata altered (block
> pointers) or the block content swapped somehow, both of which could happen
> on any FS with absolutely same results.
> BTW, I just remembered that until you apply Chris' Mason "data logging"
> patches, there is a certain window where system crash would lead to
> "deleted" data appearing at the end of files that were appended before the
> crash. (that's it, metadata is already updated and list newly allocated
> blocknumbers, but old content od those blocks is still intact since crash
> prevented system from putting new content in there), but since you've got
> other file's data in the middle of file, this is not the case.

Oleg, I "see" it from time to time during kernel and DRI development (X ser=
ver=20
crashes), too. This times without Chris's stuff. 2.4.19-ck5 (latest ReiserF=
S=20
patches for 2.4.19) and now with 2.5.40-ac3.

Most times "messages", "localmessages", kernel .o.*, dep files, etc. are=20
broken (wrong stuff or mixed stuff).

Latest my ".q3a/baseq3/q3key" file (DRI SMP tests) was broken (completely=20
other stuff in it) even though it only should opened for reading.

=2DDieter

PS I send you a compressed copy of my "messages" file in private.
