From: Dieter =?iso-8859-15?q?N=FCtzel?= <Dieter.Nuetzel@hamburg.de>
Subject: Re: Catastrophe with mailboxes on ReiserFS
Date: Wed, 9 Oct 2002 16:10:47 +0200
Message-ID: <200210091610.47197.Dieter.Nuetzel@hamburg.de>
References: <20021009094215.B11954@namesys.com> <20021009121811.A22948@namesys.com> <200210091602.34904.Dieter.Nuetzel@hamburg.de>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-11629-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200210091602.34904.Dieter.Nuetzel@hamburg.de>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Oleg Drokin <green@namesys.com>
Cc: ReiserFS List <reiserfs-list@namesys.com>

Am Mittwoch, 9. Oktober 2002 16:02 schrieb Dieter N=FCtzel:
> Am Mittwoch, 9. Oktober 2002 10:18 schrieb Oleg Drokin:
> > Hello!
> >
> > On Wed, Oct 09, 2002 at 11:06:36AM +0300, Robert Tiismus wrote:
> > > > Also you probably want to run reiserfsck on that disk to make sure
> > > > no other damage happened.
> > >
> > > Thank you. Reiserfsck said that all is ok. It's just that I have seen
> > > nothing
> >
> > This is good.
> >
> > > similar happening with other filesystems. I would prefer disappearing
> > > data to leaking data. Am I completely wrong, when I say that because =
of
> > > 'tail packing' in ReiserFS, it can leak information with more
> > > probability than, lets say ext2 or ufs or...? Will notails option give
> >
> > No, tail packing should have no effect on leakign data.
> > Anyway tail packing is only takes effect for files less than 16K in siz=
e.
> >
> > > me more secure FS? I have to assure company management, and myself,
> > > that this
> >
> > notails will have no effect on that.
> >
> > > incident happened not because I put ReiserFS on new server. It could
> > > have happened also with other filesystems :)
> >
> > Indeed it seems that you've got either some metadata altered (block
> > pointers) or the block content swapped somehow, both of which could
> > happen on any FS with absolutely same results.
> > BTW, I just remembered that until you apply Chris' Mason "data logging"
> > patches, there is a certain window where system crash would lead to
> > "deleted" data appearing at the end of files that were appended before
> > the crash. (that's it, metadata is already updated and list newly
> > allocated blocknumbers, but old content od those blocks is still intact
> > since crash prevented system from putting new content in there), but
> > since you've got other file's data in the middle of file, this is not t=
he
> > case.
>
> Oleg, I "see" it from time to time during kernel and DRI development (X
> server crashes), too. This times without Chris's stuff. 2.4.19-ck5 (latest
> ReiserFS patches for 2.4.19) and now with 2.5.40-ac3.
>
> Most times "messages", "localmessages", kernel .o.*, dep files, etc. are
> broken (wrong stuff or mixed stuff).
>
> Latest my ".q3a/baseq3/q3key" file (DRI SMP tests) was broken (completely
> other stuff in it) even though it only should opened for reading.

Oh, forgotten my mount options:

/dev/sda3 on / type reiserfs (rw,noatime,notail)
/dev/sda2 on /tmp type reiserfs (rw,notail)
/dev/sda5 on /var type reiserfs (rw,notail)
/dev/sda6 on /home type reiserfs (rw,notail)
/dev/sda7 on /usr type reiserfs (rw,notail)
/dev/sda8 on /opt type reiserfs (rw,notail)
/dev/sdb1 on /Pakete type reiserfs (rw,notail)
/dev/sdb5 on /database/db1 type reiserfs (rw,notail)
/dev/sdb6 on /database/db2 type reiserfs (rw,notail)
/dev/sdb7 on /database/db3 type reiserfs (rw,notail)
/dev/sdb8 on /database/db4 type reiserfs (rw,notail)

=2DDieter
