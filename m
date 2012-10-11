From: Jeff Mahoney <jeffm@suse.com>
Subject: [PATCH 03/10] reiserfsprogs: fix printf formatting warnings
Date: Thu, 11 Oct 2012 13:16:59 -0400
Message-ID: <20121011200115.AFB72200B1@oldboy.suse.de>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: reiserfs-devel@vger.kernel.org

This patch fixes:
main.c:968:11: warning: format =E2=80=98%u=E2=80=99 expects argument of=
 type =E2=80=98unsigned int=E2=80=99, but argument 3 has type =E2=80=98=
time_t=E2=80=99 [-Wformat]
prints.c:152:7: warning: format =E2=80=98%lu=E2=80=99 expects argument =
of type =E2=80=98long unsigned int=E2=80=99, but argument 3 has type =E2=
=80=98__u32=E2=80=99 [-Wformat]

Signed-off-by: Jeff Mahoney <jeffm@suse.com>
---
 fsck/main.c           |    2 +-
 reiserfscore/prints.c |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/fsck/main.c b/fsck/main.c
index 911af8d..e4253af 100644
--- a/fsck/main.c
+++ b/fsck/main.c
@@ -964,7 +964,7 @@ static int reiserfs_check_auto_state(reiserfs_filsy=
s_t *fs)
 	}
=20
 	if (interval !=3D UINT_MAX && now > lastcheck + interval) {
-		fprintf(stderr, "File system hasn't been checked in %u days. "
+		fprintf(stderr, "File system hasn't been checked in %lu days. "
 		        "Checking now.\n", (now - lastcheck) / (60*60*24));
 		return 1;
 	}
diff --git a/reiserfscore/prints.c b/reiserfscore/prints.c
index e68ef01..ffe86fc 100644
--- a/reiserfscore/prints.c
+++ b/reiserfscore/prints.c
@@ -148,7 +148,7 @@ static int print_disk_child (FILE * stream,
     int len;
=20
     dc =3D *((const struct disk_child **)(args[0]));
-    len =3D asprintf (&buffer, "[dc_number=3D%lu, dc_size=3D%u]", get_=
dc_child_blocknr (dc),
+    len =3D asprintf (&buffer, "[dc_number=3D%u, dc_size=3D%u]", get_d=
c_child_blocknr (dc),
 		    get_dc_child_size (dc));
     FPRINTF;
 }
--=20
1.7.10.4


--
To unsubscribe from this list: send the line "unsubscribe reiserfs-deve=
l" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
