From: Dieter =?iso-8859-15?q?N=FCtzel?= <Dieter.Nuetzel@hamburg.de>
Subject: Re: reiserfs logging patches udpated
Date: Thu, 25 Mar 2004 02:14:28 +0100
Message-ID: <200403250214.28736.Dieter.Nuetzel@hamburg.de>
References: <1080149399.14737.77.camel@watt.suse.com> <200403250147.54246.bernd-schubert@web.de> <1080176455.14737.140.camel@watt.suse.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-17453-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1080176455.14737.140.camel@watt.suse.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: reiserfs-list@namesys.com
Cc: Chris Mason <mason@suse.com>, Bernd Schubert <bernd-schubert@web.de>, Andrew Morton <akpm@osdl.org>

Am Donnerstag, 25. M=E4rz 2004 02:00 schrieb Chris Mason:
> On Wed, 2004-03-24 at 19:47, Bernd Schubert wrote:
> > -----BEGIN PGP SIGNED MESSAGE-----
> > Hash: SHA1
> >
> > > It does, but the code has been in testing -suse and on the reiserfs
> > > list.  This dooesn't mean data=3Dordered is perfect, but it's not qui=
te
> > > day one either.  I can switch the default back, but I'd rather have a
> > > trial by fire ;-)
> >
> > Oh please not, just have a look at german newsgroups, there are real
> > flamewars about the stability of reiserfs. Everytime someone has a disk
> > problem and a reiserfs partion is affected by it, then there are more
> > than a dozen answers that its the fault of reiserfs. PLEASE, don't prove
> > them right.
>
> The code just won't get tested if it isn't turned on.  I think I've got
> all the major issues fixed, and I'm sending to -mm to try and prove
> that.  When we're all happy with the stability of the patches, they can
> go to -linus.
>
> But there are just as many threads about reiserfs not having
> data=3Dordered support.  It's an important feature that has been out of
> mainline for far too long.

=46ull Ack!  --- And works for ages, even in 2.4 (SuSE).

Thanks for all _your_ effort!

=2DDieter
