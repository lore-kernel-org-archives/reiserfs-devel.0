From: Ivan Shapovalov <intelfx100@gmail.com>
Subject: Re: Reiser4: Format 4.0.1: Meta(data) checksums
Date: Thu, 17 Sep 2015 18:56:31 +0300
Message-ID: <1442505391.4102.6.camel@gmail.com>
References: <55E470E0.2070304@gmail.com>
	 <CAM12Q5Qkx-3ShOJjXd02_4Af0it3wv+39hXDW4sFhBosg=i3SQ@mail.gmail.com>
	 <CAFCWPPL+qqq0UgqV0F2T54EfmvVYmN6iWeuoVNvExR+dYqZWmg@mail.gmail.com>
	 <CAM12Q5T43V0-j5fGDrY4euTJE7jA5Tv2L+L678oRMvV6vJgyqA@mail.gmail.com>
	 <1441804577.3968.2.camel@gmail.com>
	 <CAM12Q5Q4Si+hAh92gw3pUHL4x9--bqTNbDyNugkKiy3shdBS2Q@mail.gmail.com>
	 <1441887004.4227.2.camel@gmail.com>
	 <CAM12Q5TCFxqrUpPC37MUWq7bSbu-fq2Ny0-E9iAhVDfECY7U9w@mail.gmail.com>
	 <1442149593.3827.1.camel@gmail.com>
	 <CAM12Q5QySio0eJMYe91YQEB19Z+xwmJ6sjVEKDD9Be8TCf5Bvg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-QbVPtolGc9FQSTWipkeT"
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :content-type:mime-version;
        bh=S3bBBFScMcG3U50up9OqR6rs7FkM+MGt/ttPQtwnp/o=;
        b=Lh09xeZF7V1h+rzbT3HyTh+GgtBNxuqABq+/wHBewAztl3ks6x8AbXrN0YyMyCmmIT
         gwgGZRkWG2+gvCJx8zvQOFg/qfKPw/e8GPw92OpWxkskl55C1HwoQD6aY4Lp3hPIUp0K
         JS3uzkF++F2GNFKXQihq5V4GTQAMFM0eawNWQeQ5osC6UQXRZPPMyU1GW7awTaFOZtg1
         qlEK0jdSrpeRN7hC1OnRolf5f2sA8MD6Vp1Bo9vxare7+oV57rJRT2gardTxWnB1FIt1
         Ag08/C0KJpSjnOeAfGr6RckepD0L+3KlJutbB2RXdgQ6LG91NMDkvg8bgjrUlFpvpUcQ
         mdyQ==
In-Reply-To: <CAM12Q5QySio0eJMYe91YQEB19Z+xwmJ6sjVEKDD9Be8TCf5Bvg@mail.gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
To: Jose R R <jose.r.r@metztli.com>
Cc: Edward Shishkin <edward.shishkin@gmail.com>, Milan =?UTF-8?Q?Bu=C5=A1ka?= <milan.buska@gmail.com>, ReiserFS Development List <reiserfs-devel@vger.kernel.org>, debian-boot@lists.debian.org, debian-kernel@lists.debian.org


--=-QbVPtolGc9FQSTWipkeT
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On 2015-09-17 at 05:10 -0700, Jose R R wrote:
> On Sun, Sep 13, 2015 at 6:06 AM, Ivan Shapovalov <
> intelfx100@gmail.com> wrote:
> > On 2015-09-13 at 05:57 -0700, Jose R R wrote:
> > > Here is some additional info:
> > >=20
> > > A while back, I installed Debian Jessie AMD64 into a KVM virtual
> > > machine and also included the initial non-systemd boot argument:
> > > preseed/late_command=3D"in-target apt-get install -y sysvinit-core"
> > > < https://wiki.debian.org/systemd#Installing_without_systemd >
> > >=20
> > > Afterwards a previous reiser4-patched Linux kernel 4.0.x was
> > > installed
> > > into the virtual machine and its root fs was subsequently
> > > formatted
> > > to
> > > reiser4.. The virtual machine was working fine:
> > > < https://pbs.twimg.com/media/CKIKgoZUAAIFx12.png:large >
> > >=20
> > > Yesterday, I installed into the vm a newer 4.1.6 kernel built
> > > "the
> > > debian way" except that it was customized with the newer 4.0.1
> > > Reiser4
> > > patch. Upon rebooting the VM, I captured a sequence of 4
> > > snapshots
> > > (by
> > > paging down) that basically recreate the fail that I experienced
> > > priorly in the physical machine:
> > >=20
> > > < https://metztli.it/blog/index.php/ixiptli/non-systemd-debian-si
> > > d-re
> > > iser4 >
> > >=20
> > > Accordingly, seems the *lack of systemd* is enough for a Debian
> > > Sid
> > > instance to create a bad initrd.img. I have no idea if issue only
> > > appears with Reiser4 root fs or if it includes other file systems
> > > as
> > > root. Work in progress...
> >=20
> > It's presence/absence of crc32c module that matters. Reiser4 does
> > not
> > specify that it needs one.
> >=20
> Applied your 3 patches
> 1/3 < http://marc.info/?l=3Dreiserfs-devel&m=3D144218573602435&w=3D2 >
> 2/3 < http://marc.info/?l=3Dreiserfs-devel&m=3D144218573602436&w=3D2 >
> 3/3 < http://marc.info/?l=3Dreiserfs-devel&m=3D144218573702437&w=3D2 >
>=20
> into kernel.org Linux Kernel 4.1.7, but Non-systemd Debian still
> boots
> into an emergency shell
> [...]
> mount: mounting /dev/sdaX on /root failed: no such file or directory
> Target fileystem doesn't have requested /sbin/init
> mount: mounting /dev on /root/dev failed: no such file or directory
> No init found. Try passing init=3D bootarg.
> [...]

Correct; it's now a "cleanly" reported error instead of an oops.
You will have to manually add crc32c or crc32c_intel module to the
initramfs, though. I could not find a way to express an explicit
intermodule dependency in the code (to make module reiser4 depend on
module crc32c).

Edward's patch selects module crc32c when reiser4 is selected in the
build config, but it does not make sure that crc32c will end up in the
initramfs if reiser4 is there (that is, modules.dep will not be
altered). I'm still wondering how to do that properly.

--=20
Ivan Shapovalov / intelfx /


--=-QbVPtolGc9FQSTWipkeT
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iF4EABEIAAYFAlX64rAACgkQxUKljSIMAnCRhAD/bhk6rHxzHayAPgmXkGdO1cra
UlSxkMpnddkGjOzo7F4BAJw7VlAgBrL2dLut/lfwyOkVWc4gzD66nWVKBRca4Au0
=y8Sq
-----END PGP SIGNATURE-----

--=-QbVPtolGc9FQSTWipkeT--

