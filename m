From: Ivan Shapovalov <intelfx100@gmail.com>
Subject: Re: Reiser4: Format 4.0.1: Meta(data) checksums
Date: Thu, 10 Sep 2015 15:10:04 +0300
Message-ID: <1441887004.4227.2.camel@gmail.com>
References: <55E470E0.2070304@gmail.com>
	 <CAM12Q5Qkx-3ShOJjXd02_4Af0it3wv+39hXDW4sFhBosg=i3SQ@mail.gmail.com>
	 <CAFCWPPL+qqq0UgqV0F2T54EfmvVYmN6iWeuoVNvExR+dYqZWmg@mail.gmail.com>
	 <CAM12Q5T43V0-j5fGDrY4euTJE7jA5Tv2L+L678oRMvV6vJgyqA@mail.gmail.com>
	 <1441804577.3968.2.camel@gmail.com>
	 <CAM12Q5Q4Si+hAh92gw3pUHL4x9--bqTNbDyNugkKiy3shdBS2Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-ZPTJIXN/KoPVGY93g8VY"
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :content-type:mime-version;
        bh=J/8farrwfM4IrMDfl2pxlTlBxowdPQVWScK6hTfv2UE=;
        b=OFIGkO6tiL15RZQoGc6diLf3oPkHBTYTCkVc1pzbLiFGATbQ4MjAKJK+zrb+LVELjI
         umQMLD/cSDsrsD+LshbP2nX6/peAr7ofgA/R7rbyhafuZMQZpdlB9QLcPhRYKACIL3Ug
         eAwZ+fZ7pLiXsRT5c3QiMXy0ANuWdlfZJHnYE8JOjC5qUdIuYwTU6VrRslw/y+LiIK/h
         7K0TQK3yLZWFAhQpRCm6DZdrVZ8tJk7bhIVBtoYlujPpUqp6IWQ+OMN30q5pv8CA+I6K
         K7UQQV0WuaNoDKMWAIHqq41j9pg39jnkaKXNnHtYOrkseBPl0tv1QSVaLPTvbyjUSetI
         mbeA==
In-Reply-To: <CAM12Q5Q4Si+hAh92gw3pUHL4x9--bqTNbDyNugkKiy3shdBS2Q@mail.gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
To: Jose R R <jose.r.r@metztli.com>
Cc: Edward Shishkin <edward.shishkin@gmail.com>, Milan =?UTF-8?Q?Bu=C5=A1ka?= <milan.buska@gmail.com>, ReiserFS Development List <reiserfs-devel@vger.kernel.org>


--=-ZPTJIXN/KoPVGY93g8VY
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On 2015-09-10 at 04:57 -0700, Jose R R wrote:
> On Wed, Sep 9, 2015 at 6:16 AM, Ivan Shapovalov <intelfx100@gmail.com
> > wrote:
> > On 2015-09-09 at 00:54 -0700, Jose R R wrote:
> > > Scratch my previous issue, Ed. It is *not* related to your new
> > > Reiser4
> > > software release 4.0.1 module nor reiser4progs.
> > >=20
> > > My usual development environment is a modified non-systemd Debian
> > > Sid
> > > (unstable) on a Reiser4 root partition. The kernels built won't
> > > boot
> > > in *that* particular instance due to a least one other additional
> > > issue:
> > > target filesystem does not have requested /sbin/init
> >=20
> > Could you please elaborate?
>=20
> I can only describe what's going on; still searching for a solution
> myself.
>=20
> < http://without-systemd.org/wiki/index.php/Main_Page >
>=20
> initrd.imgs created within a debian Sid environment -- with systemd
> replaced by init -- will fail to mount new reiser4 root file system
> during boot; whereas,
> initrd.imgs created within a debian Sid environment -- with systemd -
> -
> will mount *any* (systemd and non-systemd) new reiser4 root fs and
> boots system -- as it should.
>=20
> Issue closely resembles recent ZFS issue <
> https://github.com/zfsonlinux/zfs/issues/3605 > except that, in this
> non-systemd particular case, neither mkinitramfs-tools nor
> dracut-created initrd.imgs are successful.
>=20
> As I am running a couple of more or less similar AMD64 Debian Sid on
> Reiser4 root fs, I built the initrd.img for a non-systemd Debian Sid
> inside the environment of a systemd Debian Sid.
>=20
> I already disassembled an older 3.xy.z initrd and compared its
> contents with a initrd.img 4.1.6 built into this non-systemd Debian
> Sid but file trees appears similar.
>=20
> < http://linux.koolsolutions.com/2009/11/12/initramfs-ramfs-tmpfs-com
> pressed-image/
> >=20
>=20
> Thus, a kernel I built in this non-systemd environment (Sept. 07,
> 2015) can be installed in a systemd environment and it will boot;
> moreover, I can take the initrd.img produced in the systemd
> enviroment
> (during kernel installation) and use it to boot this non-systemd
> system -- and will proceed smoothly into its new Reiser4 4.0.1 root
> fs.
>=20
> < https://pbs.twimg.com/media/COiiyUtUkAAw95X.png:large >
>=20

Very interesting, thanks for the observations. I'm surprised with the
fact that systemd makes a difference here...

--
Ivan Shapovalov / intelfx /


--=-ZPTJIXN/KoPVGY93g8VY
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iF4EABEIAAYFAlXxcxwACgkQxUKljSIMAnDsjwD/U7IH/l77ApiohJuUtdkqOlNL
Wf5GlzXinjJ//2erxlgBAIR+sBy9go70Yj0BqwUcAlnf/9XmnGNyPdKSnz28oEVp
=RhDf
-----END PGP SIGNATURE-----

--=-ZPTJIXN/KoPVGY93g8VY--

