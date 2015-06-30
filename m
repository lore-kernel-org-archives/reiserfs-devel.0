From: Ivan Shapovalov <intelfx100@gmail.com>
Subject: Re: [patch] reiser4: port for Linux-4.1
Date: Tue, 30 Jun 2015 10:13:07 +0300
Message-ID: <1435648387.15634.3.camel@gmail.com>
References: <558D5C72.2040203@gmail.com> <55918654.80703@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-69WjE44Q1XYOGBBJjfuj"
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:subject:from:to:date:in-reply-to:references:content-type
         :mime-version;
        bh=Jadi5L13Fylac7yFpbZ/++vfDKKhrunu84/eGkG8Z0o=;
        b=f1cIeeWof3xF5bFT+i/aJcr0PB+SZiA0ZOSpxal2jYIMA7z11oAY6KYmdzlIxfbBJ+
         il1mVkgfLwuSkqBuQpCq9JW2TFRzxwW9jzenzDav2hugfth1dX7SdrDcvxqlml6Dw1FY
         zZkgfCsPuLTujPgz8tQ4puXC+cWBthVmDFh8VMmKwsbLNKXPFYeRrkwF+1o235KA+avB
         GVAKuHoSUNj6p1awAJYZZbxesYwS4Fo1fL1sBHgc1SBMwgZEh3VUDZVss9XyKnbReyeg
         wZx5eUtwL8JcmlUtdRD/J+NKnly4EeqmtkyQOVJnPubqeOU60+YPKLGCjVUiqkGPueUF
         iEWg==
In-Reply-To: <55918654.80703@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
To: Edward Shishkin <edward.shishkin@gmail.com>, Reiserfs development mailing list <reiserfs-devel@vger.kernel.org>


--=-69WjE44Q1XYOGBBJjfuj
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On 2015-06-30 at 01:54 +0800, Edward Shishkin wrote:
> Oh, bad
> generic_write_checks() doesn't change offset now,
> please, ignore this patch..

Hi,

it does change it, but in struct kiocb instance, but we keep using
initial "off".

i'm trying to port file_operations' ->write() to ->write_iter() right
now, FTR. The obvious fix (assign back ki_pos to off) is too ugly :)


--=20
Ivan Shapovalov / intelfx /

--=-69WjE44Q1XYOGBBJjfuj
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iF4EABEIAAYFAlWSQYMACgkQxUKljSIMAnDUqAEA0R7hNnb6NUrjiV85OeBKvNEL
KpGoNjM/7fcyyJ+jG3UBAOt0GNwOD73B4UzcCmPBjAEy2MXlExihh3LM2+G9tVbB
=JnKE
-----END PGP SIGNATURE-----

--=-69WjE44Q1XYOGBBJjfuj--

