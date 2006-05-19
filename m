From: Laurent Riffard <laurent.riffard@free.fr>
Subject: [reiser4] can't build as module with reiser4-for-2.6.17-rc4-mm1-1.patch
Date: Fri, 19 May 2006 22:52:58 +0200
Message-ID: <e4lb65$m3n$1@sea.gmane.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature";
 boundary="------------enigE7BF611F6E8F4F55B3AD705A"
Return-path: <reiserfs-list-return-28653-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Sender: news <news@sea.gmane.org>
List-Id: <reiserfs-devel.vger.kernel.org>
To: reiserfs-list@namesys.com

--------------enigE7BF611F6E8F4F55B3AD705A
Content-Type: multipart/mixed;
 boundary="------------060802060803090707020900"

This is a multi-part message in MIME format.
--------------060802060803090707020900
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: quoted-printable

Hello,

I just downloaded reiser4-for-2.6.17-rc4-mm1-1.patch and gave it a try.
It seems that reiser4 won't build cleanly as a module.

>   CC [M]  fs/reiser4/plugin/regular.o
>   LD [M]  fs/reiser4/reiser4.o
>   CC      drivers/base/class.o
>   LD      drivers/base/built-in.o
>   LD      drivers/built-in.o
>   GEN     .version
>   CHK     include/linux/compile.h
>   UPD     include/linux/compile.h
>   CC      init/version.o
>   LD      init/built-in.o
>   LD      .tmp_vmlinux1
>   KSYM    .tmp_kallsyms1.S
>   AS      .tmp_kallsyms1.o
>   LD      .tmp_vmlinux2
>   KSYM    .tmp_kallsyms2.S
>   AS      .tmp_kallsyms2.o
>   LD      vmlinux
>   SYSMAP  System.map
>   SYSMAP  .tmp_System.map
>   AS      arch/i386/boot/setup.o
>   LD      arch/i386/boot/setup
>   OBJCOPY arch/i386/boot/compressed/vmlinux.bin
>   GZIP    arch/i386/boot/compressed/vmlinux.bin.gz
>   LD      arch/i386/boot/compressed/piggy.o
>   LD      arch/i386/boot/compressed/vmlinux
>   OBJCOPY arch/i386/boot/vmlinux.bin
>   BUILD   arch/i386/boot/bzImage
> Root device is (254, 4)
> Boot sector 512 bytes.
> Setup is 7183 bytes.
> System is 1309 kB
> Kernel: arch/i386/boot/bzImage is ready  (#6)
>   Building modules, stage 2.
>   MODPOST
> WARNING: "__copy_from_user_ll_nocache" [fs/reiser4/reiser4.ko] undefine=
d!
>   LD [M]  fs/reiser4/reiser4.ko

The attached patch solved it.
~~
laurent


--------------060802060803090707020900
Content-Type: text/x-patch;
 name="export_symbol__copy_from_user_ll_nocache.patch"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline;
 filename="export_symbol__copy_from_user_ll_nocache.patch"

reiser4 needs __copy_from_user_ll_nocache when built as a module.

Signed-off-by: Laurent Riffard <laurent.riffard@free.fr>
---
 arch/i386/lib/usercopy.c |    1 +
 1 files changed, 1 insertion(+)

Index: linux-2.6-mm/arch/i386/lib/usercopy.c
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
--- linux-2.6-mm.orig/arch/i386/lib/usercopy.c
+++ linux-2.6-mm/arch/i386/lib/usercopy.c
@@ -708,6 +708,7 @@ unsigned long __copy_from_user_ll_nocach
 #endif
 	return n;
 }
+EXPORT_SYMBOL(__copy_from_user_ll_nocache);
=20
 /**
  * copy_to_user: - Copy a block of data into user space.

--------------060802060803090707020900--

--------------enigE7BF611F6E8F4F55B3AD705A
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.2.2 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org

iD8DBQFEbjA0UqUFrirTu6IRAtJLAJ4pNm27Vh9dAEzEvPmfJS9Sfx65LQCffOa6
WQqdBc66QNwKrHQDq3PX0DM=
=Xjo1
-----END PGP SIGNATURE-----

--------------enigE7BF611F6E8F4F55B3AD705A--

