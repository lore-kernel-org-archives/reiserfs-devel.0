From: Tonnerre <tonnerre@thundrix.ch>
Subject: Re: The argument for fs assistance in handling archives
Date: Sun, 5 Sep 2004 15:28:10 +0200
Sender: linux-fsdevel-owner@vger.kernel.org
Message-ID: <20040905132810.GM26560@thundrix.ch>
References: <Pine.LNX.4.58.0409011311150.2295@ppc970.osdl.org> <20040902002431.GN31934@mail.shareable.org> <413694E6.7010606@slaphack.com> <Pine.LNX.4.58.0409012037300.2295@ppc970.osdl.org> <4136A14E.9010303@slaphack.com> <Pine.LNX.4.58.0409012259340.2295@ppc970.osdl.org> <4136C876.5010806@namesys.com> <Pine.LNX.4.58.0409020030220.2295@ppc970.osdl.org> <4136E0B6.4000705@namesys.com> <4699bb7b04090202121119a57b@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="kunpHVz1op/+13PW"
Return-path: <linux-fsdevel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <4699bb7b04090202121119a57b@mail.gmail.com>
List-Id: <reiserfs-devel.vger.kernel.org>
To: Oliver Hunt <oliverhunt@gmail.com>
Cc: Hans Reiser <reiser@namesys.com>, Linus Torvalds <torvalds@osdl.org>, David Masover <ninja@slaphack.com>, Jamie Lokier <jamie@shareable.org>, Horst von Brand <vonbrand@inf.utfsm.cl>, Adrian Bunk <bunk@fs.tum.de>, viro@parcelfarce.linux.theplanet.co.uk, Christoph Hellwig <hch@lst.de>, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, Alexander Lyamin aka FLX <flx@namesys.com>, ReiserFS List <reiserfs-list@namesys.com>


--kunpHVz1op/+13PW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Salut,

On Thu, Sep 02, 2004 at 09:12:56PM +1200, Oliver Hunt wrote:
> getNumForks(fileref){ return 1;}=20

Actually it might be even cooler  to have a generic function which you
can apply to any file on a file system (or whatever) and which returns
you the  file system's capabilities  (can write, has xattrs,  has acl,
has multiple  streams, *not* has btree  lookups etc, as  that is *not*
interesting to userland anyway.)

				Tonnerre

--kunpHVz1op/+13PW
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.9.2 (GNU/Linux)

iD8DBQFBOxRp/4bL7ovhw40RAtm6AKCVXu2FPURiqaOdSxCYJX4NiV+JrACdG0+Z
p2Jm8Y5p07XEv2tESDGiyUo=
=VoxE
-----END PGP SIGNATURE-----

--kunpHVz1op/+13PW--
