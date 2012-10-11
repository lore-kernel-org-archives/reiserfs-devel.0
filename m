From: Jeff Mahoney <jeffm@suse.com>
Subject: [PATCH 07/10] reiserfscore: fix uninitialized variable warning in
 print_indirect_item
Date: Thu, 11 Oct 2012 13:37:09 -0400
Message-ID: <20121011200115.E1D7D200B2@oldboy.suse.de>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: reiserfs-devel@vger.kernel.org

This patch fixes the following warning:
prints.c:403:20: warning: =E2=80=98num=E2=80=99 may be used uninitializ=
ed in this function [-Wmaybe-uninitialized]

Signed-off-by: Jeff Mahoney <jeffm@suse.com>
---
 reiserfscore/prints.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/reiserfscore/prints.c b/reiserfscore/prints.c
index ffe86fc..95e3014 100644
--- a/reiserfscore/prints.c
+++ b/reiserfscore/prints.c
@@ -384,7 +384,7 @@ void print_indirect_item (FILE * fp, struct buffer_=
head * bh, int item_num)
     struct item_head * ih;
     unsigned int j;
     __u32 * unp, prev =3D INT_MAX;
-    int num;
+    int num =3D 0;
=20
     ih =3D B_N_PITEM_HEAD (bh, item_num);
     unp =3D (__u32 *)B_I_PITEM (bh, ih);
--=20
1.7.10.4


--
To unsubscribe from this list: send the line "unsubscribe reiserfs-deve=
l" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
