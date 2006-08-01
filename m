From: Sander Sweers <sander.sweers@gmail.com>
Subject: Ebuild/rpm/deb repo's (was Re: reiser4 can now bear with filled
	fs, looks stable to me...)
Date: Tue, 01 Aug 2006 20:10:34 +0200
Message-ID: <1154455834.10745.21.camel@localhost>
References: <20060730223755.GA14386@hermes.uziel.local>
	 <44CD4127.9010202@slaphack.com> <11910177823.20060731232849@wp.pl>
	 <44CE7A3A.2010503@slaphack.com>  <1256888283.20060801132818@wp.pl>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-29411-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1256888283.20060801132818@wp.pl>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: reiserfs-list@namesys.com

On Tue, 2006-08-01 at 13:28 +0200, Maciej So=B3tysiak wrote:
> Hello David,
>=20
> Monday, July 31, 2006, 11:46:34 PM, you wrote:
> > You must be new here...
> ;-)
>=20
> I wanted to point out that because:
> > Options B and C are all that ever seems to happen when reiserfs-list and
> > lkml collide.
>=20
> and:
> >   The speed of a nonworking program is irrelevant.
> >   The cost-effectiveness of an impossible solution is irrelevant.
>=20
> maybe the more important thing is to allow people use r4 on their own
> (rpms, debs, apt/gentoo/repositories, etc.) better, than to push that har=
d for kernel inclusion.
>=20

Yes, and in case of gentoo there are already people maintaining an
ebuild which pull in r4 on the wiki.
http://gentoo-wiki.com/HOWTO_Reiser4_With_Gentoo-Sources

WHen you make it easy for people to use reiser4 by providing ebuilds,
rpm's or deb's more users will be tempted to try out reiser4 who would
normally not be able or willing to patch the kernel.

Maintaning an ebuild for example is easy. And adding in another patch to
a kernel deb/rpm should also not be too difficult. It will take some
time to do each month but sacrificing a few hours to update these to me
would be worth it.

Maybe the reiser cummunity can help out the namesys devs?

Greets
Sander



