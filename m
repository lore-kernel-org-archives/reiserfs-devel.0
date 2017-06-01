From: Ivan Shapovalov <intelfx@intelfx.name>
Subject: Re: reiser4: BUG during a backup (sequentially reading the whole
 fs) on 4.9
Date: Fri, 02 Jun 2017 01:59:07 +0300
Message-ID: <1496357947.4940.2.camel@intelfx.name>
References: <1488211296.5395.2.camel@intelfx.name>
                 <f7c80f08-6e89-226b-7914-54d2385aa834@gmail.com>
                 <1488212421.5395.3.camel@intelfx.name>
                 <4a88640c-8d98-1cc0-5713-3abd76abf208@gmail.com>
                 <1496328566.8314.2.camel@intelfx.name>
                 <290631df-dc46-e8ef-041f-c353b7eecf88@gmail.com>
         <1496339175.12062.1.camel@intelfx.name> <59307242.5010705@gmail.com>
Reply-To: intelfx@intelfx.name
Mime-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha512";
        protocol="application/pgp-signature"; boundary="=-CtAswxTS2qfQOvFL4X2J"
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=intelfx.name; s=google;
        h=message-id:subject:from:reply-to:to:date:in-reply-to:references
         :mime-version;
        bh=7NGx6gZaBINxyMmGFKlWBMJpua03bQ25iJ/+Pmt8WlI=;
        b=GBWa/4YxDYaR7MFr+xbMfAvZLzKBxoGOZDOIuHc4mtOA1taKzb/43DlmPqpY27bOeH
         2Tslc/9oWvFDZeNqSXgXwxG8NuqsOdNgowjXk8rCYcUg8VzmSZxhHarTgPf5G3z+D6VO
         Cyjn2oJJpABNeWLH4reymT6aiHhLqd3L7YwdM=
In-Reply-To: <59307242.5010705@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
To: Edward Shishkin <edward.shishkin@gmail.com>, Reiserfs development mailing list <reiserfs-devel@vger.kernel.org>


--=-CtAswxTS2qfQOvFL4X2J
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Looking forward to your results.

And by "looking at the tree" you mean the debugfs output, right?

Thanks,
--=20
Ivan Shapovalov / intelfx /

On 2017-06-01 at 23:00 +0300, Edward Shishkin wrote:
> I'll try to reproduce it on my side tomorrow, or on weekends.
> If no success, then we'll think what to do. Specifically, I'd like
> to look at the tree in the locality of the current search position,
> where the oops happens.
>=20
> Thanks,
> Edward.
>=20
> On 06/01/2017 08:46 PM, Ivan Shapovalov wrote:
> > Yes, it is reproducible each time when I backup to an empty repo
> > without checkpoints (so that borg has to fully read all files). The
> > filesystem is consistent by fsck.
> >=20
>=20
>=20
--=-CtAswxTS2qfQOvFL4X2J
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE5N8nvImcx2nJlFGce94XyOTjDp0FAlkwnDsACgkQe94XyOTj
Dp3flQ/7BD/vIFgYTi+FH/SfOxxjUOTZzlclRUw+8PpWXA6PfI26a43kNB2RoLST
g+CfSUwW21RG7ARLmacqxbb9RD6Mau9lhXAZMxrLe9ftxd+8QXsS41K9A4ynccc4
Wktwp+m0OE9yuAhuBJqS1FaoBAN0L6Dosp2H3ImvoNN6W/qPPFp8ukeLnv/uUwL6
1b1Ig3rsXrl/iMv+FJFppBfRnTZ/fDD6Z/2JnIrZ/NtpqHK8Q2e9uV9jXXvtDHgo
qGkTTVLKOt7L8GcYy5aojp9M66RZLvdVExSwUsX8KdthvQAUkB5uXxQHdQS8JGMW
V03snNmiWbDyk7oqA8s/JIdLcCF+oHBshKkb699V9u5Z0GuUsrCGTDl9WrQpSHlx
ws4rnPg9R6MpuvzGlOd0EpAVF7xgGOIB+eorvbWb0JNtL5sEA1KcAUFExMqgI09L
C1/SVR7PTljIV+Vq26MIr+ONjAr0ASA2AJIHT6WGTYplDigLc1KgzRfHQJRKOAB0
tCXkNt9AadCFjpvEKPf0RCD32OL5w0e6iZVjsmRfftT6T4Z+nvw2urzS59hWeeBt
w6iRfSWW64gLHEWhtI1C6SrwSQOrxBe88vRJ1QBTr4T85/twuQQUl4zbjlszNWGr
DITmh/+vWDgP1U/Sf6zU7ggs2i7dbYTnHjdKCDy67BR3wDbznyU=
=CFNR
-----END PGP SIGNATURE-----

--=-CtAswxTS2qfQOvFL4X2J--

