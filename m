From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: [PATCH] reiser4progs: Grab pset after skipping the semantic pass by
 fsck
Date: Tue, 25 Aug 2015 17:50:40 +0200
Message-ID: <55DC8ED0.1020806@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------020105070607020002010906"
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=to:from:subject:message-id:date:user-agent:mime-version
         :content-type;
        bh=e1KqDSTwlHGS2EmUi1kEJRFojDV/l17RaNNIzLVXc0Q=;
        b=aw4nxJJWyj132VlwmsDjWPXGQ4iAHM7j95IAFCuDAbcaeA2DeCNClO0y6yCQrDk+Yh
         LlZ3ReihuwzHPpNo4r7VTfBzZpoNSr6yHdlXmwcuNBq3tOcy5XpUfm94ipor/cXb/fQB
         FtcVYZV8rJ+2egQrNgbgodpA7S45GAtBlXYMj7i3N0UnZWtpYM/fxpHQUFP+DxCrDA8a
         znw3m7UJTR3/IrQ8JiwuX2X+c8K0cb+XS8a10zhQl/HG+5slZ1573+J2r+roVWSj51Hy
         H+5Qz4L25tHINOnOUWOVQua694m2++cspIFXa+GFQ5J60kURcXr/mhcLP+yRE95/1kCF
         JGsg==
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
To: Reiserfs development mailing list <reiserfs-devel@vger.kernel.org>

This is a multi-part message in MIME format.
--------------020105070607020002010906
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit



--------------020105070607020002010906
Content-Type: text/x-patch;
 name="reiser4progs-grab-pset-after-skipping-semantic-path.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename*0="reiser4progs-grab-pset-after-skipping-semantic-path.patch"

Init global pset in the case when semantic pass is skipped
because of fatal corruptions. Otherwise fsck segfaults on
volumes of format versions 4.0.1 when reopening a backup
at fsck_check_fini().

Signed-off-by: Edward Shishkin <edward.shishkin@gmail.com>
---
 librepair/repair.c |    8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

--- a/librepair/repair.c
+++ b/librepair/repair.c
@@ -786,8 +786,14 @@ errno_t repair_check(repair_data_t *repa
 	if (repair->fatal) {
 		aal_warn("Fatal corruptions were found. "
 			 "Semantic pass is skipped.");
+		/*
+		 * We need to prepare pset for backup
+		 * creation in fsck_check_fini().
+		 */
+		if (res = reiser4_pset_tree(control.repair->fs->tree, 0))
+			goto error;
 		goto update;
-	} 
+	}
 	
 	/* Check the semantic reiser4 tree. */
 	if ((res = repair_sem_prepare(&control, &sem)))

--------------020105070607020002010906--
