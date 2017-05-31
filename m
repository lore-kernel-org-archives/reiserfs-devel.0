From: Tahsin Erdogan <tahsin@google.com>
Subject: [PATCH 17/28] ext4: fix credits calculation for xattr inode
Date: Wed, 31 May 2017 01:15:06 -0700
Message-ID: <20170531081517.11438-17-tahsin@google.com>
References: <20170531081517.11438-1-tahsin@google.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=1hFwzALBNb5Cnflo/xEVOJ/IGVS1l3OOJOBWyP95mzk=;
        b=O91m3TKng8OVThHyQ8p02LhFVqJTYZ4QaoKAjnDU/fsxLvXZQSPQakITVAIle08DsM
         vbcKgLFEyXGxb4e7mIs4eAd5+p9HuCfmkzfWvDQS7X3yQ4IIO/afHqAbWu6zRFOBPO8U
         MAeITaesr39+hefB3tywQgIG52mLIvrNWxIcLTsJmk5QKlM2A9Jty0yG8skNdtv0N+Kn
         VUum+fgOqUbN5dfR8GVjkXvhgOIHZZsReyHWXxpTgwAGm6Wa6SluZuhE4hCFX23Gy2yt
         G7nbe4hhQFoijHJa+od46MsTZ5Qn+5W83dKbVdRH4dKAr42JiuNGac41qSPnPxN13dvf
         JxgQ==
In-Reply-To: <20170531081517.11438-1-tahsin@google.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jan Kara <jack@suse.com>, Theodore Ts'o <tytso@mit.edu>, Andreas Dilger <adilger.kernel@dilger.ca>, Dave Kleikamp <shaggy@kernel.org>, Alexander Viro <viro@zeniv.linux.org.uk>, Mark Fasheh <mfasheh@versity.com>, Joel Becker <jlbec@evilplan.org>, Jens Axboe <axboe@fb.com>, Deepa Dinamani <deepa.kernel@gmail.com>, Mike Christie <mchristi@redhat.com>, Fabian Frederick <fabf@skynet.be>, linux-ext4@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, jfs-discussion@lists.sourceforge.net, linux-fsdevel@vger.kernel.org, ocfs2-devel@oss.oracle.com, reiserfs-devel@vger.kernel.org, Tahsin Erdogan <tahsin@google.com>

When there is no space for a value in xattr block, it may be stored
in an xattr inode even if the value length is less than
EXT4_XATTR_MIN_LARGE_EA_SIZE(). So the current assumption in credits
calculation is wrong.

Signed-off-by: Tahsin Erdogan <tahsin@google.com>
---
 fs/ext4/xattr.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/fs/ext4/xattr.c b/fs/ext4/xattr.c
index 739f73a5a345..dcf7ec98f138 100644
--- a/fs/ext4/xattr.c
+++ b/fs/ext4/xattr.c
@@ -1590,8 +1590,7 @@ ext4_xattr_set(struct inode *inode, int name_index, const char *name,
 	if (error)
 		return error;
 
-	if ((value_len >= EXT4_XATTR_MIN_LARGE_EA_SIZE(sb->s_blocksize)) &&
-	    ext4_has_feature_ea_inode(sb)) {
+	if (ext4_has_feature_ea_inode(sb)) {
 		int nrblocks = (value_len + sb->s_blocksize - 1) >>
 					sb->s_blocksize_bits;
 
-- 
2.13.0.219.gdb65acc882-goog

