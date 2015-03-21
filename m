From: Sanidhya Kashyap <sanidhya.gatech@gmail.com>
Subject: [PATCH] reiserfs: kstrdup() memory handling
Date: Sat, 21 Mar 2015 13:00:13 -0400
Message-ID: <1426957213-5508-1-git-send-email-sanidhya.gatech@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=from:to:cc:subject:date:message-id;
        bh=DL3un8grc6oZihJPAD9OQcpwVoPea8uz2N/kaZQ6tBg=;
        b=xSBbIXfKUSRLR7yJM7UYfaLwtPWS4Vt4JDFXyXgSE0K0BGEjkouUi8L0pLoO2XEL3X
         XcphV7RLryH1NEzUQMe0LIkCz0zSks75iRDQoNY9ECxuov+F37eEPQmxjIOBeVCArhu6
         zf0s/78Bcechh2+Ydf9Prjx525Vb5dkXV3wFIxKkBO6zQghVG+JPPJ5y01vfkSTKc+zB
         jg48GkEmPmwSGACKncVtlepMVoETtoGagWuTQA/+QLi+6mOpGFcO3RdVYLhauaq9zRkt
         9qw0rtap35nuVNc8WiuahXPADDxiwz/2QFh/cvKuKbrBR4RKzxlsivz0XUGCnyCLHZ25
         A7Ew==
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: jack@suse.cz, jeffm@suse.com, akpm@linux-foundation.org, fabf@skynet.be, josh@joshtriplett.org, rashika.kheria@gmail.com, reiserfs-devel@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: taesoo@gatech.edu, changwoo@gatech.edu, sanidhya@gatech.edu, blee@gatech.edu, Sanidhya Kashyap <sanidhya.gatech@gmail.com>

Checking for ENOMEM even for new_opts in reiserfs_remount function as
there is a possibility of nothing being allocated.

Signed-off-by: Sanidhya Kashyap <sanidhya.gatech@gmail.com>
---
 fs/reiserfs/super.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/fs/reiserfs/super.c b/fs/reiserfs/super.c
index 71fbbe3..bf9bc66 100644
--- a/fs/reiserfs/super.c
+++ b/fs/reiserfs/super.c
@@ -1397,6 +1397,11 @@ static int reiserfs_remount(struct super_block *s, int *mount_flags, char *arg)
 	int i;
 #endif
 
+	if (!new_opts) {
+		err = -ENOMEM;
+		goto out_err_no_kfree;
+	}
+
 	sync_filesystem(s);
 	reiserfs_write_lock(s);
 
@@ -1549,6 +1554,7 @@ out_err_unlock:
 	reiserfs_write_unlock(s);
 out_err:
 	kfree(new_opts);
+out_err_no_kfree:
 	return err;
 }
 
-- 
2.1.0
