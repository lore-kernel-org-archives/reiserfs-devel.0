From: Robert Walsh <rjwalsh@durables.org>
Subject: Re: Journal writes hanging in presence of I/O errors
Date: 08 Aug 2002 13:15:19 -0700
Message-ID: <1028837720.11334.27.camel@spoon.durables.org>
References: <1028828929.9189.25.camel@spoon.durables.org> 
	<1028836637.5940.16.camel@oberon.rnd.esoft.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature";
	boundary="=-+As0fpvFIHtm724OSp/0"
Return-path: <reiserfs-list-return-11145-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1028836637.5940.16.camel@oberon.rnd.esoft.com>
List-Id: <reiserfs-devel.vger.kernel.org>
To: Jonathan Briggs <jbriggs@esoft.com>
Cc: ReiserFS List <reiserfs-list@namesys.com>

--=-+As0fpvFIHtm724OSp/0
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

> Bad blocks and disk errors are a problem for every file system.  Modern
> hard drives handle bad sectors by using the firmware to relocate to a
> good sector.  The Linux kernel should have another layer (LVM, probably)
> between the hard drive and the file system that can do the same thing.=20
> The LVM layer should replace bad physical blocks with good ones.  This
> way, the file system never needs to worry about it, except perhaps by
> setting a fsck-required flag.  File system check would be required
> because on a read error, the replacement block wouldn't contain the
> correct data.

This would work for small numbers of bad blocks, but for something more
catastrophic, it might not be suitable.  If you only have one physical
drive underneath and it seizes up or something, then you've got issues
that deferring it to the LVM isn't going to help with.  You still need
to check that your block I/O worked.

Regards,
 Robert.

--=20
Robert Walsh
Amalgamated Durables, Inc.  -  "We don't make the things you buy."
Email: rjwalsh@durables.org

--=-+As0fpvFIHtm724OSp/0
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQA9UtFXbZtqSALM5CYRAlRIAJ9zkKUELztYEnA3ICUqA3tsAbWtJACfUK0E
zoqeyA6MAdBQRGg/fIwlH+A=
=rL9z
-----END PGP SIGNATURE-----

--=-+As0fpvFIHtm724OSp/0--

