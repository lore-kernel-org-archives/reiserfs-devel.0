From: Bruce Guenter <lists-reiserfs-list@bruce-guenter.dyndns.org>
Subject: Re: Reiserfs concurrent write problems
Date: Thu, 29 Apr 2004 13:04:03 -0600
Message-ID: <20040429190403.GA4015@em.ca>
References: <20040426172648.GA22918@em.ca> <1083000970.30344.50.camel@watt.suse.com> <20040427161544.GA27873@em.ca> <1083088841.30344.131.camel@watt.suse.com> <20040427201559.GA17186@em.ca> <1083196101.30344.222.camel@watt.suse.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="YiEDa0DAkWCtVeE4"
Return-path: <reiserfs-list-return-18293-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <1083196101.30344.222.camel@watt.suse.com>
List-Id: <reiserfs-devel.vger.kernel.org>
To: reiserfs-list@namesys.com

--YiEDa0DAkWCtVeE4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 28, 2004 at 07:48:22PM -0400, Chris Mason wrote:
> reiserfs doesn't need as large a log as ext3 in order to get good
> numbers for fsync heavy workloads.  This is good because reiserfs also
> pins the logged buffers more then ext3 does, so a 132mb log on reiserfs
> is likely to tie up that much ram in pinned metadata.  You might want to
> experiment a little with the log size.

Noted.  Having extra RAM tied up is likely to only show up in the read
performance.

> I'm a little confused about how an external log slows things down,
> please let me know if you see those results with the new patches.

With 2.6.6-rc2-mm2, having an external log makes it considerably faster, up
to 16-concurrency level, where it is somewhat slower.

I'd post the new results, but ext3 is behaving very weird under this
kernel -- doing a single transaction takes up to 950ms to complete,
which is more than an order of magnitude too big.

> Your sequence is this:
>=20
> write(tmp file)
> fsync(tmp file)
> rename(tmp file, somedir/new file)
> fsync(somedir)
>=20
> That last fsync holds the directory semaphore during the log commit,
> which hurts concurrency on that directory badly.

Fortunately, there is relatively little concurrency on a per-directory
level.  There are so many directories in play that there is little
chance that two processes (either reading or writing) will be in
contention for the same directory.

> Both reiserfs and ext3
> can get away with:
> rename(tmp file, somedir/new file)
> fsync(tmp file fd)
>=20
> It should be much faster.

I'll add a deferred-fsync mode to test this.

> In reiserfs data=3Djournal mode, you get strict ordering of all the
> transactions.

What about in data=3Dordered mode?

> This means you can safely do this:
> write(temp file)
> rename(temp file, somedir/new file)
> fsync(temp file fd)

How is that different from the above?

> This should hold true for ext3 as well, but you should check with the
> ext3 developers before basing any products on it.

I will double check on the ext3 list to see if they order the commits
this way.
--=20
Bruce Guenter <bruceg@em.ca> http://em.ca/~bruceg/ http://untroubled.org/
OpenPGP key: 699980E8 / D0B7 C8DD 365D A395 29DA  2E2A E96F B2DC 6999 80E8

--YiEDa0DAkWCtVeE4
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQFAkVGj6W+y3GmZgOgRAq4DAJ9yIbPF23QEyR0V48VVd0IHA0Jp0ACfXoLE
KT9JDvoaArUJbWJ0M6JJEv0=
=pvEN
-----END PGP SIGNATURE-----

--YiEDa0DAkWCtVeE4--
