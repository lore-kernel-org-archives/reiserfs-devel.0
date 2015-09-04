From: Ivan Shapovalov <intelfx100@gmail.com>
Subject: Re: Reiser4 for Linux-4.1
Date: Fri, 04 Sep 2015 03:25:03 +0300
Message-ID: <1441326303.12422.11.camel@gmail.com>
References: <55C49E4A.5000803@gmail.com>
	 <1441325851.12422.5.camel@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-YPtB6CENbrJTsgQuQ7fq"
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:subject:from:to:date:in-reply-to:references:content-type
         :mime-version;
        bh=dvva+WVM4wjifvyJEGjADjT4eV+hS0Ptpss9LzKGUJU=;
        b=eLjh7HJJ4lYWBSVKB/1GfBiXTQVyh9syAdw0psmZ5ND8W6FdRG0+t92ljTerNPVY3W
         EX89i0/sBi85Wy9X8GF6ctXX2hY7SlbD7v2tCxDlPAkftyI/qBk273mxf/6Xnda6W0ac
         se/ZM5gFU8MRGz9mbyS1Wx35STbj6RZU6IwdrEVeh2YdnBaZV80WymhWotYYLDFvGL0d
         s0FFkcSxvKQQlVDe72d6yVPQ12L73KPHd9aR/M2mNOSpX3F8IG2msLAJPLSfgrMjYNkY
         F4AndsxwiXkJD54MneL3czc4DbPm5yzve+B7Poei76NdW402vqCM1ngUUKa0cIV4imBj
         2e4w==
In-Reply-To: <1441325851.12422.5.camel@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
To: Edward Shishkin <edward.shishkin@gmail.com>, Reiserfs development mailing list <reiserfs-devel@vger.kernel.org>


--=-YPtB6CENbrJTsgQuQ7fq
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On 2015-09-04 at 03:17 +0300, Ivan Shapovalov wrote:
> On 2015-08-07 at 14:02 +0200, Edward Shishkin wrote:
> > Changes since Reiser4 for Linux-4.0.4:
> >=20
> > Fixed a problem appearing when running under "no space left on
> > device". It also could be the reason of sporadic silent non
> > -reproducible
> > data corruptions, that were reported periodically.
> >=20
> > The fixup was backported to Linux-4.0 (see reiser4-for-4.0.9).
> > If you need a backport for older kernel, then let me know.
> >=20
> > Please, find at
> > http://sourceforge.net/projects/reiser4/files/reiser4-for-linux-4.x
> > /
>=20
> Hi Edward,
>=20
> could you please send the fixup in a separate patch/mail (git
> -format)?

While at it, could you please consider having a dedicated git tree for
reiser4, which would serve same purposes as the sourceforge project,
but with per-commit granularity instead of per-release?

I'm trying to maintain one (by simply picking all patches that fly over
the mailing list), but, to my surprise, it seems to have slightly
diverged from your releases.

--=20
Ivan Shapovalov / intelfx /


--=-YPtB6CENbrJTsgQuQ7fq
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iF4EABEIAAYFAlXo5N8ACgkQxUKljSIMAnAQ4AD9FL9xOe137UZyw9GE/Mo8QpgR
VEwxElRZTvIX1EsGSXoBAOwIYeG35YQP092w00UjivYox1GuWJrOS4f3el5Al1+5
=qu8M
-----END PGP SIGNATURE-----

--=-YPtB6CENbrJTsgQuQ7fq--

