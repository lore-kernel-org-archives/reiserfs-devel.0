From: Stewart Smith <stewart@flamingspork.com>
Subject: Re: Can compression at filesystem level improve
	overall	performance?
Date: Thu, 08 Apr 2004 21:47:58 +1000
Message-ID: <1081424878.2946.13.camel@kennedy>
References: <405B02ED.4010602@solidcode.net>
	 <1079713790.9729.1.camel@redeeman.linux.dk>
	 <16475.9613.375262.677576@laputa.namesys.com>
	 <1079978427.4658.63.camel@localhost.localdomain>
	 <405F46D8.1040607@namesys.com>
	 <1080011016.4658.408.camel@localhost.localdomain>
	 <20040329051614.GA19372@zero>
	 <1080617661.31924.91.camel@localhost.localdomain>
	 <20040330045359.GA22957@zero>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-WOSP1AMQw5mZ0jpHpG/e"
Return-path: <reiserfs-list-return-17792-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20040330045359.GA22957@zero>
List-Id: <reiserfs-devel.vger.kernel.org>
To: Tom Vier <tmv@comcast.net>
Cc: Scott Young <youngs1@sunyit.edu>, reiserfs-list@namesys.com

--=-WOSP1AMQw5mZ0jpHpG/e
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Tue, 2004-03-30 at 14:53, Tom Vier wrote:
> an online defragger is an interesting idea. i think i remember the topic
> coming up for ext2 along time ago. iirc, reiserfs can lose performance ov=
er
> time (usage, actually), too.

XFS has this, xfs_fsr (part of xfsdump package on debian, might be
called that on other distros too...)

Although... it's pretty hard to get XFS to fragment in the first place,
which is the best way to do things - but it's a hard way :)

--=20
Stewart Smith (stewart@flamingspork.com)
http://www.flamingspork.com/


--=-WOSP1AMQw5mZ0jpHpG/e
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQBAdTvt3tgLgERgy8oRAsLbAKCVtEmxqoD1ZPzlxVjntpkSzPclegCg0UsT
ijyPBfcr9Bc1aHiyqQkF5E0=
=C97w
-----END PGP SIGNATURE-----

--=-WOSP1AMQw5mZ0jpHpG/e--

