From: Ivan Shapovalov <intelfx@intelfx.name>
Subject: Re: [BUG] Big fiability issue?
Date: Wed, 06 Apr 2016 03:23:44 +0300
Message-ID: <1459902224.31752.1.camel@intelfx.name>
References: <5703DD31.50604@gmail.com>
Reply-To: intelfx@intelfx.name
Mime-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-bAijHXjEdlRozYWw9B4Y"
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=intelfx.name; s=google;
        h=message-id:subject:from:reply-to:to:cc:date:in-reply-to:references
         :mime-version;
        bh=E7Uqq+gHL0IgiKG0AB6+/jqtceUEsqhtXjushwoiJUE=;
        b=Vp0LkRLCoBI0c/a36TQLH5cVbthz39AMoNiWjflvmdLzLt6NXixJTm/p7g6kfJq+9z
         G87spYhxB7Joxozd8KNpWtJVDqH/JBydsTcdk9qQ9M/EmH9ztj0liNNS8hkL9wrTeu9H
         zl0qlfuUJt+TmIoKN+EVzfzFklDE1aPC0WU5g=
In-Reply-To: <5703DD31.50604@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
To: Edward Shishkin <edward.shishkin@gmail.com>, Mathieu =?ISO-8859-1?Q?B=E9langer?= <b747xx@gmail.com>
Cc: Reiserfs development mailing list <reiserfs-devel@vger.kernel.org>


--=-bAijHXjEdlRozYWw9B4Y
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On 2016-04-05 at 17:43 +0200, Edward Shishkin wrote:
> Hello Mathieu,
>=20
> I found that by default reiser4 still relies on a block layer
> feature,
> which is not longer supported. This is so-called "barriers". And yes,
> on the power outage bad things are bound to happen. However, it
> is up to bad luck.

Hm. Write barriers are not supported? `man mount | grep barrier` yields
many results... or are they different barriers?

--
Ivan Shapovalov / intelfx /

>=20
> The attached patch removes the rest of block barriers support in
> reiser4. So, now we honestly wait for IO completion of wandered
> blocks (overwrite set) before submitting a journal header (journal
> footer).
>=20
> Not sure if it will address your problem though. Also, data
> corruption
> after rw-mounting of checked (rebuild-fs) partition is still a
> concern.
>=20
> Thanks,
> Edward.
--=-bAijHXjEdlRozYWw9B4Y
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCgAGBQJXBFcQAAoJEHveF8jk4w6dn9YP/Al0jzvlg6hC06CqcneZBlkl
yVp3oLT+E+qSK2KyVZHM0XKaFTlG7smay4jQLGiEZwwQK6llbaE6oEJ7mpAaLiM8
0rQ6f33m+/H43QAamYQAYLys3KrCVutnnKNLmkpTK1mqYEyv0QyQ2A9kQLZba4y/
YBTO/wMBKlARi/VBNXXQyO/V2miigVfyK9mEgiO909f8se1BcCijIFy8foh4yJL1
EfBVurv4zUbPEzvCEjaykm+tIEWUIZt0D4i95hkVhcEGS8rMGTAItOBlY4dWvFy3
pIM2B/FRR2OI0MjyAreWmoQEelaG5ch3OHacgk5E9dNdo9CEAByleFJrWqbQx4RK
C3hfisVpBri67cl13Hz+Rc47eYZqC+TNM/pq1uiOZrj0XX6Aj+rRbEDvLlt/QtmQ
eyhSFq9+/VHAgv+TMSrwQSi7LdgwP5x0H3rb3wn+sxm0M6KWDDCTv/7nw3uoP3o7
SNVTt5Sv/ipFFKWQctqobpS9MklIFl9aw1J33dacX8Rxhu+rfFG2NQCfxoXkXoGw
oNo2Ws9Rl2c3VZgFeaIzWXFBRFjnR4xjNe9+IzjSr8SweDVwaz9UJcqxAX6OSGhE
Fdgxr2a6PzRPsv/RzeSY6MFVwwTcF1KoylLW3qMmyEH3loYFIMIPvfK9KfvtlkbQ
Pt+VU1jgt/BJ+rh00V29
=w9OB
-----END PGP SIGNATURE-----

--=-bAijHXjEdlRozYWw9B4Y--

