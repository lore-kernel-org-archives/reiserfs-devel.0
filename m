From: Simon Raffeiner <sturmflut@lieberbiber.de>
Subject: Re: flush file system
Date: Sat, 26 Mar 2005 20:36:50 +0100
Message-ID: <200503262036.53671.sturmflut@lieberbiber.de>
References: <20050326085141.GA29906@sue.caltech.edu> <d904a5e705032606173196f6e@mail.gmail.com>
Reply-To: sturmflut@lieberbiber.de
Mime-Version: 1.0
Content-Type: multipart/signed;
  boundary="nextPart1742793.QvlnojP62x";
  protocol="application/pgp-signature";
  micalg=pgp-sha1
Content-Transfer-Encoding: 7bit
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <d904a5e705032606173196f6e@mail.gmail.com>
List-Id: <reiserfs-devel.vger.kernel.org>
To: John Sconiers <jsconiers@gmail.com>, reiserfs-list@namesys.com

--nextPart1742793.QvlnojP62x
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Should be "sync" on Linux, regardless of the underlying file system.

Am Samstag, 26. M=E4rz 2005 15:17 schrieb John Sconiers:
> Is there a reiserfs command to flush the pending wriets to the file syste=
m?
> JOHN

--nextPart1742793.QvlnojP62x
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.1 (GNU/Linux)

iD8DBQBCRbnVd2q78rIgT6ARAtNlAJ90VqVx+DEYL/O5TA/BFzsxABVDDgCeNMM8
eGVGbos13k/8FDHT6qJCNE0=
=7bNZ
-----END PGP SIGNATURE-----

--nextPart1742793.QvlnojP62x--
