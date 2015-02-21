From: Ivan Shapovalov <intelfx100@gmail.com>
Subject: Re: Bundling patches together.
Date: Sat, 21 Feb 2015 13:12:18 +0300
Message-ID: <1424513538.29814.1.camel@gmail.com>
References: <a93e264428ba5eaa329137f88ff880c6@mail.velocitynet.com.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-MR2vapu5vflLHATcx6hY"
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :content-type:mime-version;
        bh=hePX+23EoQDXMQ8U/AaqJBaV+tpoqdLybg5IGXSoRdE=;
        b=RF/lFyIaazNdlfzm7YkXsPcjVp0A3maixNraISkagNyvJcmfZmLxgDVLdCoDmAEYKE
         8nUeEBwTLd7wcLFfktXqKunIIrzu7KZtSLJmZAs6unnOLHEskHnwifxubC62/3KTBik0
         qNgX7SZJpLCAc0+v5uLM8BOI448I0llTvpvD1Rx6++2iL3nF4SBxOFlAFmvm3OO2+242
         4FbdRqs6DVk+O7AOU4SBLq6AimPC7strBlosoumohenbyKGMA9IJyp3SL5WoOwBhJtfo
         vPsNbuR1Sc0436bHsJa7qP2UwQOQ6+66Flj3kJJLRZoTPAoHhtuxw2n3U4LQPdWCc0RD
         i5Ww==
In-Reply-To: <a93e264428ba5eaa329137f88ff880c6@mail.velocitynet.com.au>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
To: doiggl@velocitynet.com.au
Cc: reiserfs-devel@vger.kernel.org


--=-MR2vapu5vflLHATcx6hY
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On 2015-02-21 at 16:59 +1100, doiggl@velocitynet.com.au wrote:
> Hello Ivan,
> Can you provide a single patch for [1] when it accepted into Reiser4.
>=20
> [1]
> [PATCHv5 00/10] reiser4: batch discard support (FITRIM ioctl): initial
> implementation
>=20
> Reaon for asking:
> Easier to apply one patch rather than ten and minimises risk of missing a
> part of the patch.

Hi Glenn,

let me say this again: if/when any patches are reviewed and added into
reiser4, they will be merged with the main patch. So if you are just
building kernels, you do not need to worry about any other patches
floating around the mailing list. Just grab what you see from the
project page at sourceforge.

HTHs,
--=20
Ivan Shapovalov / intelfx /

--=-MR2vapu5vflLHATcx6hY
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iF4EABEIAAYFAlToWgQACgkQxUKljSIMAnBUZwD/Wlpls8DL5BmgVC/NBvdogZ+I
3DSQwrxNDlgHVjG6TOwBAKxLL+DgGlfp37CLNWk5iipDYflChWi71oM6Z1rxVW8u
=IIdQ
-----END PGP SIGNATURE-----

--=-MR2vapu5vflLHATcx6hY--

