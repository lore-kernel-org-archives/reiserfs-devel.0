From: Dan Carpenter <error27@gmail.com>
Subject: [patch] reiserfs: potential ERR_PTR dereference
Date: Sat, 15 Jan 2011 16:46:05 +0300
Message-ID: <20110115134605.GB2721@bicker>
Mime-Version: 1.0
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:date:from:to:cc:subject:message-id
         :mail-followup-to:mime-version:content-type:content-disposition
         :user-agent;
        bh=qy+TEdmQSBeOPkm3Qc5eWGoCgAvphMZlsNQhmBD7evA=;
        b=tJkYVvkxTPb6AqIvGcy91Lb6dB7FVUrC3SNdnJUUvlqc7t87P27d95Gcva6uPH6qGN
         kokBCcFJSWSY0HjwPIDoUn6WnjFbZLP8maa9mxyx0bE5dA4bFYwSH+gd9WeWQgN174xN
         hc0h68zeg+Tyivmd5T2tjyoJ5k9kc0Q4I7vdg=
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-devel@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

reiserfs_iget() returns an ERR_PTR on allocation failures.  All the
other callers check for it so we should check here too.

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/fs/reiserfs/super.c b/fs/reiserfs/super.c
index 0aab04f..6949b98 100644
--- a/fs/reiserfs/super.c
+++ b/fs/reiserfs/super.c
@@ -237,7 +237,7 @@ static int finish_unfinished(struct super_block *s)
 		pathrelse(&path);
 
 		inode = reiserfs_iget(s, &obj_key);
-		if (!inode) {
+		if (IS_ERR_OR_NULL(inode)) {
 			/* the unlink almost completed, it just did not manage to remove
 			   "save" link and release objectid */
 			reiserfs_warning(s, "vs-2180", "iget failed for %K",
