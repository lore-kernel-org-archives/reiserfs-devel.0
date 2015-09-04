From: Ivan Shapovalov <intelfx100@gmail.com>
Subject: Re: Reiser4 for Linux-4.1
Date: Fri, 04 Sep 2015 03:17:31 +0300
Message-ID: <1441325851.12422.5.camel@gmail.com>
References: <55C49E4A.5000803@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-Ke75LKWPijRlX47YkoAt"
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:subject:from:to:date:in-reply-to:references:content-type
         :mime-version;
        bh=SiDD3OuAOG7JQcpOIwDISBuz5EsDnGmrQJbIQMdc/Bs=;
        b=1HdcEcZ2l6eGTqqlFSxwGR/I7OS7EFPvXu1E3wY6Yl/36yhqSJpNTZ90//nfSE8e5J
         QACCfY9aP8tVxn10Kt6m58Abhn3idr4cpW+rQGlYDj8Fk0iPmCAgMfhoWkh3YiZtm/lA
         8UugKvxjeH87+O3HI+nSng0hBfkDKZfOVf8duF6qdE/1BlC+bw+8X8f0nDV2mTtDw11j
         aWrmIONgJ76ktTDtHUH7yohiDKTrExvWH9RMolPZiMJCpmfCrc97PTSYWDPRLPhDwuiJ
         BqtHiKTQ1UyD0Aks7v8W+/joX4meVQKN1yMg6HOAi7lDQes4JATC1G3gZwVqK+LIx8Dq
         HrMg==
In-Reply-To: <55C49E4A.5000803@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
To: Edward Shishkin <edward.shishkin@gmail.com>, Reiserfs development mailing list <reiserfs-devel@vger.kernel.org>


--=-Ke75LKWPijRlX47YkoAt
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On 2015-08-07 at 14:02 +0200, Edward Shishkin wrote:
> Changes since Reiser4 for Linux-4.0.4:
>=20
> Fixed a problem appearing when running under "no space left on
> device". It also could be the reason of sporadic silent non
> -reproducible
> data corruptions, that were reported periodically.
>=20
> The fixup was backported to Linux-4.0 (see reiser4-for-4.0.9).
> If you need a backport for older kernel, then let me know.
>=20
> Please, find at
> http://sourceforge.net/projects/reiser4/files/reiser4-for-linux-4.x/

Hi Edward,

could you please send the fixup in a separate patch/mail (git-format)?

/* btw, I did not forget about finishing discard support etc. I've
found myself to be slightly overwhelmed with various things since a
month ago, so it's just no time currently. */

Thanks,
--=20
Ivan Shapovalov / intelfx /


--=-Ke75LKWPijRlX47YkoAt
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iF4EABEIAAYFAlXo4xsACgkQxUKljSIMAnC9PgD/Sjc+Mnu3pcvBLO5KABZY8g1q
djSvBMbtx3UU8Mb1wIEBAMe7BDhoP+ipJcjufJEj4C4F6DshuSOlXT04rY0/aJWa
=6ca7
-----END PGP SIGNATURE-----

--=-Ke75LKWPijRlX47YkoAt--

