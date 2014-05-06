From: Ivan Shapovalov <intelfx100@gmail.com>
Subject: [PATCHv2] reiser4: fix an assertion broken since 3.11.
Date: Tue,  6 May 2014 15:18:19 +0400
Message-ID: <1399375099-6927-1-git-send-email-intelfx100@gmail.com>
References: <53688D9F.4090101@gmail.com>
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=L5ZVtNzaQSl94mP/CoLod5uvzZluiDl4fiS8QHH9Y1s=;
        b=dxg/4mCoq618vGf5vEwe2ysWY3NC4p21Al8RMAKZJf0NjyyyWmJr4RbEaL5zCsLuy2
         Jz5GxHguKbJ+aPbmuKA+X8rimpSzQ2nl8wUfScjecqSorD06uarnW+FfN3LDmTy7WY9s
         TJbB+TaDd6mLx2a7DkUUHM9oIDRN0Dj9XXkvSyZ7XyjTVBE9vTqWtkv6TSq0mKbYTcoh
         y/OnXJ7PQrQGszuk9kmqbRvW+NQbd9uMuc9TG/8JPEz8owWkOFMz7nWy/thlMS56wV1h
         aJ2PhRW51Sz84FXeG3Q02Spq8I4ySVadKifN76HyKWLx0lUuTVTSHVbJ3n9Bf4gb7xIm
         iJvQ==
In-Reply-To: <53688D9F.4090101@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-devel@vger.kernel.org
Cc: edward.shishkin@gmail.com, Ivan Shapovalov <intelfx100@gmail.com>

reiser4_get_dir_fpos takes an extra argument. It should be safe to pass
dir->f_pos (thus keeping the old behavior exactly).

Signed-off-by: Ivan Shapovalov <intelfx100@gmail.com>
---

OK, got it.

 fs/reiser4/plugin/file_ops_readdir.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/fs/reiser4/plugin/file_ops_readdir.c b/fs/reiser4/plugin/file_ops_readdir.c
index 0da5ac5..e359dec 100644
--- a/fs/reiser4/plugin/file_ops_readdir.c
+++ b/fs/reiser4/plugin/file_ops_readdir.c
@@ -59,7 +59,8 @@ adjust_dir_pos(struct file *dir, struct readdir_pos *readdir_spot,
 		 * changes */
 		readdir_spot->entry_no += adj;
 		assert("nikita-2577",
-		       ergo(dir != NULL, reiser4_get_dir_fpos(dir) + adj >= 0));
+		       ergo(dir != NULL, reiser4_get_dir_fpos(dir, dir->f_pos) + adj
+		                         >= 0));
 		if (de_id_cmp(&pos->dir_entry_key,
 			      &mod_point->dir_entry_key) == EQUAL_TO) {
 			assert("nikita-2575", mod_point->pos < pos->pos);
-- 
1.9.2

