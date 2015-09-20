From: Ivan Shapovalov <intelfx100@gmail.com>
Subject: Re: Reiser4: Format 4.0.1: Meta(data) checksums
Date: Sun, 20 Sep 2015 17:10:50 +0300
Message-ID: <1442758250.22253.4.camel@gmail.com>
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
	 <1442505391.4102.6.camel@gmail.com>
	 <CAM12Q5SvTNm4XCycPgpP6cxiYWgtQx846JkSnYWvVQN=aNPNbA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-k2yMJOthqcbICq3rl/wg"
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :content-type:mime-version;
        bh=rcVeNmAU075C4Bxq7rx9I/IMSvU5bmv8jaEckM0TcA0=;
        b=gDOcjlFm2PoTK7iCCcbY0lFRSC6HYzcuoVXeYJs2iszgk3XZJ6pkAlgVpj2GJCgPvd
         GPUc26Kov1CNP82RTkjblZDNAvwHTf+HP9trmlawojylvWLxwFTs/2qzCWk1y3IsE4Bg
         aqVCqYkEkImifnbGvvIlWFiPt2QvS+FLNFSMlEqmbpOtN7CB5jIQw2//AgMMU5/IuKaJ
         olK7xYLnsQeOWU6vova0YmDkxUoxxG6CSWWJbp8X5Totj9UTJytknDmHf7j4kxnWk++G
         CAfAYF/w2ZxjPBlSErHLJsD7oUdycSwYXj6am3Am5oP7hKRm0Vp04yCDJqoB+11JE1v/
         7CGw==
In-Reply-To: <CAM12Q5SvTNm4XCycPgpP6cxiYWgtQx846JkSnYWvVQN=aNPNbA@mail.gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
To: Jose R R <jose.r.r@metztli.com>
Cc: Edward Shishkin <edward.shishkin@gmail.com>, Milan =?UTF-8?Q?Bu=C5=A1ka?= <milan.buska@gmail.com>, ReiserFS Development List <reiserfs-devel@vger.kernel.org>, debian-boot@lists.debian.org, debian-kernel@lists.debian.org


--=-k2yMJOthqcbICq3rl/wg
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On 2015-09-20 at 06:48 -0700, Jose R R wrote:
> On Thu, Sep 17, 2015 at 8:56 AM, Ivan Shapovalov <
> intelfx100@gmail.com> wrote:
> > On 2015-09-17 at 05:10 -0700, Jose R R wrote:
> > > On Sun, Sep 13, 2015 at 6:06 AM, Ivan Shapovalov <
> > > intelfx100@gmail.com> wrote:
> > > > On 2015-09-13 at 05:57 -0700, Jose R R wrote:
> > > > > [...]
> > > > >=20
> > > > > Accordingly, seems the *lack of systemd* is enough for a
> > > > > Debian
> > > > > Sid
> > > > > instance to create a bad initrd.img. I have no idea if issue
> > > > > only
> > > > > appears with Reiser4 root fs or if it includes other file
> > > > > systems
> > > > > as
> > > > > root. Work in progress...
> > > >=20
> > > > It's presence/absence of crc32c module that matters. Reiser4
> > > > does
> > > > not
> > > > specify that it needs one.
> > > >=20
> > > Applied your 3 patches
> > > 1/3 < http://marc.info/?l=3Dreiserfs-devel&m=3D144218573602435&w=3D2 =
>
> > > 2/3 < http://marc.info/?l=3Dreiserfs-devel&m=3D144218573602436&w=3D2 =
>
> > > 3/3 < http://marc.info/?l=3Dreiserfs-devel&m=3D144218573702437&w=3D2 =
>
> > >=20
> > > into kernel.org Linux Kernel 4.1.7, but Non-systemd Debian still
> > > boots
> > > into an emergency shell
> > > [...]
> > > mount: mounting /dev/sdaX on /root failed: no such file or
> > > directory
> > > Target fileystem doesn't have requested /sbin/init
> > > mount: mounting /dev on /root/dev failed: no such file or
> > > directory
> > > No init found. Try passing init=3D bootarg.
> > > [...]
> >=20
> > Correct; it's now a "cleanly" reported error instead of an oops.
> > You will have to manually add crc32c or crc32c_intel module to the
> > initramfs, though. I could not find a way to express an explicit
> > intermodule dependency in the code (to make module reiser4 depend
> > on
> > module crc32c).
> >=20
> > Edward's patch selects module crc32c when reiser4 is selected in
> > the
> > build config, but it does not make sure that crc32c will end up in
> > the
> > initramfs if reiser4 is there (that is, modules.dep will not be
> > altered). I'm still wondering how to do that properly.
> >=20
> I applied Ed's patch, as well
> < http://marc.info/?l=3Dreiserfs-devel&m=3D144250028326153&w=3D2 >
> but the non-systemd Debian instance continued to generate a bad
> initrd.img-.
>=20
> Notwithstanding, based on your suggestions, Ivan, the solution that
> works for non-systemd system is to include module directive
> crc32c_intel right *before* module reiser4 directive in debian's
> /etc/initramfs-tools/modules file, thus:
> [...]
> crc32c_intel
> reiser4
> [...]

Good. So, it's indeed lack of hard dependency between reiser4 and
crc32c that caused this error. There are softdeps, as Ben advised, but
indeed they are not taken into account by common initramfs building
tools.

I guess that this fact needs to be added to READMEs: one has to add
crc32c to their initramfs manually if one uses reiser4 on their root
partition and it is built as a module.

BTW, how is this solved in other filesystems which need some crypto or
checksum algorithms for their operation? Say, ext4?

--=20
Ivan Shapovalov / intelfx /


--=-k2yMJOthqcbICq3rl/wg
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iF4EABEIAAYFAlX+vmoACgkQxUKljSIMAnDpaAEAz/7BCmGvs6GpxuYD/nRluLxy
vbpQIOGipcNxbH6LkHEBAMLJb/8arerNN2BW2OIhdk+7TDaDN7BdEabcvy85RMbs
=PXVl
-----END PGP SIGNATURE-----

--=-k2yMJOthqcbICq3rl/wg--

