From: Laurent Riffard <laurent.riffard@free.fr>
Subject: [PATCH 10/10] reiser4-generic_file_read-fix
Date: Sat,  2 Dec 2006 14:16:31 +0100
Message-ID: <11650653923313-git-send-email-laurent.riffard@free.fr>
References: <1165065391908-git-send-email-laurent.riffard@free.fr> <1165065391122-git-send-email-laurent.riffard@free.fr> <1165065391534-git-send-email-laurent.riffard@free.fr> <11650653912299-git-send-email-laurent.riffard@free.fr> <11650653921903-git-send-email-laurent.riffard@free.fr> <11650653921405-git-send-email-laurent.riffard@free.fr> <11650653923297-git-send-email-laurent.riffard@free.fr> <11650653921199-git-send-email-laurent.riffard@free.fr> <11650653923903-git-send-email-laurent.riffard@free.fr> <11650653921081-git-send-email-laurent.riffard@free.fr>
Return-path: <reiserfs-list-return-30271-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <11650653921081-git-send-email-laurent.riffard@free.fr>
List-Id: <reiserfs-devel.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com
Cc: Edward Shishkin <edward@namesys.com>

From: Edward Shishkin <edward@namesys.com>

Use do_sync_read() instead of generic_file_read()
---
 fs/reiser4/plugin/file/cryptcompress.c |    2 +-
 fs/reiser4/plugin/object.c             |    1 +
 2 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/fs/reiser4/plugin/file/cryptcompress.c b/fs/reiser4/plugin/file/cryptcompress.c
index b587933..64137dc 100644
--- a/fs/reiser4/plugin/file/cryptcompress.c
+++ b/fs/reiser4/plugin/file/cryptcompress.c
@@ -2883,7 +2883,7 @@ ssize_t read_cryptcompress(struct file * file, char __user *buf, size_t size,
 	down_read(&info->lock);
 	LOCK_CNT_INC(inode_sem_r);
 
-	result = generic_file_read(file, buf, size, off);
+	result = do_sync_read(file, buf, size, off);
 
 	up_read(&info->lock);
 	LOCK_CNT_DEC(inode_sem_r);
diff --git a/fs/reiser4/plugin/object.c b/fs/reiser4/plugin/object.c
index a57ce06..9f11dd6 100644
--- a/fs/reiser4/plugin/object.c
+++ b/fs/reiser4/plugin/object.c
@@ -305,6 +305,7 @@ file_plugin file_plugins[LAST_FILE_PLUGIN_ID] = {
 			.llseek = generic_file_llseek,
 			.read = read_cryptcompress,
 			.write = write_cryptcompress,
+			.aio_read = generic_file_aio_read,
 			.mmap = mmap_cryptcompress,
 			.release = release_cryptcompress,
 			.fsync = sync_common,
-- 
1.4.4.1.gaed4

