From: Denis Cheng <crquan@gmail.com>
Subject: [PATCH 12/20] fs/reiserfs/xattr.c: use LIST_HEAD instead of LIST_HEAD_INIT
Date: Thu,  6 Dec 2007 23:31:16 +0800
Message-ID: <1196955076-5582-1-git-send-email-crquan@gmail.com>
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:received:from:to:cc:subject:date:message-id:x-mailer;
        bh=bsV/LCYVrLm2+cABedurlwaFR7E4vLUX19YAFUvWG7g=;
        b=BEXPvuehUI+Kfj7ayEEEvirka1W3rRXTquNzgAKuAcGKedAGkIGobvFsem171Ge1OJnbmX+tHLnxFq7SJkd982PqghS7DiIPLBI39WOZZRsEVRaPCDieoO/7RCDBhLEMz866g78xL7hfNvrJVZ9Tet1R6Y2jKfgHIZl/V24qHnQ=
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-dev@namesys.com, reiserfs-devel@vger.kernel.org
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org

single list_head variable initialized with LIST_HEAD_INIT could almost
always can be replaced with LIST_HEAD declaration, this shrinks the code
and looks better.

Signed-off-by: Denis Cheng <crquan@gmail.com>
---
 fs/reiserfs/xattr.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/fs/reiserfs/xattr.c b/fs/reiserfs/xattr.c
index 1597f6b..a5bd23c 100644
--- a/fs/reiserfs/xattr.c
+++ b/fs/reiserfs/xattr.c
@@ -1084,7 +1084,7 @@ ssize_t reiserfs_listxattr(struct dentry * dentry, char *buffer, size_t size)
 }
 
 /* This is the implementation for the xattr plugin infrastructure */
-static struct list_head xattr_handlers = LIST_HEAD_INIT(xattr_handlers);
+static LIST_HEAD(xattr_handlers);
 static DEFINE_RWLOCK(handler_lock);
 
 static struct reiserfs_xattr_handler *find_xattr_handler_prefix(const char
-- 
1.5.3.4

