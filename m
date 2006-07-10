From: Edward Shishkin <edward@namesys.com>
Subject: Re: 2.6.18-rc1-mm1 reiser4 module calls generic_file_read
Date: Mon, 10 Jul 2006 17:37:50 +0400
Message-ID: <44B2582E.30004@namesys.com>
References: <20060709021106.9310d4d1.akpm@osdl.org> <44B1798A.7080901@free.fr>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------040103070807070605000105"
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S964948AbWGJNiK@vger.kernel.org>
In-Reply-To: <44B1798A.7080901@free.fr>
Sender: linux-kernel-owner@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
To: Laurent Riffard <laurent.riffard@free.fr>, Andrew Morton <akpm@osdl.org>
Cc: Kernel development list <linux-kernel@vger.kernel.org>, reiserfs-list@namesys.com

This is a multi-part message in MIME format.
--------------040103070807070605000105
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit

Laurent Riffard wrote:
> generic_file_read has been dropped from 2.6.18-rc1-mm1. This patch 
> works for me. Does it look good to reiser4 devloppers ?
> 

No, it does not.
I have attached the correct one.
Andrew, please apply

Thanks,
Edward.

--------------040103070807070605000105
Content-Type: text/x-diff;
 name="reiser4-generic_file_read-fix.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="reiser4-generic_file_read-fix.patch"

Use do_sync_read() instead of generic_file_read()

Signed-off-by: Edward Shishkin <edward@namesys.com>
---
 linux-2.6.18-rc1-mm1/fs/reiser4/plugin/file/cryptcompress.c |    2 +-
 linux-2.6.18-rc1-mm1/fs/reiser4/plugin/object.c             |    1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

Index: linux-2.6.18-rc1-mm1/fs/reiser4/plugin/file/cryptcompress.c
===================================================================
--- linux-2.6.18-rc1-mm1/fs/reiser4/plugin/file/cryptcompress.c.orig
+++ linux-2.6.18-rc1-mm1/fs/reiser4/plugin/file/cryptcompress.c
@@ -2883,7 +2883,7 @@
 	down_read(&info->lock);
 	LOCK_CNT_INC(inode_sem_r);
 
-	result = generic_file_read(file, buf, size, off);
+	result = do_sync_read(file, buf, size, off);
 
 	up_read(&info->lock);
 	LOCK_CNT_DEC(inode_sem_r);
Index: linux-2.6.18-rc1-mm1/fs/reiser4/plugin/object.c
===================================================================
--- linux-2.6.18-rc1-mm1/fs/reiser4/plugin/object.c.orig
+++ linux-2.6.18-rc1-mm1/fs/reiser4/plugin/object.c
@@ -305,6 +305,7 @@
 			.llseek = generic_file_llseek,
 			.read = read_cryptcompress,
 			.write = write_cryptcompress,
+			.aio_read = generic_file_aio_read,
 			.mmap = mmap_cryptcompress,
 			.release = release_cryptcompress,
 			.fsync = sync_common,

--------------040103070807070605000105--
