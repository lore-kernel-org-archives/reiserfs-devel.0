From: Sasha Levin <sashal@kernel.org>
Subject: [PATCH AUTOSEL 4.19 15/44] reiserfs: propagate errors from fill_with_dentries() properly
Date: Tue, 13 Nov 2018 00:49:21 -0500
Message-ID: <20181113054950.77898-15-sashal@kernel.org>
References: <20181113054950.77898-1-sashal@kernel.org>
Return-path: <stable-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1542088217;
        bh=R+AKyqm/KciTIua5eOwQVlXvgOdbhtob0JVo/RcL+5Q=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=NBbaiTb/qs69TjsAM+XC0iqhUqtsL2QCqZREC6dQu+nV78V8Ju+HHib98KBVWCsmK
         JCqdyHeTEI9JcjcEvTCjS9dgyxunW1qbBQLd5IhL0vZOCGaKEUfOlk+bzsZIoxaGIh
         1aif/35Te8YpRGGOWpf8Aoqvx3YfPF2AChNvGjyk=
In-Reply-To: <20181113054950.77898-1-sashal@kernel.org>
Sender: stable-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: stable@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Jann Horn <jannh@google.com>, Jeff Mahoney <jeffm@suse.com>, Eric Biggers <ebiggers@google.com>, Al Viro <viro@zeniv.linux.org.uk>, Andrew Morton <akpm@linux-foundation.org>, Linus Torvalds <torvalds@linux-foundation.org>, Sasha Levin <sashal@kernel.org>, reiserfs-devel@vger.kernel.org

From: Jann Horn <jannh@google.com>

[ Upstream commit b10298d56c9623f9b173f19959732d3184b35f4f ]

fill_with_dentries() failed to propagate errors up to
reiserfs_for_each_xattr() properly.  Plumb them through.

Note that reiserfs_for_each_xattr() is only used by
reiserfs_delete_xattrs() and reiserfs_chown_xattrs().  The result of
reiserfs_delete_xattrs() is discarded anyway, the only difference there is
whether a warning is printed to dmesg.  The result of
reiserfs_chown_xattrs() does matter because it can block chowning of the
file to which the xattrs belong; but either way, the resulting state can
have misaligned ownership, so my patch doesn't improve things greatly.

Credit for making me look at this code goes to Al Viro, who pointed out
that the ->actor calling convention is suboptimal and should be changed.

Link: http://lkml.kernel.org/r/20180802163335.83312-1-jannh@google.com
Signed-off-by: Jann Horn <jannh@google.com>
Reviewed-by: Andrew Morton <akpm@linux-foundation.org>
Cc: Jeff Mahoney <jeffm@suse.com>
Cc: Eric Biggers <ebiggers@google.com>
Cc: Al Viro <viro@zeniv.linux.org.uk>
Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
Signed-off-by: Linus Torvalds <torvalds@linux-foundation.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 fs/reiserfs/xattr.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/fs/reiserfs/xattr.c b/fs/reiserfs/xattr.c
index 48cdfc81fe10..32d8986c26fb 100644
--- a/fs/reiserfs/xattr.c
+++ b/fs/reiserfs/xattr.c
@@ -185,6 +185,7 @@ struct reiserfs_dentry_buf {
 	struct dir_context ctx;
 	struct dentry *xadir;
 	int count;
+	int err;
 	struct dentry *dentries[8];
 };
 
@@ -207,6 +208,7 @@ fill_with_dentries(struct dir_context *ctx, const char *name, int namelen,
 
 	dentry = lookup_one_len(name, dbuf->xadir, namelen);
 	if (IS_ERR(dentry)) {
+		dbuf->err = PTR_ERR(dentry);
 		return PTR_ERR(dentry);
 	} else if (d_really_is_negative(dentry)) {
 		/* A directory entry exists, but no file? */
@@ -215,6 +217,7 @@ fill_with_dentries(struct dir_context *ctx, const char *name, int namelen,
 			       "not found for file %pd.\n",
 			       dentry, dbuf->xadir);
 		dput(dentry);
+		dbuf->err = -EIO;
 		return -EIO;
 	}
 
@@ -262,6 +265,10 @@ static int reiserfs_for_each_xattr(struct inode *inode,
 		err = reiserfs_readdir_inode(d_inode(dir), &buf.ctx);
 		if (err)
 			break;
+		if (buf.err) {
+			err = buf.err;
+			break;
+		}
 		if (!buf.count)
 			break;
 		for (i = 0; !err && i < buf.count && buf.dentries[i]; i++) {
-- 
2.17.1

