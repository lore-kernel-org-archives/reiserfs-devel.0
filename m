From: Alex Zarochentsev <zam@namesys.com>
Subject: Re: BUG ? :)
Date: Wed, 8 Oct 2003 23:07:38 +0400
Message-ID: <20031008190738.GC906@backtop.namesys.com>
References: <20031008180859.GA1090@gyptis.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-15814-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <20031008180859.GA1090@gyptis.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: =?koi8-r?Q?Jos=E9?= Mans <mans@gyptis.org>
Cc: reiserfs-list@namesys.com

On Wed, Oct 08, 2003 at 08:08:59PM +0200, Jos=E9 Mans wrote:
>=20
> Hello,
> please see :
>=20
> gyptis:/mnt/local/Download/Drivers/ATI/RAGE64/11.2560/UTILITY/DISK1/VDB# =
ls
> A?P?Eq7nVDB@  NEC_6FGnVDB@
> ls -l
> ls: NEC_6FGnVDB@: No such file or directory
> ls: APEq7nVDB@: No such file or directory
> total 0
> ls -lisaF
> ls: .@: No such file or directory
> ls: .n: No such file or directory
> ls: NEC_6FGnVDB@: No such file or directory
> ls: APEq7nVDB@: No such file or directory

probably, running badblocks(8) on /dev/hda4 is not a bad idea.

>=20
>=20
> gyptis:/mnt/local/Download/Drivers/ATI/RAGE64/11.2560/UTILITY/DISK1# rm -=
rf VDB/
>=20
> umount /mnt
> fsck /dev/hda4 #(/mnt)
>  (see end this message)
> fsck  --rebuild-tree /dev/hda4
>  fsck.ext3: invalid option -- e  :)

:-) what did you expect from running fsck.ext3 on reiserfs?

first, backup /dev/hda4 to somewhere,
then run fsck.reiserfs --rebuild-tree /dev/hda4

> rm -rf /mnt/local/Download/Drivers/ATI/RAGE64/11.2560/UTILITY/DISK1/VDB/
> rm: cannot remove directory `VDB/': Directory not empty
>=20
> outch :)
>=20
> My version reserfs :
>   reiserfsprogs 1:3.6.11-1 (debian testing)

> Linux gyptis 2.4.21=20
>=20
>=20
> thx :)
>=20
>=20
>=20
> # LOG fsck...
=20

--=20
Alex.
