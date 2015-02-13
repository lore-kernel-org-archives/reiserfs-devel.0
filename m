From: Ivan Shapovalov <intelfx100@gmail.com>
Subject: [PATCH] reiser4: return -ENOTTY from unsupported ioctls.
Date: Fri, 13 Feb 2015 03:37:38 +0300
Message-ID: <1423787858-26474-1-git-send-email-intelfx100@gmail.com>
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=from:to:cc:subject:date:message-id;
        bh=U5yBvGOGUnmHSwb1WSA71yGvGul3QtSLVJRuB+2lIho=;
        b=TdHteJCn0PRKf21R4vx0raShRYOBfzdjX7knlDWkyZD53//6NjUXIfpJVZzuYsi5pd
         KEVGhS3jSzNj5om/aaYXW/4rcafSBkAqGISjuPqO94XaswbaxbJ0WxMudI94RFXnFzFG
         Tm+D50zbpWE7gmt2x1DsvVr4I5HeyEom1ERqMhqWtMjDXDv0yDiZd9mdWFzClol8+qB3
         vgdf9LbRxKI92LbTJw0V+HN/eCq5WElRbyKnL7tzPvBBD1nDALr6Svz4BI9zNaRDA4+v
         gMSZ07F3U+lwUTDHrk5MkVHqbw/AeRN5N8c6vGMN1aS+av+ZNEsIqVCC/8VYtF99wgKF
         C5FA==
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-devel@vger.kernel.org
Cc: Ivan Shapovalov <intelfx100@gmail.com>

Signed-off-by: Ivan Shapovalov <intelfx100@gmail.com>
---

Looks like -ENOTTY is the right thing to return here.
(also specified at http://man7.org/linux/man-pages/man2/ioctl.2.html#ERRORS)

 fs/reiser4/plugin/file/cryptcompress.c | 2 +-
 fs/reiser4/plugin/file/file.c          | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/fs/reiser4/plugin/file/cryptcompress.c b/fs/reiser4/plugin/file/cryptcompress.c
index c3e0948..73f6974 100644
--- a/fs/reiser4/plugin/file/cryptcompress.c
+++ b/fs/reiser4/plugin/file/cryptcompress.c
@@ -3682,7 +3682,7 @@ int writepages_cryptcompress(struct address_space *mapping,
 int ioctl_cryptcompress(struct file *filp, unsigned int cmd,
 			unsigned long arg)
 {
-	return RETERR(-ENOSYS);
+	return RETERR(-ENOTTY);
 }
 
 /* plugin->mmap */
diff --git a/fs/reiser4/plugin/file/file.c b/fs/reiser4/plugin/file/file.c
index c33f789..1040c994 100644
--- a/fs/reiser4/plugin/file/file.c
+++ b/fs/reiser4/plugin/file/file.c
@@ -2453,7 +2453,7 @@ int ioctl_unix_file(struct file *filp, unsigned int cmd,
 		break;
 
 	default:
-		result = RETERR(-ENOSYS);
+		result = RETERR(-ENOTTY);
 		break;
 	}
 	reiser4_exit_context(ctx);
-- 
2.3.0

