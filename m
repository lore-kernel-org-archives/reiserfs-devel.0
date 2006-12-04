From: Mariusz Kozlowski <m.kozlowski@tuxland.pl>
Subject: [2.4 PATCH] reiserfs parenthesis fix
Date: Mon, 4 Dec 2006 10:46:33 +0100
Message-ID: <200612041046.33905.m.kozlowski@tuxland.pl>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-30298-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: reiserfs-dev@namesys.com
Cc: Al Viro <viro@ftp.linux.org.uk>, reiserfs-list@namesys.com, Willy Tarreau <wtarreau@hera.kernel.org>

Hello,

=A0=A0=A0=A0=A0=A0=A0=A0This patch fixes parenthesis in B_PRIGHT_DELIM_KEY(=
) macro code.

Signed-off-by: Mariusz Kozlowski <m.kozlowski@tuxland.pl>

=A0include/linux/reiserfs_fs.h | =A0 =A02 +-
=A01 file changed, 1 insertion(+), 1 deletion(-)

=2D-- linux-2.4.34-pre6-a/include/linux/reiserfs_fs.h	2004-11-17 12:54:22.0=
00000000 +0100
+++ linux-2.4.34-pre6-b/include/linux/reiserfs_fs.h	2006-12-01 11:53:10.000=
000000 +0100
@@ -787,7 +787,7 @@ struct block_head {      =20
=20
=20
 /* Get right delimiting key. -- little endian */
=2D#define B_PRIGHT_DELIM_KEY(p_s_bh)   (&(blk_right_delim_key(B_BLK_HEAD(p=
_s_bh))
+#define B_PRIGHT_DELIM_KEY(p_s_bh)   (&(blk_right_delim_key(B_BLK_HEAD(p_s=
_bh))))
=20
 /* Does the buffer contain a disk leaf. */
 #define B_IS_ITEMS_LEVEL(p_s_bh)     (B_LEVEL(p_s_bh) =3D=3D DISK_LEAF_NOD=
E_LEVEL)


=2D-=20
Regards,

	Mariusz Kozlowski
