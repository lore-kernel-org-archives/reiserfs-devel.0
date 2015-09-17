From: Ben Hutchings <ben@decadent.org.uk>
Subject: Re: Reiser4: Format 4.0.1: Meta(data) checksums
Date: Thu, 17 Sep 2015 23:51:18 +0200
Message-ID: <1442526678.5227.3.camel@decadent.org.uk>
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
Mime-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-6EA32JnP3F9+nhN46Gxu"
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <1442505391.4102.6.camel@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
To: Ivan Shapovalov <intelfx100@gmail.com>, Jose R R <jose.r.r@metztli.com>
Cc: Edward Shishkin <edward.shishkin@gmail.com>, Milan =?UTF-8?Q?Bu=C5=A1ka?= <milan.buska@gmail.com>, ReiserFS Development List <reiserfs-devel@vger.kernel.org>, debian-boot@lists.debian.org, debian-kernel@lists.debian.org


--=-6EA32JnP3F9+nhN46Gxu
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2015-09-17 at 18:56 +0300, Ivan Shapovalov wrote:
> On 2015-09-17 at 05:10 -0700, Jose R R wrote:
> > On Sun, Sep 13, 2015 at 6:06 AM, Ivan Shapovalov <
> > intelfx100@gmail.com> wrote:
> > > On 2015-09-13 at 05:57 -0700, Jose R R wrote:
> > > > Here is some additional info:
> > > >=20
> > > > A while back, I installed Debian Jessie AMD64 into a KVM virtual
> > > > machine and also included the initial non-systemd boot argument:
> > > > preseed/late_command=3D"in-target apt-get install -y sysvinit-core"
> > > > < https://wiki.debian.org/systemd#Installing_without_systemd >
> > > >=20
> > > > Afterwards a previous reiser4-patched Linux kernel 4.0.x was
> > > > installed
> > > > into the virtual machine and its root fs was subsequently
> > > > formatted
> > > > to
> > > > reiser4.. The virtual machine was working fine:
> > > > < https://pbs.twimg.com/media/CKIKgoZUAAIFx12.png:large >
> > > >=20
> > > > Yesterday, I installed into the vm a newer 4.1.6 kernel built
> > > > "the
> > > > debian way" except that it was customized with the newer 4.0.1
> > > > Reiser4
> > > > patch. Upon rebooting the VM, I captured a sequence of 4
> > > > snapshots
> > > > (by
> > > > paging down) that basically recreate the fail that I experienced
> > > > priorly in the physical machine:
> > > >=20
> > > > < https://metztli.it/blog/index.php/ixiptli/non-systemd-debian-si
> > > > d-re
> > > > iser4 >
> > > >=20
> > > > Accordingly, seems the *lack of systemd* is enough for a Debian
> > > > Sid
> > > > instance to create a bad initrd.img. I have no idea if issue only
> > > > appears with Reiser4 root fs or if it includes other file systems
> > > > as
> > > > root. Work in progress...
> > >=20
> > > It's presence/absence of crc32c module that matters. Reiser4 does
> > > not
> > > specify that it needs one.
> > >=20
> > Applied your 3 patches
> > 1/3 < http://marc.info/?l=3Dreiserfs-devel&m=3D144218573602435&w=3D2 >
> > 2/3 < http://marc.info/?l=3Dreiserfs-devel&m=3D144218573602436&w=3D2 >
> > 3/3 < http://marc.info/?l=3Dreiserfs-devel&m=3D144218573702437&w=3D2 >
> >=20
> > into kernel.org Linux Kernel 4.1.7, but Non-systemd Debian still
> > boots
> > into an emergency shell
> > [...]
> > mount: mounting /dev/sdaX on /root failed: no such file or directory
> > Target fileystem doesn't have requested /sbin/init
> > mount: mounting /dev on /root/dev failed: no such file or directory
> > No init found. Try passing init=3D bootarg.
> > [...]
>=20
> Correct; it's now a "cleanly" reported error instead of an oops.
> You will have to manually add crc32c or crc32c_intel module to the
> initramfs, though. I could not find a way to express an explicit
> intermodule dependency in the code (to make module reiser4 depend on
> module crc32c).
>=20
> Edward's patch selects module crc32c when reiser4 is selected in the
> build config, but it does not make sure that crc32c will end up in the
> initramfs if reiser4 is there (that is, modules.dep will not be
> altered). I'm still wondering how to do that properly.

In initramfs-tools, hook-functions has some code to handle these hidden
dependencies.  But it doesn't make a lot of sense to embed this
information there rather than in the modules themselves.

The proper way to put extra dependencies in modules is:

/* Soft module dependencies. See man modprobe.d for details.
 * Example: MODULE_SOFTDEP("pre: module-foo module-bar post: module-baz")
 */
#define MODULE_SOFTDEP(_softdep) MODULE_INFO(softdep, _softdep)

However initramfs-tools still needs to be fixed to follow these
dependencies.

Ben.

--=20
Ben Hutchings
When in doubt, use brute force. - Ken Thompson

--=-6EA32JnP3F9+nhN46Gxu
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIVAwUAVfs11ue/yOyVhhEJAQoiiA/7ByBDYq6y21d1+n1PQ7DLid744sz+hPG+
4hyf70iuUJogTOHuNXq+p5W3LyZ8TuCuyKd6PHIkCAdXbUDLG3cn3aYm8vHTWThQ
Y1bjoJ9H9Rsn40WdxBMp+MfeofZ5MGavaaYEKAe+XZn+Gi0KxnvxvdKDvdjC9SIn
EZaFDEx0WrpzBHx5UyQB5+W9SOm7LpggonWMQ5HKQUxSj+rDObHeuuKrqcWEoR8O
WscFwoA8v89u4mG0RUYk2pRYRYnqASIQY3HFIcDHjlAHNVCSbsPAmnaWV3GnkZ8i
9mBIV+tYdH25zPhHelkFh1BzbEwbgAeIFpSE1rF1rR//XEgMlKqxHEoWzdNpoEWy
j1TZHR8RF1O/qzyLYWbr1ANht08yIHiykUNyi9rpvgEvEsCZafnX8QkPjozsI5j1
XyHOCAFI1AnVqJ/NO8vIHbpBzQrZZp7N0daggg+hXT/8P68/oqQx9GQ8uwTMp+Gf
XLuzuNrSxdJ6vmJ/64btlh5BDl5GsnA/L1vD3M7KE6u5803XGt1Nj7EeM+1T/j1q
mXCXAu2BDfXXFhnLIgy/Ssg8WSIDMZz8nCaHlGPchVf0bTwe0N33g3ewuiD60Poj
hXWUkQL/jaLQgRLkOy42k4r6SsPhCax6N+HiU3OUyFCVw0Yz/ibjdcoIBLkq+ntp
FvAJUVveWzI=
=QAZj
-----END PGP SIGNATURE-----

--=-6EA32JnP3F9+nhN46Gxu--
