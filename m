From: Jason Stubbs <jstubbs@gentoo.org>
Subject: Re: Gnu Parted error, Kernel Panic, Reiserfs
Date: Fri, 16 Apr 2004 23:24:28 +0900
Message-ID: <200404162324.33202.jstubbs@gentoo.org>
References: <Pine.LNX.4.21.0404161554420.16938-100000@mlf.linux.rulez.org> <1082124859.22432.2.camel@firefly>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-17997-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1082124859.22432.2.camel@firefly>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: Text/Plain; charset="us-ascii"
To: reiserfs-list@namesys.com

=2D----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On Friday 16 April 2004 23:14, Yury Umanets wrote:
> On Fri, 2004-04-16 at 17:06, Szakacsits Szabolcs wrote:
> > On Fri, 16 Apr 2004, Yury Umanets wrote:
> > > One more thing. Is it common case, that resizier errors happen on
> > > Gento?
> >
> > Hmmm, seems to be a good point. Alan had Gentoo. On the QTParted forums
> > people mention Gentoo. SystemRescueCD (http://www.sysresccd.org), the
> > most popular LiveCD for partition handling is Gentoo based ...
>
> It is quite possible, that Gentoo guys have modified progsreiserfs a
> little bit like Debian guys did some time ago on stock reiserfsprogs.
> And then there was lots of errors with bitmap, as bit working functions
> was incorrectly modified.
>
> Can this explain lots of errors on Gentoo?

Latest version available is 3.6.9. Absolutely no patches are applied to any=
 of=20
the available versions.

> > Look what I've found right now:
> >
> > 	http://www.sysresccd.org/forums/viewtopic.php?t=3D294
> >
> >   "Why is it that with and only with System Rescue CD, if I format a
> >    partition as reiserfs, then copy some data from another resierfs
> >    partition to that newly formatted partition and then unmount the
> >    partition and run fsck on it, errors are found that need fixing?"
> >
> > 	Szaka
>
> Also they might modify kernel code...

I don't know what kernel is used on this System Rescue CD. Neither of=20
gentoo-sources (2.4-based) and gentoo-dev-sources (2.6-based) apply any=20
reiserfs-specific patches that I am aware of.

Regards,
Jason Stubbs
=2D----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iQCVAwUBQH/soVoikN4/5jfsAQKA1wP/RFBrTCAGxmNk6lJbCbCFZdDeizUY3ZXp
pR7UKNpMoXwLNZvb1CZD9fqIAG8Gwo915ZgSsSPfaN2YbJfZ7vabCzYl3hzHp3Lg
1jaEQRMXYaiSEZMdVzWMtiFvKPPKi2+PwPfMks8z5tMlrlEywAR6BIrzcOMM/NU+
hUyAfiuPK2U=3D
=3DydFQ
=2D----END PGP SIGNATURE-----
