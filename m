From: Liuwenyi <qingshenlwy@gmail.com>
Subject: [PATCHv2 11/12]posix_acl: Add the check items
Date: Mon, 21 Dec 2009 20:01:53 +0800
Message-ID: <4B2F63B1.4080109@gmail.com>
Reply-To: qingshenlwy@gmail.com
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:reply-to
         :user-agent:mime-version:to:subject:content-type
         :content-transfer-encoding;
        bh=3ecC1gP8qOcMGq4jmVSEEa4/92MCTwmtNYrYhUHFm5I=;
        b=gj6DWEgF2bgTmKXSY7GuIILMjKwrCgHouineczJ63kWVTWsuSRwM/jLZsHFO6BCrAS
         g85AA8MuuzeGPA8NnoctAL75xsa+fON6Mb8y/wc9goIhEFheEuvbCSyvtoENqNXU4pCz
         K3PGShZ9BJxqLfSSgwChFn2Tj/QEE3DdH/6mo=
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: viro@zeniv.linux.org.uk, jeffm@suse.com, joel.becker@oracle.com, jmorris@namei.org, hch@lst.de, reiserfs-devel@vger.kernel.org, linux-kernel@vger.kernel.org, onlyflyer@gmail.com, stro

move the ACL validation check in to fs/posix_acl.c.
Including nullpointer check and PTR_ERR check.

---
Signed-off-by: Liuwenyi <qingshenlwy@gmail.com>
Cc: Al Viro <viro@zeniv.linux.org.uk>
Cc: Jeff Mahoney <jeffm@suse.com>
Cc: Joel Becker <joel.becker@oracle.com>
Cc: James Morris <jmorris@namei.org>
Cc: Christoph Hellwig <hch@lst.de>
Cc: reiserfs-devel@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

---
diff --git a/fs/reiserfs/xattr_acl.c b/fs/reiserfs/xattr_acl.c
index cc32e6a..4cf1f18 100644
--- a/fs/reiserfs/xattr_acl.c
+++ b/fs/reiserfs/xattr_acl.c
@@ -30,13 +30,9 @@ posix_acl_set(struct dentry *dentry, const char
*name, const void *value,

if (value) {
acl = posix_acl_from_xattr(value, size);
- if (IS_ERR(acl)) {
- return PTR_ERR(acl);
- } else if (acl) {
- error = posix_acl_valid(acl);
- if (error)
- goto release_and_out;
- }
+ error = posix_acl_valid(acl);
+ if (error)
+ goto release_and_out;
} else
acl = NULL;


-- 
Best Regards,
Liuwenyi

