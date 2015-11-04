From: Ivan Shapovalov <intelfx100@gmail.com>
Subject: Re: [PATCH 3/3] reiser4: in our own sync writes, mark pages dirty
 before marking them writeback.
Date: Wed, 04 Nov 2015 19:09:29 +0100
Message-ID: <1446660569.17425.1.camel@gmail.com>
References: <1444389417-14929-1-git-send-email-intelfx100@gmail.com>
		 <1444389417-14929-4-git-send-email-intelfx100@gmail.com>
		 <5617C0C1.6060806@gmail.com> <1444398642.6030.3.camel@gmail.com>
		 <5617D55D.2040908@gmail.com> <1444410842.2213.5.camel@gmail.com>
		 <56182257.7060304@gmail.com> <1444473863.4257.10.camel@gmail.com>
		 <561B7857.1030000@gmail.com> <1444817147.5346.10.camel@gmail.com>
		 <1444820148.4077.1.camel@gmail.com> <1444849590.13210.3.camel@gmail.com>
	 <561FE051.3000104@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-0Oo4IRb68EbmSyPSy2er"
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :content-type:mime-version;
        bh=D3o0202oaPbQ17/fpLBIpOChwBc04djPxij/ZYA0zeQ=;
        b=nYTQp+KvHKdQB2Hihh4Oa4fJsyianSi+32G5Fear+ab5hKmQU9vXg+Lgg736Tp1ryk
         NsxLnR/IqOjwp5gWwE7GNqp2a9sC7Q6UGL2nFjGTyCEv2UKOfMwonlZg1e/FCPaGGo3i
         kx1rvdeUU0BKzqhIU57RNGngMnT3wnJoMXnV54zE9bSvgcTL1derSvbEnNNU7KNHKMih
         Gh9tDzclNEjqcyuoP3XKAJt1dkyq95VQrSIfVGxvCXMrvRqR98fh5lqBSVbLM0dg+M7m
         kxErVZhbFAXd9PdHERGxTRk+r7GpQIOZn5rj12rexhwqi1zakIrRWb6qsXF1NtfW3yzX
         9BuQ==
In-Reply-To: <561FE051.3000104@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
To: Edward Shishkin <edward.shishkin@gmail.com>
Cc: reiserfs-devel@vger.kernel.org


--=-0Oo4IRb68EbmSyPSy2er
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On 2015-10-15 at 19:20 +0200, Edward Shishkin wrote:
> Hello,
>=20
> So the tail conversion is the culprit?
> It's quite realistic...
> I am currently on vacations,
> I'll take a look at this at the end of October
> more carefully.
>=20
> Thanks!
> Edward.

Hi Edward,

what's the status of this? Do you have a bit of time to spend looking
at the fixes? :)

[Dropped Oleg from Cc: in order not to annoy him anymore.]

--=20
Ivan Shapovalov / intelfx /


--=-0Oo4IRb68EbmSyPSy2er
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iF4EABEIAAYFAlY6SdkACgkQxUKljSIMAnAqvwEAoo1Z05537V1SoRIsizgi64oG
/0Ztwr31kdinyV31enIA/iCHAWADv3CntVpU6xm8VpH7I++CFjGIMe4M8KlBl7ZF
=rZW6
-----END PGP SIGNATURE-----

--=-0Oo4IRb68EbmSyPSy2er--

