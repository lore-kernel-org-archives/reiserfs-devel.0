From: Ivan Shapovalov <intelfx100@gmail.com>
Subject: Re: When is the patch set  included in the reiser4-for-3.x...
 release ?
Date: Fri, 13 Feb 2015 06:01:11 +0300
Message-ID: <1423796471.3303.5.camel@gmail.com>
References: <1423788499-30430-1-git-send-email-intelfx100@gmail.com>
	 <b045f6704fdbb4417ce3428f4a423257@mail.velocitynet.com.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-ZX8p4b+n3e+XZVI414zR"
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :content-type:mime-version;
        bh=ba3IYE5tHFdnn74p2S6M3Mx/1hudKV6uQbY/VnOR9nk=;
        b=qsyRpR/IAyLt+Gz3hJF9URKW1cF6wD70CS14Mkqar0eV6zClugKJZOZsAIxMi3fR77
         JS6DgqOGRF5xOaVGcVRut/MYGSB2qHJRRKc7IS+tzbcrG05ziPWADxOSLt2F0U40bFdZ
         yvDlWIqumb5R43mlWtsOZMGYEO2bjrqW0boX9WM1zNFSwEClFZTOAf6VaRPnKnf1I6ep
         JHHg1vKhXLIUOcB3toSHlWp4XjuAHdbryueee6b8P3bNwhTvbC/3/Au59QKDEpJ8/WQ+
         aOcgMwlII1VvK6CbaUU6QxfNCi6rp03RatRPC2/CLLOPh664JX1M0FAnECn9MRTy7/9n
         Hrmg==
In-Reply-To: <b045f6704fdbb4417ce3428f4a423257@mail.velocitynet.com.au>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
To: doiggl@velocitynet.com.au
Cc: reiserfs-devel@vger.kernel.org


--=-ZX8p4b+n3e+XZVI414zR
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On 2015-02-13 at 13:11 +1100, doiggl@velocitynet.com.au wrote:
> Hello.
> - When is the patch set [1] included in the reiser4-for-3.x... release ?

Hello,

this patchset is not yet included in any of the releases. I have just
sent it for a review.

It is to be applied on top of any recent reiser4 patch, if you want to
help with testing.

> - Do all the 10 patches go in at the one time ?

Yes, they do not make much sense without each other. The latter ones
depend on the former ones, so they are applied in order.

--=20
Ivan Shapovalov / intelfx /

--=-ZX8p4b+n3e+XZVI414zR
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iF4EABEIAAYFAlTdaPcACgkQxUKljSIMAnB9jwD+OEYnqI4LjtuzuxmnqNT1Prii
qqolH/7O0xA5iWzG92gBAOB8j8T+LEdcn7og4vZ0kWg/kw8SO0xlRBcd9SJyRvFV
=eXtw
-----END PGP SIGNATURE-----

--=-ZX8p4b+n3e+XZVI414zR--

