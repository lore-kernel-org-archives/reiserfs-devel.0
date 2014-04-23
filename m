From: Jeff Mahoney <jeffm@suse.com>
Subject: [patch 10/29] reiserfs: cleanup, remove unnecessary parens in dirent creation
Date: Wed, 23 Apr 2014 10:00:43 -0400
Message-ID: <20140423151140.378184169@suse.com>
References: <20140423140033.704113918@suse.com>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Content-Disposition: inline; filename=reiserfs/reiserfs-cleanup-remove-unnecessary-parens-in-dirent-creation
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: ReiserFS Development List <reiserfs-devel@vger.kernel.org>
Cc: Jan Kara <jack@suse.cz>, Dave Jones <davej@redhat.com>

make_empty_dir_item_v1 and make_empty_dir_item also needed a bit of cleanup
but it's clearer to use separate pointers rather than the array positions
for just two items.

Signed-off-by: Jeff Mahoney <jeffm@suse.com>
---
 fs/reiserfs/dir.c |   67 +++++++++++++++++++++++++++---------------------------
 1 file changed, 34 insertions(+), 33 deletions(-)

--- a/fs/reiserfs/dir.c
+++ b/fs/reiserfs/dir.c
@@ -282,65 +282,66 @@ static int reiserfs_readdir(struct file
 void make_empty_dir_item_v1(char *body, __le32 dirid, __le32 objid,
 			    __le32 par_dirid, __le32 par_objid)
 {
-	struct reiserfs_de_head *deh;
+	struct reiserfs_de_head *dot, *dotdot;
 
 	memset(body, 0, EMPTY_DIR_SIZE_V1);
-	deh = (struct reiserfs_de_head *)body;
+	dot = (struct reiserfs_de_head *)body;
+	dotdot = dot + 1;
 
 	/* direntry header of "." */
-	put_deh_offset(&(deh[0]), DOT_OFFSET);
+	put_deh_offset(dot, DOT_OFFSET);
 	/* these two are from make_le_item_head, and are are LE */
-	deh[0].deh_dir_id = dirid;
-	deh[0].deh_objectid = objid;
-	deh[0].deh_state = 0;	/* Endian safe if 0 */
-	put_deh_location(&(deh[0]), EMPTY_DIR_SIZE_V1 - strlen("."));
-	mark_de_visible(&(deh[0]));
+	dot->deh_dir_id = dirid;
+	dot->deh_objectid = objid;
+	dot->deh_state = 0;	/* Endian safe if 0 */
+	put_deh_location(dot, EMPTY_DIR_SIZE_V1 - strlen("."));
+	mark_de_visible(dot);
 
 	/* direntry header of ".." */
-	put_deh_offset(&(deh[1]), DOT_DOT_OFFSET);
+	put_deh_offset(dotdot, DOT_DOT_OFFSET);
 	/* key of ".." for the root directory */
 	/* these two are from the inode, and are are LE */
-	deh[1].deh_dir_id = par_dirid;
-	deh[1].deh_objectid = par_objid;
-	deh[1].deh_state = 0;	/* Endian safe if 0 */
-	put_deh_location(&(deh[1]), deh_location(&(deh[0])) - strlen(".."));
-	mark_de_visible(&(deh[1]));
+	dotdot->deh_dir_id = par_dirid;
+	dotdot->deh_objectid = par_objid;
+	dotdot->deh_state = 0;	/* Endian safe if 0 */
+	put_deh_location(dotdot, deh_location(dot) - strlen(".."));
+	mark_de_visible(dotdot);
 
 	/* copy ".." and "." */
-	memcpy(body + deh_location(&(deh[0])), ".", 1);
-	memcpy(body + deh_location(&(deh[1])), "..", 2);
+	memcpy(body + deh_location(dot), ".", 1);
+	memcpy(body + deh_location(dotdot), "..", 2);
 }
 
 /* compose directory item containing "." and ".." entries */
 void make_empty_dir_item(char *body, __le32 dirid, __le32 objid,
 			 __le32 par_dirid, __le32 par_objid)
 {
-	struct reiserfs_de_head *deh;
+	struct reiserfs_de_head *dot, *dotdot;
 
 	memset(body, 0, EMPTY_DIR_SIZE);
-	deh = (struct reiserfs_de_head *)body;
+	dot = (struct reiserfs_de_head *)body;
+	dotdot = dot + 1;
 
 	/* direntry header of "." */
-	put_deh_offset(&(deh[0]), DOT_OFFSET);
+	put_deh_offset(dot, DOT_OFFSET);
 	/* these two are from make_le_item_head, and are are LE */
-	deh[0].deh_dir_id = dirid;
-	deh[0].deh_objectid = objid;
-	deh[0].deh_state = 0;	/* Endian safe if 0 */
-	put_deh_location(&(deh[0]), EMPTY_DIR_SIZE - ROUND_UP(strlen(".")));
-	mark_de_visible(&(deh[0]));
+	dot->deh_dir_id = dirid;
+	dot->deh_objectid = objid;
+	dot->deh_state = 0;	/* Endian safe if 0 */
+	put_deh_location(dot, EMPTY_DIR_SIZE - ROUND_UP(strlen(".")));
+	mark_de_visible(dot);
 
 	/* direntry header of ".." */
-	put_deh_offset(&(deh[1]), DOT_DOT_OFFSET);
+	put_deh_offset(dotdot, DOT_DOT_OFFSET);
 	/* key of ".." for the root directory */
 	/* these two are from the inode, and are are LE */
-	deh[1].deh_dir_id = par_dirid;
-	deh[1].deh_objectid = par_objid;
-	deh[1].deh_state = 0;	/* Endian safe if 0 */
-	put_deh_location(&(deh[1]),
-			 deh_location(&(deh[0])) - ROUND_UP(strlen("..")));
-	mark_de_visible(&(deh[1]));
+	dotdot->deh_dir_id = par_dirid;
+	dotdot->deh_objectid = par_objid;
+	dotdot->deh_state = 0;	/* Endian safe if 0 */
+	put_deh_location(dotdot, deh_location(dot) - ROUND_UP(strlen("..")));
+	mark_de_visible(dotdot);
 
 	/* copy ".." and "." */
-	memcpy(body + deh_location(&(deh[0])), ".", 1);
-	memcpy(body + deh_location(&(deh[1])), "..", 2);
+	memcpy(body + deh_location(dot), ".", 1);
+	memcpy(body + deh_location(dotdot), "..", 2);
 }


