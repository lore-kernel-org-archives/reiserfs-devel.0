From: Ivan Shapovalov <intelfx100@gmail.com>
Subject: Re: Patchset questions
Date: Sat, 18 Oct 2014 14:34:24 +0400
Message-ID: <3054462.Dm89DoXoDX@intelfx-laptop>
References: <0a8b3874852dd57e9f1bc13169f6d8c4@mail.velocitynet.com.au>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart2015646.9uqAUIghro"; micalg="pgp-sha256"; protocol="application/pgp-signature"
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=from:to:cc:subject:date:message-id:user-agent:in-reply-to
         :references:mime-version:content-type;
        bh=l4gG9JwIIrniKDe9cLUUQ1f/gdwIOFXLaKPs4RfeV4k=;
        b=OU+xNgqq35PWPy4hBWvJStixOFhslugMaMsznqI0PmsUEOqylm8KTNHf0qr4AvF0N1
         /TUwuG0eeCXlc9mJeknH0Xa6pRqLM0iRVR8+Gsf3gV/H07+qen8p+5+uye4xdXN+wM41
         SXTnK96sL7qsMPBc5XvGGHvfGaVjnzHmPKk5kg/fTGHHqUqvtX2nfNoNNuJiatMKuE+a
         8OGnPolverU6zZQFzYF94iUSV9VxcezS6ackiaoOzD6SPu5/cjTN/BUwplElG9H6ktqh
         CEC7yS3198dg5otk2Fn8fSlmadY8E+j8gv2g44IBdHjoIKSxmtW2aMSNcfiRS2SVFlez
         g1tA==
In-Reply-To: <0a8b3874852dd57e9f1bc13169f6d8c4@mail.velocitynet.com.au>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
To: reiserfs-devel@vger.kernel.org
Cc: doiggl@velocitynet.com.au


--nextPart2015646.9uqAUIghro
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="us-ascii"

On Saturday 18 October 2014 at 18:43:05, doiggl@velocitynet.com.au wrot=
e:=09
> Hello
> Patchset questions:
>=20
> Q1.
>  Are any r4 patches need applying or are applicable to
> reiser4-for-3.16.2.patch.gz=20
>  patches are between these timestamps 2014-08-24 or later [1]
>  This is the list I see [2]
>=20
> Cheers Glenn

Why do you need this? All patches that are posted to the mailing list a=
re more
or less WIP (work in progress). As Jeff has previously said, if you do =
not
precisely understand what are these patches for, you'd better just use =
released
versions (e. g. reiser4-for-3.16.2.patch.gz).

=2D-=20
Ivan Shapovalov / intelfx /
--nextPart2015646.9uqAUIghro
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iF4EABEIAAYFAlRCQjQACgkQxUKljSIMAnAF0AD9G2xhO1Q7GDZH8m00QkDZ7qaK
8QzR4SbWTia/QX7COjIA/2oyHt3nOqNwdTZFG4ymsmvkxaDrey824GaZv9fAU8wH
=Od3k
-----END PGP SIGNATURE-----

--nextPart2015646.9uqAUIghro--

