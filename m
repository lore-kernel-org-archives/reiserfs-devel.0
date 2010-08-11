From: Sergey Senozhatsky <sergey.senozhatsky@gmail.com>
Subject: [PATCH] fix reiserfs_evict_inode end_writeback second call
Date: Wed, 11 Aug 2010 14:07:01 +0300
Message-ID: <20100811110701.GA5362@swordfish.minsk.epam.com>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:date:from:to:cc:subject
         :message-id:mime-version:content-type:content-disposition:user-agent;
        bh=I6Wy08ZfG0Rup4ObcNZGIikIqKLWJu58s1UK8Hav/vo=;
        b=s6t/IK5uJdNbO0AOF2A5PrBvl/hUVxqgvq5KOptePed1ofg/JzNs5xCW9OPltgdiTT
         ZQjTe6vw2iLmKnWsNYl5o8XcFfFHzq8GJ9rNteDUoABQ1q2n6j26rUpYo66e1GlVUFmk
         yGdCzEasjsE0F6ZnZh1aYpseC4lVkOl3oZ5/k=
Content-Disposition: inline
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Al Viro <viro@zeniv.linux.org.uk>
Cc: Jan Kara <jack@suse.cz>, reiserfs-devel@vger.kernel.org, linux-kernel@vger.kernel.org

reiserfs_evict_inode calls end_writeback two times hitting
kernel BUG at fs/inode.c:298 becase inode->i_state is I_CLEAR already.

Signed-off-by: Sergey Senozhatsky <sergey.senozhatsky@gmail.com>

---

diff --git a/fs/reiserfs/inode.c b/fs/reiserfs/inode.c
index ae35413..87e11d2 100644
--- a/fs/reiserfs/inode.c
+++ b/fs/reiserfs/inode.c
@@ -83,7 +83,8 @@ void reiserfs_evict_inode(struct inode *inode)
 	dquot_drop(inode);
 	inode->i_blocks = 0;
 	reiserfs_write_unlock_once(inode->i_sb, depth);
-
+	return;
+	
 no_delete:
 	end_writeback(inode);
 	dquot_drop(inode);


