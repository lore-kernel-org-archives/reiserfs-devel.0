From: Jeff Mahoney <jeffm@suse.com>
Subject: [PATCH 04/10] reiserfsprogs: fix unsigned char with
 strlen/strcmp/strncpy warnings
Date: Thu, 11 Oct 2012 13:19:41 -0400
Message-ID: <20121011200115.99BBD200AB@oldboy.suse.de>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: reiserfs-devel@vger.kernel.org

This patch fixes a bunch of the following warnings:
warning: pointer targets in passing argument 1 of =E2=80=98strlen=E2=80=
=99 differ in signedness [-Wpointer-sign]
warning: pointer targets in passing argument 1 of =E2=80=98__builtin_st=
rncpy=E2=80=99 differ in signedness [-Wpointer-sign]
warning: pointer targets in passing argument 1 of =E2=80=98__builtin_st=
rcmp=E2=80=99 differ in signedness [-Wpointer-sign]

Signed-off-by: Jeff Mahoney <jeffm@suse.com>
---
 include/reiserfs_fs.h   |    2 +-
 mkreiserfs/mkreiserfs.c |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/reiserfs_fs.h b/include/reiserfs_fs.h
index 2d0442d..bcee57b 100644
--- a/include/reiserfs_fs.h
+++ b/include/reiserfs_fs.h
@@ -203,7 +203,7 @@ struct reiserfs_super_block
 /* 76 */     __u32 sb_inode_generation;=20
 /* 80 */     __u32 s_flags;                /* Right now used only by i=
node-attributes, if enabled */
 /* 84 */    unsigned char s_uuid[16];      /* filesystem unique identi=
fier */
-/*100 */    unsigned char s_label[16];     /* filesystem volume label =
*/
+/*100 */    char s_label[16];              /* filesystem volume label =
*/
 /*116 */    __u16 s_mnt_count;
 /*118 */    __u16 s_max_mnt_count;
 /*120 */    __u32 s_lastcheck;
diff --git a/mkreiserfs/mkreiserfs.c b/mkreiserfs/mkreiserfs.c
index 7ac0304..b0cd9b6 100644
--- a/mkreiserfs/mkreiserfs.c
+++ b/mkreiserfs/mkreiserfs.c
@@ -95,7 +95,7 @@ int Hash =3D DEFAULT_HASH;
 int Offset =3D 0;
 char * Format;
 unsigned char UUID[16];
-unsigned char * LABEL =3D NULL;
+char * LABEL =3D NULL;
 char * badblocks_file;
=20
 enum mkfs_mode {
--=20
1.7.10.4


--
To unsubscribe from this list: send the line "unsubscribe reiserfs-deve=
l" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
