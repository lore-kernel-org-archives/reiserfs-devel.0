From: Bruce Guenter <lists-reiserfs-list@bruce-guenter.dyndns.org>
Subject: Re: Reiserfs concurrent write problems
Date: Tue, 27 Apr 2004 14:15:59 -0600
Message-ID: <20040427201559.GA17186@em.ca>
References: <20040426172648.GA22918@em.ca> <1083000970.30344.50.camel@watt.suse.com> <20040427161544.GA27873@em.ca> <1083088841.30344.131.camel@watt.suse.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="rwEMma7ioTxnRzrJ"
Return-path: <reiserfs-list-return-18257-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <1083088841.30344.131.camel@watt.suse.com>
List-Id: <reiserfs-devel.vger.kernel.org>
To: reiserfs-list@namesys.com

--rwEMma7ioTxnRzrJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 27, 2004 at 02:00:41PM -0400, Chris Mason wrote:
> Good to hear, could I trouble you to ping me (or better yet
> reiserfs-list) when you have the graphs updated?

For sure.

> Other notes about 2.6.6-rc2-mm2, it has some ext3 optimizations as well,
> you might want to rebenchmark there.

I am re-running all of the benchmarks, actually, as well as doing some
tweaking to the XFS options.

> reiserfs defaults to -o
> data=3Dordered in the 2.6.6-rc2 (and -mm), you should get slightly better
> numbers with -o data=3Dwriteback.

I will try that, as well as data=3Djournal (which I understand is one of
the new features in the -mm patches).  The production system will not
run data=3Dwriteback, but it is still a useful number.

Thanks.
--=20
Bruce Guenter <bruceg@em.ca> http://em.ca/~bruceg/ http://untroubled.org/
OpenPGP key: 699980E8 / D0B7 C8DD 365D A395 29DA  2E2A E96F B2DC 6999 80E8

--rwEMma7ioTxnRzrJ
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQFAjr9+6W+y3GmZgOgRAiq8AJkBoWk6rkxY7CNTZ/RyPFm3sgJkrQCfQ60N
eHB94LnLL3zBVcVoC7jb9vI=
=AETk
-----END PGP SIGNATURE-----

--rwEMma7ioTxnRzrJ--
