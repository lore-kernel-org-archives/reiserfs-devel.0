From: Christophe Saout <christophe@saout.de>
Subject: Re: silent semantic changes with reiser4
Date: Fri, 27 Aug 2004 00:29:55 +0200
Message-ID: <1093559395.13881.96.camel@leto.cs.pocnet.net>
References: <Pine.LNX.4.44.0408261356330.27909-100000@chimarrao.boston.redhat.com>
	 <200408262128.41326.vda@port.imtp.ilyichevsk.odessa.ua>
	 <20040826193617.GA21248@arlut.utexas.edu>
	 <20040826201639.GA5733@mail.shareable.org>
	 <1093551956.13881.34.camel@leto.cs.pocnet.net>
	 <16686.23053.559951.815883@thebsh.namesys.com>
	 <1093556917.13881.78.camel@leto.cs.pocnet.net>
	 <16686.25191.635556.817958@gargle.gargle.HOWL>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-D6kG2LwCayW5XS4asSLE"
Return-path: <reiserfs-list-return-20830-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <16686.25191.635556.817958@gargle.gargle.HOWL>
List-Id: <reiserfs-devel.vger.kernel.org>
To: Nikita Danilov <nikita@clusterfs.com>
Cc: Jamie Lokier <jamie@shareable.org>, Jonathan Abbey <jonabbey@arlut.utexas.edu>, Denis Vlasenko <vda@port.imtp.ilyichevsk.odessa.ua>, Rik van Riel <riel@redhat.com>, Linus Torvalds <torvalds@osdl.org>, Diego Calleja <diegocg@teleline.es>, christer@weinigel.se, spam@tnonline.net, akpm@osdl.org, wichert@wiggy.net, jra@samba.org, reiser@namesys.com, hch@lst.de, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, flx@namesys.com, reiserfs-list@namesys.com

--=-D6kG2LwCayW5XS4asSLE
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Am Freitag, den 27.08.2004, 02:21 +0400 schrieb Nikita Danilov:

>  > BTW, I can do a cd metas/metas/metas/metas/plugin/metas... I don't thi=
nk
>  > this makes sense. :)
>=20
> Why? foo/metas is a file system object just like foo. It has owner,
> permission bits, so access to its meta-data should be provided, and
> uniform way to provide access to the file system object meta-data is to
> have these little magic files inside metas directory, which is a file
> system object just like metas. It has owner^@^@^@^@*** - Lisp stack
> overflow. RESET

Yes, of course. But who's going to need that? The meta files are there
to describe regular unix files. They're just exported using a file
system name space. I don't think we need metadata to describe metadata.
Assuming someone adds a directory inside a file where user can add some
attributes/streams/resource forks. As Linus said, they are just
attributes, even if they seem to behave like normal files, they're not,
they belong to the real file. Adding attributes to attributes to
attributes? That would be like adding ACLS to ACLS. Hello the
madness. ;-)

There really should be a point where you can't recurse further. Assume
there is a backup application that always tries to open every dentry it
finds as directory and then recurse. Oops. :-)


--=-D6kG2LwCayW5XS4asSLE
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: Dies ist ein digital signierter Nachrichtenteil

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.5 (GNU/Linux)

iD8DBQBBLmRiZCYBcts5dM0RApIGAJ4jufroIN+i0L2H8c8vIRGwdYWjDQCfewZF
SyA1ccDnXD0lIqK251DcNwY=
=uBJS
-----END PGP SIGNATURE-----

--=-D6kG2LwCayW5XS4asSLE--

