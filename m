From: Ivan Shapovalov <intelfx100@gmail.com>
Subject: Re: Reiser4 for 3.16.2 problem: mount: mount /dev/md125 on /mnt/backup failed: Cannot allocate memory
Date: Mon, 03 Nov 2014 18:12:14 +0300
Message-ID: <1897499.AEq9pxZicq@intelfx-laptop>
References: <CADW=+3nWaMdFCpoKQSErTQPu7YHm=4UJEZfZFnn8wOKX9tKrKg@mail.gmail.com> <CADW=+3nzK0rLpQR-+rhn_siKCYr5mSSbfkyyw5NXgagZWEPLvA@mail.gmail.com> <54578AC2.3040803@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart4217207.uav0LLNTGD"; micalg="pgp-sha256"; protocol="application/pgp-signature"
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=from:to:cc:subject:date:message-id:user-agent:in-reply-to
         :references:mime-version:content-type;
        bh=eT4Qpi/Qw4B4HKC4YvFcWI1Evihc5mo2fhVl4sJL0TY=;
        b=YsIV2GFPwm22KQuwfioW6uwzsSJkP/rQQDqoxuCnyRDyEEkN8HsBJjf2SDy0RnozYW
         8GUmpSgIE5TtXQF/62MgBsaSAI8IcYrLt+txReCGPzAmb4gkgfHT1VZSacQ3dMn5HUhR
         +5XyPQvu6I0Rakkjb7jzz4T+7ehq64T45RZVgJAiXA9itGBHXCBqaRyykV1k0XhHtFPg
         Vgg76zHaXXwxdmLACTa2g/K+wtLxDgwuZ5QNg+hrig0tijtmfEY/39zE1eFmpXgY01PG
         0MYJkeZ/XP4cmcqwukfgNaBt0elPw3PzZf9EVzsCHNOaiuUrd/dYa6HvkhwRwK06S8ji
         qISA==
In-Reply-To: <54578AC2.3040803@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
To: Edward Shishkin <edward.shishkin@gmail.com>
Cc: =?utf-8?B?RHXFoWFuIMSMb2xpxIc=?= <dusanc@gmail.com>, reiserfs-devel <reiserfs-devel@vger.kernel.org>


--nextPart4217207.uav0LLNTGD
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

On Monday 03 November 2014 at 15:01:38, Edward Shishkin wrote:=09
> On 11/03/2014 02:56 PM, Du=C5=A1an =C4=8Coli=C4=87 wrote:
> >
> >
> > On Nov 3, 2014 2:36 PM, "Edward Shishkin" <edward.shishkin@gmail.co=
m=20
> > <mailto:edward.shishkin@gmail.com>> wrote:
> > >
> > > Sorry, Can not reproduce.
> > > I have create a ticket http://sourceforge.net/p/reiser4/tickets/3=
/
> > > will keep this in mind.
> > >
> > > Thanks!
> >
> > Will it help if I try earlier kernels?
> > How can I find what file crashes it?
> >
>=20
>=20
> Somebody steals pages of compressed file's address space.
> It can be e.g. because of races. I don't have any ideas except
> code inspection...

Do you remember the migration issue? Can't it be related?
(btw, reiser4's pages are still non-migratable...)

=2D-=20
Ivan Shapovalov / intelfx /
--nextPart4217207.uav0LLNTGD
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iF4EABEIAAYFAlRXm1MACgkQxUKljSIMAnBc9AD/e52bprJRAD7tXVLLzC9IQ5DN
az91hlETulT79UQhXvUBANd440fWE68fNgGLPx5R2zhbZ7NtQdY0X47D5VzZhQsY
=vjKd
-----END PGP SIGNATURE-----

--nextPart4217207.uav0LLNTGD--

