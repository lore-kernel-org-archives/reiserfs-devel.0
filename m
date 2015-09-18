From: Ivan Shapovalov <intelfx100@gmail.com>
Subject: Re: Reiser4: Format 4.0.1: Meta(data) checksums
Date: Fri, 18 Sep 2015 12:51:36 +0300
Message-ID: <1442569896.15714.14.camel@gmail.com>
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
	 <1442526678.5227.3.camel@decadent.org.uk>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-27iptAo+b1Bv6MRBviWh"
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :content-type:mime-version;
        bh=3htIqFKU2WsV9qnqA5kd4xB4GmCG5RUSToJvmEuDdH0=;
        b=JoyPuDjA6x4IhoHuhywY3bMMoTwEPIGqVfkbT8hmX7Qw/rDi8Nq2IHbrcCUQbF9fuj
         u6CgqqiqDhlCyWfeg+B55yNaefQzu2oWN+50n4iy5Ry82Z6eP7dV2JJs2Ow5SaEk+QQM
         pKt5K0lMBQDlWEKv9UnyQkGmFTa2mVJJYFdhE+6XFWpyFjv8rQIcvOIsTTwm1GKZRXi8
         fV/rlg76rE/uNwZWkO/70T2lF2ziryirAtQbhj9f54912gxx/I/ThDBw4qig9trDznre
         kki0UDI0QE/4YutV9GQV+lTF6sRZnrfZd5xIDDr9NlFblBs3FP1vWMzpGs8zIn3oi6bV
         +stg==
In-Reply-To: <1442526678.5227.3.camel@decadent.org.uk>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
To: Ben Hutchings <ben@decadent.org.uk>, Jose R R <jose.r.r@metztli.com>
Cc: Edward Shishkin <edward.shishkin@gmail.com>, Milan =?UTF-8?Q?Bu=C5=A1ka?= <milan.buska@gmail.com>, ReiserFS Development List <reiserfs-devel@vger.kernel.org>, debian-boot@lists.debian.org, debian-kernel@lists.debian.org


--=-27iptAo+b1Bv6MRBviWh
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On 2015-09-17 at 23:51 +0200, Ben Hutchings wrote:
> On Thu, 2015-09-17 at 18:56 +0300, Ivan Shapovalov wrote:
> > On 2015-09-17 at 05:10 -0700, Jose R R wrote:
> > > On Sun, Sep 13, 2015 at 6:06 AM, Ivan Shapovalov <
> > > intelfx100@gmail.com> wrote:
> > > > On 2015-09-13 at 05:57 -0700, Jose R R wrote:
> > > > > Here is some additional info:
> > > > >=20
> > > > > A while back, I installed Debian Jessie AMD64 into a KVM
> > > > > virtual
> > > > > machine and also included the initial non-systemd boot
> > > > > argument:
> > > > > preseed/late_command=3D"in-target apt-get install -y sysvinit
> > > > > -core"
> > > > > < https://wiki.debian.org/systemd#Installing_without_systemd=20
> > > > > >
> > > > >=20
> > > > > Afterwards a previous reiser4-patched Linux kernel 4.0.x was
> > > > > installed
> > > > > into the virtual machine and its root fs was subsequently
> > > > > formatted
> > > > > to
> > > > > reiser4.. The virtual machine was working fine:
> > > > > < https://pbs.twimg.com/media/CKIKgoZUAAIFx12.png:large >
> > > > >=20
> > > > > Yesterday, I installed into the vm a newer 4.1.6 kernel built
> > > > > "the
> > > > > debian way" except that it was customized with the newer
> > > > > 4.0.1
> > > > > Reiser4
> > > > > patch. Upon rebooting the VM, I captured a sequence of 4
> > > > > snapshots
> > > > > (by
> > > > > paging down) that basically recreate the fail that I
> > > > > experienced
> > > > > priorly in the physical machine:
> > > > >=20
> > > > > < https://metztli.it/blog/index.php/ixiptli/non-systemd-debia
> > > > > n-si
> > > > > d-re
> > > > > iser4 >
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
>=20
> In initramfs-tools, hook-functions has some code to handle these
> hidden
> dependencies.  But it doesn't make a lot of sense to embed this
> information there rather than in the modules themselves.
>=20
> The proper way to put extra dependencies in modules is:
>=20
> /* Soft module dependencies. See man modprobe.d for details.
>  * Example: MODULE_SOFTDEP("pre: module-foo module-bar post: module
> -baz")
>  */
> #define MODULE_SOFTDEP(_softdep) MODULE_INFO(softdep, _softdep)
>=20
> However initramfs-tools still needs to be fixed to follow these
> dependencies.
>=20
> Ben.
>=20

Hi Ben,

yeah, I've considered softdeps, but at least in arch linux the
mkinitcpio tool doesn't look at softdeps at all.

So, there is no way to append something to the "depends" field in the
module info (i. e. "hard" dependencies). Correct?

Thanks,
--=20
Ivan Shapovalov / intelfx /


--=-27iptAo+b1Bv6MRBviWh
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iF4EABEIAAYFAlX73qgACgkQxUKljSIMAnAdHwEAnydpOqggT2ElhiMXsXEDmlzJ
J0LhdPHG+FySJL073b8BANzWMX2LnqgC7efsiZgYN/os0U/JGt8bgU2mA46+zCR4
=+vMM
-----END PGP SIGNATURE-----

--=-27iptAo+b1Bv6MRBviWh--

