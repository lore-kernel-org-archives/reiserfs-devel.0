From: Daniel Egger <degger@fhm.edu>
Subject: Re: Reiser4 status: benchmarked vs. V3 (and ext3)
Date: 25 Jul 2003 02:39:55 +0200
Message-ID: <1059093594.29239.314.camel@sonja>
References: <3F1EF7DB.2010805@namesys.com>
	 <1059062380.29238.260.camel@sonja>
	 <16160.4704.102110.352311@laputa.namesys.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-WAGhnsVHvBZLC9drdu+e"
Return-path: <reiserfs-list-return-15042-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <16160.4704.102110.352311@laputa.namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
To: Nikita Danilov <Nikita@Namesys.COM>
Cc: Hans Reiser <reiser@namesys.com>, linux-kernel@vger.kernel.org, reiserfs mailing list <reiserfs-list@namesys.com>

--=-WAGhnsVHvBZLC9drdu+e
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Am Don, 2003-07-24 um 19.07 schrieb Nikita Danilov:

> I don't know enough about jffs2, but you can read about reiser4's
> "wandering logs" and transaction manager design at the
> http://www.namesys.com/txn-doc.html.

I've read it by now, thanks for the reference.

> Briefly speaking, in usual WAL (write-ahead logging) transaction system,
> whenever block is modified, journal record, describing changes to this
> block is forced to the on-disk journal before modified block is allowed
> to be written. In the worst case this means that data are written twice.

Is there way to influence what is considered free space for the
wandering blocks or is it a fixed algorithm? If the latter, what is the
access pattern on the free space (like pseudorandom, cyclic linear,
hashed)?

> I should warn everybody that reiser4 is _highly_ _experimental_ at this
> moment. Don't use it for production.

That certainly doesn't stop me from trying... :)
Have you ran any tests to test the durabilty of your "transcrash" system
for instance against sudden power dropouts?
Is the filesystem selfhealing or does one need fsck.reiserfs for it? If
the latter: will it do the right thing (i.e. automatically bring the
system into consistent shape not like ext3) when invoked with "-y"?

--=20
Servus,
       Daniel

--=-WAGhnsVHvBZLC9drdu+e
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: Dies ist ein digital signierter Nachrichtenteil

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.2 (GNU/Linux)

iD8DBQA/IHxachlzsq9KoIYRApIMAJ9JQWBKJSYBAcGqSQXkolLp5LpQfQCfQJtx
kkmPLHj75ix2WcAtSjgwZEM=
=4jgL
-----END PGP SIGNATURE-----

--=-WAGhnsVHvBZLC9drdu+e--

