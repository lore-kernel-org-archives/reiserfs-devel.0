From: Laurent Riffard <laurent.riffard@free.fr>
Subject: Re: BUG on reiser4_delete_inode
Date: Fri, 05 May 2006 18:55:11 +0200
Message-ID: <445B836F.2000702@free.fr>
References: <445A623F.6090409@free.fr> <1146836304.6254.26.camel@tribesman.namesys.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature";
 boundary="------------enig8A7316450B3557C322B74D2F"
Return-path: <reiserfs-list-return-28569-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1146836304.6254.26.camel@tribesman.namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
To: "Vladimir V. Saveliev" <vs@namesys.com>
Cc: reiserfs-list@namesys.com

--------------enig8A7316450B3557C322B74D2F
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: quoted-printable


Le 05.05.2006 15:38, Vladimir V. Saveliev a =E9crit :
> Hello
>=20
> On Thu, 2006-05-04 at 22:21 +0200, Laurent Riffard wrote:
>> Hello,
>>
>> I have a small Reiser4 FS (1 GB) which became really unstable since=20
>> 2.6.17-rc2-mm1. I managed to get a fully reproductible scenario:
>>
>> sh-3.00# mount /dev/vglinux1/lvkernel2 /mnt/disk
>>
>> ~$ mv /mnt/disk/linux-2.6-stable/arch/i386/kernel/acpi/boot.c /home/la=
urent/tmp/
>> Erreur de segmentation
>>
>> ------------[ cut here ]------------
>> kernel BUG at fs/inode.c:251!
>=20
> Thanks for the report. The problem is introduced by
> ftp://ftp.ru.kernel.org/pub/linux/kernel/people/akpm/patches/2.6/2.6.17=
-rc2/2.6.17-rc2-mm1/broken-out/radix-tree-direct-data.patch
>=20
> The attached patch should fix the problem, though.
=20
Ok, this bug seems to be fixed.

Thanks for your quick answer.
--=20
laurent


--------------enig8A7316450B3557C322B74D2F
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.2.2 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org

iD8DBQFEW4N9UqUFrirTu6IRAqgQAJ40ftl2RW78qA/RdPLdNpAv/XAdMQCfZIaw
GFjb1kF8zBgfZ59tNnOgID8=
=IOVW
-----END PGP SIGNATURE-----

--------------enig8A7316450B3557C322B74D2F--
