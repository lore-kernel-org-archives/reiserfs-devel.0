From: Jonathan Briggs <jbriggs@esoft.com>
Subject: Re: external journal questions
Date: Fri, 24 Feb 2006 09:57:37 -0700
Message-ID: <1140800258.14747.19.camel@localhost>
References: <20060221160411.65704253.pegasus@nerv.eu.org>
	 <43FD8CBA.7060307@slaphack.com>
	 <20060224115816.7624e2a8.pegasus@nerv.eu.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-PaQ/fPs+386m/iMvg47H"
Return-path: <reiserfs-list-return-28118-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20060224115816.7624e2a8.pegasus@nerv.eu.org>
List-Id: <reiserfs-devel.vger.kernel.org>
To: Reiserfs mail-list <Reiserfs-List@namesys.com>

--=-PaQ/fPs+386m/iMvg47H
Content-Type: text/plain; charset=iso-8859-2
Content-Transfer-Encoding: quoted-printable

On Fri, 2006-02-24 at 11:58 +0100, Jure Pe=E8ar wrote:
> On Thu, 23 Feb 2006 04:21:46 -0600
> David Masover <ninja@slaphack.com> wrote:
>=20
> > Where can I find the paper on why this makes sense?  Because offhand,
> > it doesn't, unless you're hoping that the majority of transactions
> > can be flushed on boot, rather than unrolled.
>=20
> Can't point you to any specific paper, but you can imagine running a
> large mailserver for hundreds of tousands of users. Plenty of
> small, random io, almost as much writes as reads. That's where ssd for
> journal makes sense.
> =20
> > I'm going to assume you aren't talking about v4, since this sounds
> > like a mission-critical production-style environment.  As I
> > understand it, v4 has a completely different way of doing journaling.
> =20
> Right and right.
> =20
> > I'm replying to you, not because I actually have an answer for you,
> > but because your case seems interesting, and I'm curious how Reiser4
> > handles it.
>=20
> Check namesys.com on "wandering logs" :)
>=20
> > Problem is, I see nowhere for this to fit in the current model of
> > Reiser4.  As I understand it, there is no concept of a separate
> > "journal" device, or of writing a file twice, because the vast
> > majority of writes are simply written out to disk in the new
> > location, and then the "commit" is updating the metadata to point to
> > the new location and free the old.
>=20
> I suppose this "wandering logs" concept is going to be much better that
> "journal file/device" concept ext3 uses, but right now it sounds like
> it needs some more optimization work.
>=20
> The cost here we all want to avoid is called seek time. Even today,
> it's still measured in miliseconds and that's a couple orders of
> magnitude more that gigaherzs cpus tick at. Reiser4 is on a good way to
> decrease this cost by spending some more cpu ticks, but because I need
> a solution "yesterday" (welcome to the real world ... or how they
> say:), I'm lookig for a more traditional approach, ssd journal.

It does sound like Reiser4 will have problems with the small email files
scenario.  Each email file will be written out and immediately sync'd,
so R4 will not have any opportunity to build up its usual delayed
allocation and wandering log.

With an external journal on SSD, data journaling and Ext3 or Reiser3,
the small email files become very efficient because the journal writes
move in a simple linear pattern across the journal.  fsync() can return
immediately once the data is in the journal and the file system can move
data from the journal to the actual disk at its own time.
--=20
Jonathan Briggs <jbriggs@esoft.com>
eSoft, Inc.

--=-PaQ/fPs+386m/iMvg47H
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.2.1 (GNU/Linux)

iD8DBQBD/zsBG8fHaOLTWwgRAkfxAJ9YPaS90aS4cGW66Nk8A2JyS6abhwCeIFVE
yxYWRnESK+qc3M2ydksJnto=
=LvN7
-----END PGP SIGNATURE-----

--=-PaQ/fPs+386m/iMvg47H--

