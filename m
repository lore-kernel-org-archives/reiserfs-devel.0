From: Laurent Riffard <laurent.riffard@free.fr>
Subject: [PATCH 10/10] reiser4-generic_file_read-fix
Date: Sun, 03 Dec 2006 14:51:40 +0100
Message-ID: <4572D66C.5000403a@free.fr>
References: <4571D852.3080401@free.fr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-30293-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <4571D852.3080401@free.fr>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: "reiserfs-list@namesys.com" <reiserfs-list@namesys.com>

(From Edward Shishkin <edward.shishkin@gmail.com>)

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
-- 1.4.4.1.gaed4 




