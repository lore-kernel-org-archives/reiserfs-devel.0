From: Mike Benoit <ipso@snappymail.ca>
Subject: Re: ReiserFS v3 choking when free space falls below 10%?
Date: Fri, 07 Jul 2006 13:18:03 -0700
Message-ID: <1152303483.13211.56.camel@ipso.snappymail.ca>
References: <44A55271.7050501@namesys.com> <44A55591.6060500@suse.com>
	 <1152059846.30139.11.camel@ipso.snappymail.ca>
	 <44AB25EE.8030702@namesys.com>
	 <20060706125856.fdac1d16.pegasus@nerv.eu.org>
	 <1152200638.30139.45.camel@ipso.snappymail.ca> <44AD5020.6050803@suse.com>
	 <1152210439.30139.59.camel@ipso.snappymail.ca> <44AD58D1.9040806@suse.com>
	 <1152257397.13211.43.camel@ipso.snappymail.ca>
	 <20060707174935.GB13606@atrey.karlin.mff.cuni.cz>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-8UjT32tBA1z2LTqHQ7vJ"
Return-path: <reiserfs-list-return-28939-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20060707174935.GB13606@atrey.karlin.mff.cuni.cz>
List-Id: <reiserfs-devel.vger.kernel.org>
To: Jan Kara <jack@suse.cz>
Cc: Jeff Mahoney <jeffm@suse.com>, Jure =?UTF-8?Q?Pe=C4=8Dar?= <pegasus@nerv.eu.org>, Hans Reiser <reiser@namesys.com>, reiserfs-list@namesys.com

--=-8UjT32tBA1z2LTqHQ7vJ
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Fri, 2006-07-07 at 19:49 +0200, Jan Kara wrote:
>   Hi,
>=20
>   just one note: I've looked to the in scan_bitmap() in bitmap.c. There i=
s:
>         /* When the bitmap is more than 10% free, anyone can allocate.
>          * When it's less than 10% free, only files that already use the
>          * bitmap are allowed. Once we pass 80% full, this restriction
>          * is lifted.
>          *
>          * We do this so that files that grow later still have space
>          * close to
>          * their original allocation. This improves locality, and
>          * presumably
>          * performance as a result.
>          *
>          * This is only an allocation policy and does not make up for
>          * getting a
>          * bad hint. Decent hinting must be implemented for this to work
>          * well.
>          */
>         if (TEST_OPTION(skip_busy, s)
>             && SB_FREE_BLOCKS(s) > SB_BLOCK_COUNT(s) / 20) {
>=20
>    So the comment suggests we should lift the restriction when we are 80%
> full but if you see the condition, it checks wherher we are 95% full! I
> guess that is really asking for trouble and could explain the
> behaviour...
>   Mike could you try changing that 20 in the test to 5? IMHO that could
> fix your problem.

I've recompiled my kernel with this suggested change, and so far I have
surpassed (just barely) the free space "trigger" point that occurred
twice yesterday.=20

I'll keep the recordings going so I can give you guys more conclusive
results in a couple hours.

--=20
Mike Benoit <ipso@snappymail.ca>

--=-8UjT32tBA1z2LTqHQ7vJ
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.2 (GNU/Linux)

iD8DBQBErsF7MhKjsejwBhgRAp8aAJ48ddKwXRi/nhNU6pm+vRmONTONZwCfVPCZ
PO/Sz/i6SMSohQA5LoUP2O8=
=Ddji
-----END PGP SIGNATURE-----

--=-8UjT32tBA1z2LTqHQ7vJ--

