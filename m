From: Matthew Toseland <mtoseland@blueyonder.co.uk>
Subject: Re: Howto mount without replay?
Date: Tue, 14 May 2002 23:21:55 +0100
Message-ID: <20020514222155.GD12918@amphibian.dyndns.org>
References: <Pine.LNX.4.44.0205022236450.22979-100000@mooru.gurulabs.com> <Pine.LNX.4.44.0205022252320.22979-100000@mooru.gurulabs.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Km1U/tdNT/EmXiR1"
Return-path: <reiserfs-list-return-10307-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.44.0205022252320.22979-100000@mooru.gurulabs.com>
List-Id: <reiserfs-devel.vger.kernel.org>
To: Dax Kelson <dax@gurulabs.com>
Cc: reiserfs-list@namesys.com

--Km1U/tdNT/EmXiR1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 02, 2002 at 10:53:52PM -0600, Dax Kelson wrote:
>=20
> I don't care about this filesystem or drive other than I need to get a fe=
w=20
> files off of it.
>=20
> Is there anyway to mount it without it attempting the log replay?
Can you dd the whole partition to a (writable) file somewhere, then mount -=
o loop
that?
>=20
> Dax
>=20
>=20

--Km1U/tdNT/EmXiR1
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQE84Y4DmlVGrEH/+qIRAosjAJ48yhPGZFXyElVBRQgtnYhLdRmY/ACfdwp3
wYDlrLBU0MjVsngnAuKzeZU=
=GFf+
-----END PGP SIGNATURE-----

--Km1U/tdNT/EmXiR1--
