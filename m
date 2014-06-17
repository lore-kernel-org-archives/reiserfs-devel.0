From: Ivan Shapovalov <intelfx100@gmail.com>
Subject: Re: reiser4: discard implementation, pass 2: allocation issues
Date: Tue, 17 Jun 2014 14:14:19 +0400
Message-ID: <2537417.F0W18VYPYg@intelfx-laptop>
References: <3401431.jj87z7i0xD@intelfx-laptop> <3381547.FkGuFJAHk4@intelfx-laptop> <539F8DBC.4010000@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart1459017.vtpGAIDuq2"; micalg="pgp-sha256"; protocol="application/pgp-signature"
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=from:to:cc:subject:date:message-id:user-agent:in-reply-to
         :references:mime-version:content-type;
        bh=TUsI5G044zSBDF/U61PEiWYXrw1TW2SK1AybWI8DTi0=;
        b=gqelA3hpGKDdEOwBYrwT+34DEqMsGpjDf/uAyyn/rZoI035TV11SLZNhgMg93L9nuZ
         CnDDuZqzHrJEffxvnBUKPymOXefHmsvGRdakEGa80SVD1GlJb34sjJDr4TJUcuMafzRb
         SzJrD9aG1OmbQKv0RBXDno6Up1vr6mSB5TgoxyHoB4deRSWYMfH9uU2Da6JYYHes4Zw+
         aIWVYwuD7P7yKu5fi9FfIV0Ni9gra5Zn75a3u8VArFxdotLmUaiRIcnubXKAK8Exrqiq
         AlEimMMevjCnjt6D8jOs/KFuBBT/ZI1/Lc++//22Zc95VY0EJ/eXScw6h2Ja+sIloPeg
         +jDg==
In-Reply-To: <539F8DBC.4010000@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
To: Edward Shishkin <edward.shishkin@gmail.com>
Cc: reiserfs-devel@vger.kernel.org


--nextPart1459017.vtpGAIDuq2
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="us-ascii"

On Tuesday 17 June 2014 at 02:37:16, Edward Shishkin wrote:=09
>=20
> [...]
>=20
> Yup, blocknr sets minimize memory consumption and are unsortable...
>=20
> I think that the cleanest option will be using lists (instead of bloc=
knr=20
> sets) for
> the delete sets, if the discard is turned on. It will reduce memory=20=

> consumption
> by 20%. Indeed, every entry in a blocknr_set occupies ~8 bytes (assum=
ing
> that everything is pretty fragmented because of txmod=3Dwa), whereas =
a list
> entry occupies 32 bytes (start, length, plus 2 pointers for the link)=
.
>=20
> In this option we'll need to join lists (instead of merging blocknr=20=

> sets) during
> atoms fusion and apply the list (instead of blocknr set) to the COMMI=
T=20
> BITMAP
> at pre_commit_hook(). I think it won't be a problem, since the lists =
are=20
> simpler
> than blocknr sets.

That's a neat approach. I think I'll use unions and do the decision at =
runtime.

=2D-=20
Ivan Shapovalov / intelfx /

>=20
> The next option is to leave everything as is.
--nextPart1459017.vtpGAIDuq2
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iF4EABEIAAYFAlOgFP8ACgkQxUKljSIMAnAfPgEAj8GX6hE4m6PBomYT/1dsPRSG
aZUqir4L2H4giano8UoA/iooIClpFrvv3gKASkcNk2p6j5sb4vBstsFCpdhrllXB
=icTb
-----END PGP SIGNATURE-----

--nextPart1459017.vtpGAIDuq2--

