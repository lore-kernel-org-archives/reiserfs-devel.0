From: Till Gerken <till@tantalo.net>
Subject: Re: Problem mounting ReiserFS as root partition
Date: Mon, 16 Jun 2003 11:16:52 +0200
Message-ID: <200306161117.02910.till@tantalo.net>
References: <200306151508.57384.till@tantalo.net> <20030616063609.GA12592@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-14555-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20030616063609.GA12592@namesys.com>
Content-Description: clearsigned data
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: Text/Plain; charset="us-ascii"
To: Oleg Drokin <green@namesys.com>
Cc: reiserfs-list@namesys.com

=2D----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On Monday 16 June 2003 08:36, Oleg Drokin wrote:
> On Sun, Jun 15, 2003 at 03:08:39PM +0200, Till Gerken wrote:
> > I am not able to mount my ReiserFS partition as root partition with any
> > kernel later than 2.4.20-pre11. When trying, I get
> > read_super_block: can't find a reiserfs filesystem on (dev 03:00, block
> > 64, size 1024)
>
> Are you sure you want to mount /dev/hda as opposed to some partition on
> /dev/hda? Please check that you are mounting correct thing (root=3D optio=
n in
> lilo.conf for example).

I stumbled about the same. I want to mount /dev/hda1 as root.

till@wallace:~> cat /proc/partitions
major minor  #blocks  name

   3     0   80418240 hda
   3     1   80418239 hda1
   3    64   39088896 hdb
   3    65   18434556 hdb1
   3    66          1 hdb2
   3    69     514079 hdb5
   3    70   14852092 hdb6

The above indicates that it should try device 03:01, I guess. My grub line=
=20
however is

kernel (hd0,0)/boot/vmlinuz-2.4.21 root=3D/dev/hda1,rw hdc=3Dide-scsi pci=
=3Dbiosirq=20
idebus=3D66

The weird thing is that the above line works with a kernel up to 2.4.20-pre=
11,=20
any later kernel with exact the same configuration will print the error=20
quoted in my original mail.

Till
=2D----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.2 (GNU/Linux)

iD8DBQE+7YsOFwwirB11AGMRAqeBAJ4muMPiYJha6nMGkL1xFdoRswG+mACfcnKR
uuSV1eA2piVXLM9JxmpL7FQ=3D
=3DEgLx
=2D----END PGP SIGNATURE-----

