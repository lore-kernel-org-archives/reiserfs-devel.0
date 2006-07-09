From: Laurent Riffard <laurent.riffard@free.fr>
Subject: Re: 2.6.18-rc1-mm1 reiser4 module calls generic_file_read
Date: Sun, 09 Jul 2006 23:47:54 +0200
Message-ID: <44B1798A.7080901@free.fr>
References: <20060709021106.9310d4d1.akpm@osdl.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-28947-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20060709021106.9310d4d1.akpm@osdl.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Andrew Morton <akpm@osdl.org>, Kernel development list <linux-kernel@vger.kernel.org>, reiserfs-list@namesys.com

generic_file_read has been dropped from 2.6.18-rc1-mm1. This patch 
works for me. Does it look good to reiser4 devloppers ?

Signed-off-by: Laurent Riffard <laurent.riffard@free.fr>
---
 fs/reiser4/plugin/file/cryptcompress.c |    2 +-
 1 files changed, 1 insertion(+), 1 deletion(-)

Index: linux-2.6-mm/fs/reiser4/plugin/file/cryptcompress.c
===================================================================
--- linux-2.6-mm.orig/fs/reiser4/plugin/file/cryptcompress.c
+++ linux-2.6-mm/fs/reiser4/plugin/file/cryptcompress.c
@@ -2883,7 +2883,7 @@ ssize_t read_cryptcompress(struct file *
 	down_read(&info->lock);
 	LOCK_CNT_INC(inode_sem_r);
 
-	result = generic_file_read(file, buf, size, off);
+	result = do_sync_read(file, buf, size, off);
 
 	up_read(&info->lock);
 	LOCK_CNT_DEC(inode_sem_r);

