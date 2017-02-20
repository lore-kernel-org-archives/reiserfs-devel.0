From: edward.shishkin@gmail.com
Subject: [PATCH] reiser4: port for Linux-4.10
Date: Mon, 20 Feb 2017 17:54:51 +0100
Message-ID: <1487609691-13761-1-git-send-email-edward.shishkin@gmail.com>
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=1+Khoch276TlHprnT5/hEAPOWJo+TG8bqM1T7c8NsI8=;
        b=n2LMIp00blIzrTXAA8NMVqWK2wElwjmYi0PfL5LJBvOrt65CpZR3pkpL0DPx5wSe82
         vpB9dzuEasRTrn3Oqpt/5zRebzVAabuXBE+0eRre0pf8jlomZF0Dx/8yb6/BmoJY54fb
         nx0n5xco9wACVLAcdnynUN2QUBIDBDgLJX6gLtVDHyTJy+pKGEnmzLeWlCy9wjAdVEWT
         nUe+7r403QmgHWk4rIlRRIZPqYzfl6T3TROMYgZByfzxEQZjwvEv8tZ1GAHgX1zo/ZcH
         cWrt6EWp7zLO2h25gP4pdk7WFuFQ6zoX+GvwewGxD9Q9J/IyvwOrAnjSsgo+jrlaB7kH
         MbJw==
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Reiserfs development mailing list <reiserfs-devel@vger.kernel.org>
Cc: Edward Shishkin <edward.shishkin@gmail.com>

From: Edward Shishkin <edward.shishkin@gmail.com>

1) Flag WRITE_FLUSH_FUA gone. Use a combination of REQ_PREFLUSH
and REQ_FUA instead;
2) ->readlink() of inode operations gone.

Signed-off-by: Edward Shishkin <edward.shishkin@gmail.com>
---
 plugin/object.c | 1 -
 wander.c        | 2 +-
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/plugin/object.c b/plugin/object.c
index 01f1bba..c039455 100644
--- a/plugin/object.c
+++ b/plugin/object.c
@@ -155,7 +155,6 @@ static struct address_space_operations regular_file_a_ops = {
 
 /* VFS methods for symlink files */
 static struct inode_operations symlink_file_i_ops = {
-	.readlink = generic_readlink,
 	.get_link = reiser4_get_link_common,
 	.permission = reiser4_permission_common,
 	.setattr = reiser4_setattr_common,
diff --git a/wander.c b/wander.c
index 407bb5e..8595c22 100644
--- a/wander.c
+++ b/wander.c
@@ -708,7 +708,7 @@ static int write_jnodes_to_disk_extent(
 	flush_queue_t *fq, int flags)
 {
 	struct super_block *super = reiser4_get_current_sb();
-	int op_flags = (flags & WRITEOUT_FLUSH_FUA) ? WRITE_FLUSH_FUA : 0;
+	int op_flags = (flags & WRITEOUT_FLUSH_FUA) ? REQ_PREFLUSH | REQ_FUA : 0;
 	jnode *cur = first;
 	reiser4_block_nr block;
 
-- 
2.7.4

