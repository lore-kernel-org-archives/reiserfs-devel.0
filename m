From: Vitaly Fertman <vitaly@namesys.com>
Subject: Re: reiser4 grub patch
Date: Fri, 3 Feb 2006 15:40:30 +0300
Message-ID: <200602031540.30856.vitaly@namesys.com>
References: <200602031237.06515.xxlucas@seznam.cz>
Reply-To: vitaly@namesys.com
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-27997-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200602031237.06515.xxlucas@seznam.cz>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: reiserfs-list@namesys.com
Cc: luc <xxlucas@seznam.cz>

On Friday 03 February 2006 14:37, luc wrote:
> Hi,
>=20
> i have a big trouble with the grub with reiser4 patch. Look here:
>=20
> ./install.sh:
>=20
> grub> root (hd0,0)
> =A0Filesystem type is ext2fs, partition type 0x83
> grub> setup (hd0)
> =A0Checking if "/boot/grub/stage1" exists... yes
> =A0Checking if "/boot/grub/stage2" exists... yes
> =A0Checking if "/boot/grub/e2fs_stage1_5" exists... yes
> =A0Running "embed /boot/grub/e2fs_stage1_5 (hd0)"... =A015 sectors are=20
> embedded.
> succeeded
> =A0Running "install /boot/grub/stage1 (hd0) (hd0)1+15 p=20
> (hd0,0)/boot/grub/stage /boot/grub/menu.lst"... failed
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 should be=20
> stage2 =A0^^^^^^
>=20
>=20
> without reiser4 patch works perfectly

is it grub 0.97?

have you taken the patched grub from our ftp or patched it by yourself?

have you installed the grub or testing it all in the source dir?
do not forget that new fs images should be put into /boot/grub/, otherwise =

you are trying old images with new grub.

reiser4 fs seems to be not involved into that installation process, am I=20
correct that an fs grub source sits on, /, (hd0,0), other used fs are not=20
reiser4 ones?

which files do you have in (hd0,0)/boot/grub/?

--=20
Vitaly
