From: Alexander Zarochentsev <zam@namesys.com>
Subject: Re: kernel BUG at /usr/src/sources/linux-2.6.16-rc5/fs/reiser4/plugin/file/tail_conversion.c:29
Date: Thu, 16 Mar 2006 10:28:37 +0300
Message-ID: <200603161028.38749.zam@namesys.com>
References: <20060315075034.GC17577@zeus.uziel.local> <200603151111.49826.zam@namesys.com> <20060315194013.GA13074@zeus.uziel.local>
Mime-Version: 1.0
Content-Type: Multipart/Mixed;
  boundary="Boundary-00=_mORGETKcHk9uzjD"
Return-path: <reiserfs-list-return-28289-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20060315194013.GA13074@zeus.uziel.local>
List-Id: <reiserfs-devel.vger.kernel.org>
To: reiserfs-list@namesys.com
Cc: Christian Trefzer <ctrefzer@gmx.de>

--Boundary-00=_mORGETKcHk9uzjD
Content-Type: text/plain;
  charset="koi8-r"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hello,

On Wednesday 15 March 2006 22:40, Christian Trefzer wrote:
> Hi zam,
>
> after the first build of OOo has finished (as "gift" for my laptop)
> the machine is working on it's own copy, after a reboot with the
> exact same setup yielding my BUG problems plus your patch applied.
> I'll keep an eye on my syslog. Sorry for taking so long!

I guess it was in release_unix_file where get_exclusive_access is called 
outside reiser4_context.

can you please replace the old patch by the attached one?

>
> Regards,
> Chris

-- 
Alex.

--Boundary-00=_mORGETKcHk9uzjD
Content-Type: text/x-diff;
  charset="koi8-r";
  name="reiser4-have-get_exclusive_access-restart-transaction.diff"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
	filename="reiser4-have-get_exclusive_access-restart-transaction.diff"

From: Alexander Zarochentsev <zam@namesys.com>

Have get_exclusive_access() restart transaction before taking r/w semaphore.

There are several places in write_unix_file and extent_balance_dirty_pages
where transaction may be open before calling get_exclusive_access.  It triggers
the "deadlock detection" BUG_ON inside get_exclusive_access().

This patch fixes the bug by embedding txn_restart into the
get_exclusive_access() code and cleanes up other places where txn_restart() was
called right before get_eclusive_access(). 

Signed-off-by: zam@namesys.com

 fs/reiser4/plugin/file/file.c            |   13 -------------
 fs/reiser4/plugin/file/tail_conversion.c |    8 +++++---
 2 files changed, 5 insertions(+), 16 deletions(-)

Index: linux-2.6.16-rc5-mm2/fs/reiser4/plugin/file/file.c
===================================================================
--- linux-2.6.16-rc5-mm2.orig/fs/reiser4/plugin/file/file.c
+++ linux-2.6.16-rc5-mm2/fs/reiser4/plugin/file/file.c
@@ -1451,9 +1451,6 @@ static int commit_file_atoms(struct inod
 	int result;
 	unix_file_info_t *uf_info;
 
-	/* close current transaction */
-	txn_restart_current();
-
 	uf_info = unix_file_inode_data(inode);
 
 	/*
@@ -2174,7 +2171,6 @@ append_and_or_overwrite(hint_t * hint, s
 				done_lh(&hint->lh);
 				if (!exclusive) {
 					drop_nonexclusive_access(uf_info);
-					txn_restart_current();
 					get_exclusive_access(uf_info);
 				}
 				result = tail2extent(uf_info);
@@ -2964,15 +2960,6 @@ int delete_object_unix_file(struct inode
 	unix_file_info_t *uf_info;
 	int result;
 
-	/*
-	 * transaction can be open already. For example:
-	 * writeback_inodes->sync_sb_inodes->reiser4_sync_inodes->
-	 * generic_sync_sb_inodes->iput->generic_drop_inode->
-	 * generic_delete_inode->reiser4_delete_inode->delete_object_unix_file.
-	 * So, restart transaction to avoid deadlock with file rw semaphore.
-	 */
-	txn_restart_current();
-
 	if (inode_get_flag(inode, REISER4_NO_SD))
 		return 0;
 
Index: linux-2.6.16-rc5-mm2/fs/reiser4/plugin/file/tail_conversion.c
===================================================================
--- linux-2.6.16-rc5-mm2.orig/fs/reiser4/plugin/file/tail_conversion.c
+++ linux-2.6.16-rc5-mm2/fs/reiser4/plugin/file/tail_conversion.c
@@ -16,17 +16,19 @@
 /* exclusive access to a file is acquired when file state changes: tail2extent, empty2tail, extent2tail, etc */
 void get_exclusive_access(unix_file_info_t * uf_info)
 {
+	reiser4_context * ctx = get_current_context_check();
+
 	assert("nikita-3028", schedulable());
 	assert("nikita-3047", LOCK_CNT_NIL(inode_sem_w));
 	assert("nikita-3048", LOCK_CNT_NIL(inode_sem_r));
 	/*
-	 * "deadlock detection": sometimes we commit a transaction under
+	 * "deadlock avoidance": sometimes we commit a transaction under
 	 * rw-semaphore on a file. Such commit can deadlock with another
 	 * thread that captured some block (hence preventing atom from being
 	 * committed) and waits on rw-semaphore.
 	 */
-	assert("nikita-3361", get_current_context()->trans->atom == NULL);
-	BUG_ON(get_current_context()->trans->atom != NULL);
+	if (ctx != NULL)
+		txn_restart(ctx);
 	LOCK_CNT_INC(inode_sem_w);
 	down_write(&uf_info->latch);
 	uf_info->exclusive_use = 1;

--Boundary-00=_mORGETKcHk9uzjD--
