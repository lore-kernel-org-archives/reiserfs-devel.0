From: Vladimir Saveliev <vs@namesys.com>
Subject: Re: fsck.reiser4 problem (was: reiser4 corruption problem)
Date: Tue, 31 Aug 2004 18:43:25 +0400
Message-ID: <1093963404.2716.480.camel@tribesman.namesys.com>
References: <20040831012446.631CB15E2E@mail03.powweb.com>
	 <200408311209.43653.IOBuf@gmx.de>
	 <1093955415.2716.476.camel@tribesman.namesys.com>
	 <200408311603.56537.IOBuf@gmx.de>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="=-m/Wu/3uv6edjfQ6uZ9+v"
Return-path: <reiserfs-list-return-21159-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200408311603.56537.IOBuf@gmx.de>
List-Id: <reiserfs-devel.vger.kernel.org>
To: Andreas <IOBuf@gmx.de>
Cc: reiserfs-list@namesys.com

--=-m/Wu/3uv6edjfQ6uZ9+v
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hello

On Tue, 2004-08-31 at 18:03, Andreas wrote:
> Hello,
>=20
> > Would you, please, provide exact sequences of operations which confuses
> > reiser4?
>=20
> mkfs.reiser4 /dev/discs/disc0/part2
> mount /dev/discs/disc0/part2 /mnt/d0p2
> touch /mnt/d0p2/abcdefghijklmnopq=E4=F6=FC=DF=DF=DF=DF
> umount /mnt/d0p2
> fsck.reiser4 /dev/discs/disc0/part2
>=20
>=20
> And as I now realize "fsck.reiser4 --build-fs" produces always a segmenta=
tion=20
> fault here, even on a newly created Reiser4 filesystem.
>=20

Would you please try with the attached patch.

> Bye
>  Andreas
>=20

--=-m/Wu/3uv6edjfQ6uZ9+v
Content-Disposition: attachment; filename=r5_hash.c.diff
Content-Type: text/plain; name=r5_hash.c.diff; charset=
Content-Transfer-Encoding: 7bit

--- reiser4progs-1.0.0/plugin/hash/r5_hash/r5_hash.c.orig	2004-08-31 18:48:01.749889832 +0400
+++ reiser4progs-1.0.0/plugin/hash/r5_hash/r5_hash.c	2004-08-31 18:46:08.864051088 +0400
@@ -9,10 +9,12 @@
 uint64_t r5_hash_build(char *name, uint32_t len) {
 	uint32_t i;
 	uint64_t a = 0;
+	unsigned char *uname;
 	
+	uname = (unsigned char *)name;
 	for (i = 0; i < len; i++) {
-		a += name[i] << 4;
-		a += name[i] >> 4;
+		a += uname[i] << 4;
+		a += uname[i] >> 4;
 		a *= 11;
 	}
     

--=-m/Wu/3uv6edjfQ6uZ9+v--

