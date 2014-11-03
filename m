From: Ivan Shapovalov <intelfx100@gmail.com>
Subject: Re: Reiser4 for 3.16.2 problem: mount: mount /dev/md125 on /mnt/backup failed: Cannot allocate memory
Date: Mon, 03 Nov 2014 18:50:38 +0300
Message-ID: <3573664.k2atxmXvKX@intelfx-laptop>
References: <CADW=+3nWaMdFCpoKQSErTQPu7YHm=4UJEZfZFnn8wOKX9tKrKg@mail.gmail.com> <1897499.AEq9pxZicq@intelfx-laptop> <54579E67.5070907@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart2734301.TIiV8KPksV"; micalg="pgp-sha256"; protocol="application/pgp-signature"
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=from:to:cc:subject:date:message-id:user-agent:in-reply-to
         :references:mime-version:content-type;
        bh=xsq+ECzMBpxvtxcqrrl/pfh16nMnv5SczCQ5w0PozZU=;
        b=JP7IpW7oI51ZiYyzICsD6loCMVxltfxQJPKF+ODY9GBXdt+bvXCzQn6ZaYhansqLt1
         VO+D1Jtlx4B6r10+9W75FBOhLgLlzOiCpact0m5i1rQTMYO6UBNq+uGokN8Sx1NE3ScC
         ZIqr+ikxG7sl/zwmCWw9ibV7BuYjaMgfHRcTRVLOVPmXJ4PI76G4D3X++EHjv+CWzIdf
         sOOPfnCrqePuNxQF3O6Z/IIHtyr/BqZ8zdmACfrH+OQrw328vvpVcOx4w0MF1w47XiQ1
         ytDkvJr9tJ2WqpUp7YhawhUrlev6mdIR+85ZpdbTcmQEA7eBp/i1F4pnmpqDpOZrKvbC
         EcCA==
In-Reply-To: <54579E67.5070907@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
To: Edward Shishkin <edward.shishkin@gmail.com>
Cc: =?utf-8?B?RHXFoWFuIMSMb2xpxIc=?= <dusanc@gmail.com>, reiserfs-devel <reiserfs-devel@vger.kernel.org>


--nextPart2734301.TIiV8KPksV
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="us-ascii"

On Monday 03 November 2014 at 16:25:27, Edward Shishkin wrote:=09
> On 11/03/2014 04:12 PM, Ivan Shapovalov wrote:
> > On Monday 03 November 2014 at 15:01:38, Edward Shishkin wrote:=09
> >> [...]
> >>
> >> Somebody steals pages of compressed file's address space.
> >> It can be e.g. because of races. I don't have any ideas except
> >> code inspection...
> > Do you remember the migration issue? Can't it be related?
>=20
> I don't think so: page migration is disabled in reiser4..

I know. What I'm trying to say: aren't there any other similar mechanis=
ms
in the kernel?

> > (btw, reiser4's pages are still non-migratable...)
>=20
> You still sit on the patch, which enables migration?

Yeah.

=2D-=20
Ivan Shapovalov / intelfx /
--nextPart2734301.TIiV8KPksV
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iF4EABEIAAYFAlRXpFIACgkQxUKljSIMAnDktQD/RAazgyrTV6VJE4RFGoLKSsMT
PI+qWucE2cA1NxaSrNEA/ik5Qmlj+z9q+efTJ8RTXB6rUldWcZHvMcupxMKso+/r
=7ssl
-----END PGP SIGNATURE-----

--nextPart2734301.TIiV8KPksV--

