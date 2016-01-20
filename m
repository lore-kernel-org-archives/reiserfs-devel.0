From: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Subject: [PATCH] reiserfs: fix dereference of ERR_PTR
Date: Wed, 20 Jan 2016 18:06:02 +0530
Message-ID: <1453293362-22893-1-git-send-email-sudipm.mukherjee@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=from:to:cc:subject:date:message-id;
        bh=tmIFnAiHfJ3+AeNXXSu08vUeLrYfGrQL3Dfnt5zkuXY=;
        b=qi0j90yXlLxOZwfvOX8z8xD6c6CFt5i0UgYdu9K+g7CZZpuftOhNzKcJ3i8UwRBFQ2
         2ZPn/w0STV6JsWpw6WQVe9zF4YMChnqpAsNmVtji7gUir9SPa3JEay8idXc0I9oJVi8H
         aireKBMt5eYr3wWDChF+EnNbCteB+/jFFOr01/r1F9gVFxUJLbPXLtEUXdrZk2KmkXPO
         1cPMquVVCMK4piValJxz5ty1Dyf2j/dtreSPzy+bp4WO+pEf9uDncN46fk5M2mGXZPSs
         Qms7AREXBzRz5F0zSh+FgRv3Y+hg0ZJqqVp+eg2Cbz+4oIRoMjAa/RaI3dcSVMw+4gcF
         p7zg==
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, reiserfs-devel@vger.kernel.org, Sudip Mukherjee <sudipm.mukherjee@gmail.com>

reiserfs_iget() returns either NULL or error code in ERR_PTR. And we
were only checking for NULL, so in case of some other error we will try
to dereference the ERR_PTR(-errno) thinking it to be a valid pointer.

Signed-off-by: Sudip Mukherjee <sudip@vectorindia.org>
---
 fs/reiserfs/super.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/reiserfs/super.c b/fs/reiserfs/super.c
index 05db747..c0306ec 100644
--- a/fs/reiserfs/super.c
+++ b/fs/reiserfs/super.c
@@ -288,7 +288,7 @@ static int finish_unfinished(struct super_block *s)
 		pathrelse(&path);
 
 		inode = reiserfs_iget(s, &obj_key);
-		if (!inode) {
+		if (IS_ERR_OR_NULL(inode)) {
 			/*
 			 * the unlink almost completed, it just did not
 			 * manage to remove "save" link and release objectid
-- 
1.9.1

