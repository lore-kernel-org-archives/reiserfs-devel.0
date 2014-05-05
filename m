From: Ivan Shapovalov <intelfx100@gmail.com>
Subject: [PATCH] reiser4: remove an assertion "nikita-2577" which is no longer possible to check.
Date: Tue,  6 May 2014 03:59:48 +0400
Message-ID: <1399334388-9660-1-git-send-email-intelfx100@gmail.com>
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=from:to:cc:subject:date:message-id;
        bh=M7yGBkAuH/3cKmuiFxWePmLuaMZruThGT+BEAEeo+00=;
        b=zgCzvtgCOt5OkzVeaCE5kVGHM+umyEkL6q1OIYR3eG7IHWcmItBrloYJSMUTTIr4y3
         xcI8x2FQJhW6ZceTujpEE+AiJPIJSM5UgsSXhDZ1PKr65b6V6mcI4xL3+SpPSgRronWP
         F53RulLMhv0gTIXtlW/uOOnhGrVjKH3PWeh9nH+l87w5N5HubMEsBahwG23yERFL7odu
         vvpFlNQRDNQUPRFwaOdwCIeYroJVkkKIOaF0VRN1XT6PW9gKQuAbP5phCCbUaUw3qreB
         38fqVBSQbANdE/xepAO09RRqd+BqpyE8BHOStV4plvzgiKtHXVnyAsKRDjOEL3uaG9TF
         47tA==
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-devel@vger.kernel.org
Cc: Ivan Shapovalov <intelfx100@gmail.com>

Since 3.11, file->f_pos is not up-to-date during an iterate() in progress. This
was true for readdir(), but is no longer so.

Signed-off-by: Ivan Shapovalov <intelfx100@gmail.com>
---

Is this correct? I assume that adjust_dir_pos() is called simultaneously with
iterate()... or not? If not, then passing 'dir->f_pos' to reiser4_get_dir_fpos()
will suffice.

 fs/reiser4/plugin/file_ops_readdir.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/fs/reiser4/plugin/file_ops_readdir.c b/fs/reiser4/plugin/file_ops_readdir.c
index 0da5ac5..f53573c 100644
--- a/fs/reiser4/plugin/file_ops_readdir.c
+++ b/fs/reiser4/plugin/file_ops_readdir.c
@@ -58,8 +58,6 @@ adjust_dir_pos(struct file *dir, struct readdir_pos *readdir_spot,
 		/* logical number of directory entry readdir is "looking" at
 		 * changes */
 		readdir_spot->entry_no += adj;
-		assert("nikita-2577",
-		       ergo(dir != NULL, reiser4_get_dir_fpos(dir) + adj >= 0));
 		if (de_id_cmp(&pos->dir_entry_key,
 			      &mod_point->dir_entry_key) == EQUAL_TO) {
 			assert("nikita-2575", mod_point->pos < pos->pos);
-- 
1.9.2

