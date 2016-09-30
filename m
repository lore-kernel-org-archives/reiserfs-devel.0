From: Ivan Shapovalov <intelfx@intelfx.name>
Subject: [PATCH] reiser4: return -ENOTTY from unsupported ioctls.
Date: Fri, 30 Sep 2016 09:49:05 +0300
Message-ID: <20160930064905.20896-1-intelfx@intelfx.name>
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=intelfx.name; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=qP/Fxxaf02Dv36HAX//FGsPzxHXgaCkmDeQK9Yp0slI=;
        b=AVQVnnO8GGE92rZGGuzKemxohYdxT7+Jc1japxZjNH5yf2OAS9hM7AYG6vXbuQ9ZBv
         QRVrZXryhs8J7c0X3YKeB1im4ZTQ6ScG2GYB8VUgAY/qQmUsrM+uQTkcbctK8twp/K41
         ll8GjexCtREc+HbU86TVZlx8dtU85kmKN3DDo=
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-devel@vger.kernel.org
Cc: Edward Shishkin <edward.shishkin@gmail.com>, Ivan Shapovalov <intelfx@intelfx.name>

Signed-off-by: Ivan Shapovalov <intelfx@intelfx.name>
---
 plugin/file/cryptcompress.c | 2 +-
 plugin/file/file.c          | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/plugin/file/cryptcompress.c b/plugin/file/cryptcompress.c
index 59d8df8..67c48d7 100644
--- a/plugin/file/cryptcompress.c
+++ b/plugin/file/cryptcompress.c
@@ -3544,7 +3544,7 @@ int writepages_cryptcompress(struct address_space *mapping,
 int ioctl_cryptcompress(struct file *filp, unsigned int cmd,
 			unsigned long arg)
 {
-	return RETERR(-ENOSYS);
+	return RETERR(-ENOTTY);
 }
 
 /* plugin->mmap */
diff --git a/plugin/file/file.c b/plugin/file/file.c
index 064f26e..9d08481 100644
--- a/plugin/file/file.c
+++ b/plugin/file/file.c
@@ -2446,7 +2446,7 @@ int ioctl_unix_file(struct file *filp, unsigned int cmd,
 		break;
 
 	default:
-		result = RETERR(-ENOSYS);
+		result = RETERR(-ENOTTY);
 		break;
 	}
 	reiser4_exit_context(ctx);
-- 
2.10.0

