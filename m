From: Alexander Beregalov <a.beregalov@gmail.com>
Subject: [PATCH] reiserfs: fix build breakage
Date: Tue, 31 Mar 2009 00:32:40 +0400
Message-ID: <20090330203240.GA19456@orion>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:date:from:to:subject
         :message-id:mime-version:content-type:content-disposition:user-agent;
        bh=xM6ExU1VlRr0zaqWJht/2h3xx+9Myh3rtku2HssQNVM=;
        b=JGvuv1ziIWNCZxbXdcN6TVjH9u8t0Z/WAU9VXT93q5UJartDvgyqIbR7PbC4ZTfRZ6
         Ea5vREsl1l2quxcKJTBdftuRRieDAfXeISVdxyU0r/WMeXqURdjRtTYf38LCZ3Dy1ar+
         nkfxXmCY5OirVEX8l9CCMVbXvf+5u+rKTa4V0=
Content-Disposition: inline
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jeff Mahoney <jeffm@suse.com>, Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org, akpm@linux-foundation.org, ReiserFS Development List <reiserfs-devel@vger.>

fs/reiserfs/inode.c: In function 'reiserfs_new_inode':
fs/reiserfs/inode.c:1919: warning: passing argument 1 of
'reiserfs_inherit_default_acl' from incompatible pointer type
fs/reiserfs/inode.c:1919: warning: passing argument 2 of
'reiserfs_inherit_default_acl' from incompatible pointer type
fs/reiserfs/inode.c:1919: warning: passing argument 3 of
'reiserfs_inherit_default_acl' from incompatible pointer type
fs/reiserfs/inode.c:1919: error: too many arguments to function
'reiserfs_inherit_default_acl'

Signed-off-by: Alexander Beregalov <a.beregalov@gmail.com>
---

 include/linux/reiserfs_acl.h |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/include/linux/reiserfs_acl.h b/include/linux/reiserfs_acl.h
index 52240e0..8cc6575 100644
--- a/include/linux/reiserfs_acl.h
+++ b/include/linux/reiserfs_acl.h
@@ -80,7 +80,8 @@ static inline int reiserfs_acl_chmod(struct inode *inode)
 }
 
 static inline int
-reiserfs_inherit_default_acl(const struct inode *dir, struct dentry *dentry,
+reiserfs_inherit_default_acl(struct reiserfs_transaction_handle *th,
+			     const struct inode *dir, struct dentry *dentry,
 			     struct inode *inode)
 {
 	return 0;
