From: Ivan Shapovalov <intelfx100@gmail.com>
Subject: Re: Reiser4: Format 4.0.1: Meta(data) checksums
Date: Sun, 13 Sep 2015 16:06:33 +0300
Message-ID: <1442149593.3827.1.camel@gmail.com>
References: <55E470E0.2070304@gmail.com>
	 <CAM12Q5Qkx-3ShOJjXd02_4Af0it3wv+39hXDW4sFhBosg=i3SQ@mail.gmail.com>
	 <CAFCWPPL+qqq0UgqV0F2T54EfmvVYmN6iWeuoVNvExR+dYqZWmg@mail.gmail.com>
	 <CAM12Q5T43V0-j5fGDrY4euTJE7jA5Tv2L+L678oRMvV6vJgyqA@mail.gmail.com>
	 <1441804577.3968.2.camel@gmail.com>
	 <CAM12Q5Q4Si+hAh92gw3pUHL4x9--bqTNbDyNugkKiy3shdBS2Q@mail.gmail.com>
	 <1441887004.4227.2.camel@gmail.com>
	 <CAM12Q5TCFxqrUpPC37MUWq7bSbu-fq2Ny0-E9iAhVDfECY7U9w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-Y2fuyIWCcuhMb5cQLAOv"
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :content-type:mime-version;
        bh=ON7wrXBAqkrynSlKF+3zR4lxObEf0qi1CMUBZzY2Dz0=;
        b=RueuIhRAxGZ/7/FEEyORNln2qxFyWbpLRcjvnw8LB2YyTTgXHNopeVKYw9q8XO+rij
         phlBfvZ1jW3gIGVb+zLdUpuNvwV7Mp/OyK0E8ytvV/9nSI6KfLT8dcpQnUpZhIlT9zVw
         4o+SwZp85TbK/ZKaUQUtbhyuATVdsiq3SA+yM/YJmeEkY8SpR0sRB0yUSL+0fFr27IvH
         dKdC5jYhbIMeNAWp3VBFNt6R/nB3MU8YNh2xoCQgJdfrSmgVuL23dcR/rM3MfBRFrhWT
         LS0spmX27hXN+sD7IpYA08Ot5QEtPoTwMKOQJPG/DKFqvl0wIn9cyQKXQ/gZTgTuXugx
         7+sA==
In-Reply-To: <CAM12Q5TCFxqrUpPC37MUWq7bSbu-fq2Ny0-E9iAhVDfECY7U9w@mail.gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
To: Jose R R <jose.r.r@metztli.com>
Cc: Edward Shishkin <edward.shishkin@gmail.com>, Milan =?UTF-8?Q?Bu=C5=A1ka?= <milan.buska@gmail.com>, ReiserFS Development List <reiserfs-devel@vger.kernel.org>, debian-boot@lists.debian.org, debian-kernel@lists.debian.org


--=-Y2fuyIWCcuhMb5cQLAOv
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On 2015-09-13 at 05:57 -0700, Jose R R wrote:
> Here is some additional info:
>=20
> A while back, I installed Debian Jessie AMD64 into a KVM virtual
> machine and also included the initial non-systemd boot argument:
> preseed/late_command=3D"in-target apt-get install -y sysvinit-core"
> < https://wiki.debian.org/systemd#Installing_without_systemd >
>=20
> Afterwards a previous reiser4-patched Linux kernel 4.0.x was
> installed
> into the virtual machine and its root fs was subsequently formatted
> to
> reiser4.. The virtual machine was working fine:
> < https://pbs.twimg.com/media/CKIKgoZUAAIFx12.png:large >
>=20
> Yesterday, I installed into the vm a newer 4.1.6 kernel built "the
> debian way" except that it was customized with the newer 4.0.1
> Reiser4
> patch. Upon rebooting the VM, I captured a sequence of 4 snapshots
> (by
> paging down) that basically recreate the fail that I experienced
> priorly in the physical machine:
>=20
> < https://metztli.it/blog/index.php/ixiptli/non-systemd-debian-sid-re
> iser4 >
>=20
> Accordingly, seems the *lack of systemd* is enough for a Debian Sid
> instance to create a bad initrd.img. I have no idea if issue only
> appears with Reiser4 root fs or if it includes other file systems as
> root. Work in progress...

It's presence/absence of crc32c module that matters. Reiser4 does not
specify that it needs one.

--=20
Ivan Shapovalov / intelfx /


--=-Y2fuyIWCcuhMb5cQLAOv
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iF4EABEIAAYFAlX1dNkACgkQxUKljSIMAnAR8QD/RNdzygYyYNk9/foyTCoOgV0f
5gXwlAgYZMj51JcR4HcA/A2jjVG7Ag3tOxajvPmBEh0VMyR+ROqKydAq/FisQBxJ
=Twen
-----END PGP SIGNATURE-----

--=-Y2fuyIWCcuhMb5cQLAOv--

