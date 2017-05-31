From: Tahsin Erdogan <tahsin@google.com>
Subject: [PATCH 08/28] ext4: fix ref counting for ea_inode
Date: Wed, 31 May 2017 01:14:57 -0700
Message-ID: <20170531081517.11438-8-tahsin@google.com>
References: <20170531081517.11438-1-tahsin@google.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=jOuHfz4xbyjqCdv5m7sdc276d1wtjBcosjZdP5QDqn8=;
        b=i/MB2ZKbLuTzPWA7Az7SZ3ZVCUlukuMq0jJQOVrkpqlqOXOZlURpZfndcf2XPsBzqg
         iX0MS/N6zEKQ1NiTnkQ1yAHv1WVFSZbS3OlRs5FnljFBovy4Yc0iEPs3XVg5EqgrX4cO
         n/gXMXhlZeZ1x2pQSwjBSwSO9N8W3xtf60tABsTVIq+KlK6jB9PoqwUz1ol/9bMwAqK2
         YaCF9ZKrGAr/oImDGs4NG7i49Lci5DoyE/VyiBr4DPrekM6jsCGCB4xv6kPgq4YvmTU8
         MXhRkrmeGYOE5ZfqKKUfcQjD6tdTYyo5ei42u7GQ7Pi/oOOwJ/IoG2E+n+HSfmjAH6oQ
         Skqw==
In-Reply-To: <20170531081517.11438-1-tahsin@google.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jan Kara <jack@suse.com>, Theodore Ts'o <tytso@mit.edu>, Andreas Dilger <adilger.kernel@dilger.ca>, Dave Kleikamp <shaggy@kernel.org>, Alexander Viro <viro@zeniv.linux.org.uk>, Mark Fasheh <mfasheh@versity.com>, Joel Becker <jlbec@evilplan.org>, Jens Axboe <axboe@fb.com>, Deepa Dinamani <deepa.kernel@gmail.com>, Mike Christie <mchristi@redhat.com>, Fabian Frederick <fabf@skynet.be>, linux-ext4@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, jfs-discussion@lists.sourceforge.net, linux-fsdevel@vger.kernel.org, ocfs2-devel@oss.oracle.com, reiserfs-devel@vger.kernel.org, Tahsin Erdogan <tahsin@google.com>

The ref count on ea_inode is incremented by
ext4_xattr_inode_orphan_add() which is supposed to be decremented by
ext4_xattr_inode_array_free(). The decrement is conditioned on whether
the ea_inode is currently on the orphan list. However, the orphan list
addition only happens when journaling is enabled. In non-journaled case,r
we fail to release the ref count causing an error message like below.

"VFS: Busy inodes after unmount of sdb. Self-destruct in 5 seconds.
Have a nice day..."

Signed-off-by: Tahsin Erdogan <tahsin@google.com>
---
 fs/ext4/xattr.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/fs/ext4/xattr.c b/fs/ext4/xattr.c
index 32ad2f2870e9..13daf634244b 100644
--- a/fs/ext4/xattr.c
+++ b/fs/ext4/xattr.c
@@ -2098,8 +2098,7 @@ ext4_xattr_inode_array_free(struct inode *inode,
 		if (err)
 			continue;
 		/* for inode's i_count get from ext4_xattr_delete_inode */
-		if (!list_empty(&EXT4_I(ea_inode)->i_orphan))
-			iput(ea_inode);
+		iput(ea_inode);
 		clear_nlink(ea_inode);
 		iput(ea_inode);
 	}
-- 
2.13.0.219.gdb65acc882-goog

