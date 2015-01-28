From: Ivan Shapovalov <intelfx100@gmail.com>
Subject: Re: In the future, will a r4 patch be created for linux 3.18.x
 series and patches
Date: Thu, 29 Jan 2015 02:21:54 +0300
Message-ID: <1422487314.8468.4.camel@gmail.com>
References: <d72614d46b84a7c4a1f1728e4742232b@mail.velocitynet.com.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-KoursoXuPmE777oSUAV3"
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :content-type:mime-version;
        bh=hEN7FtsoPrAWcEcRYP1DXET+2rlI0wHjPW+dpiZQzgE=;
        b=Gol9XBoDOuHlE2DvemmzVNvxH31lk9xm+NDwvbkR4XCXNf/YeMHHl/T9TJURTTMRjw
         ZcqEvfCJcWW8uY3jlzQfeonviFDADzvjSeggVNhQUPxWSkpmC0/EZX+5Fo+99tOrAFTY
         e3NGjwYXl/YTcc2kHcV1htFAmekcDZFvyUQiqmdvIAxpMHk1yHJmw/nkEB03Y0If0CVE
         qErkwXv7vnMRkHIYAo7R6Cdt4inVTGZQY7iE5ejGyYCj1wcNBnTiaKvsqZYedfdYC4hs
         g7hcLJabtHxJxuQyJdRnl6hBIw7vFnlSK4mR2ISSbPQjBSK9kO31wT3aAaSf8SlzTIVy
         tKbQ==
In-Reply-To: <d72614d46b84a7c4a1f1728e4742232b@mail.velocitynet.com.au>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
To: doiggl@velocitynet.com.au
Cc: reiserfs-devel@vger.kernel.org, Edward Shishkin <edward.shishkin@gmail.com>


--=-KoursoXuPmE777oSUAV3
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On 2015-01-14 at 20:18 +1100, doiggl@velocitynet.com.au wrote:
> Hello,
> In the future, will a r4 patch be created for linux 3.18.x series and
> patches
>=20
> Just asking.
> Cheers Glenn

Actually, reiser4 does not need porting for 3.17 -> 3.18, there's just
a single merge conflict. I've been running 3.18 with reiser4 this way
all time since its release...

to Edward: maybe you could release reiser4-for-3.18 just with that merge
conflict fixed?

P. S.: I haven't yet tested your precise discard implementation. I've
been pretty busy with the exam session (which has just ended, so I'll
get to testing it in short time).

--=20
Ivan Shapovalov / intelfx /

--=-KoursoXuPmE777oSUAV3
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iF4EABEIAAYFAlTJbxIACgkQxUKljSIMAnC7BAD+IYqat3LHLj8iZdQXEWwwQ0lu
iP0UZjcocNnmUVHGqM0BAMS4NowZRoscR1yg0xs/X8jP5lrlnCzFuuwLM5Pmz/9H
=JbrL
-----END PGP SIGNATURE-----

--=-KoursoXuPmE777oSUAV3--

