From: Vladimir Saveliev <vs@namesys.com>
Subject: Re: crash while processing safelinks caused by i_count==1
Date: Tue, 29 Mar 2005 18:22:48 +0400
Message-ID: <1112106167.4766.484.camel@tribesman.namesys.com>
References: <20050329031805.64398.qmail@web50207.mail.yahoo.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="=-jWRxAGt2m9TE0WzL7CZU"
Return-path: <reiserfs-list-return-23724-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20050329031805.64398.qmail@web50207.mail.yahoo.com>
List-Id: <reiserfs-devel.vger.kernel.org>
To: Andrew Wade <mscibing@yahoo.com>
Cc: reiserfs-list@namesys.com

--=-jWRxAGt2m9TE0WzL7CZU
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Hello

On Tue, 2005-03-29 at 07:18, Andrew Wade wrote:
> Hello,
> I have a reiser4 partion I can't mount.
> 
> fsck.reiser4 (1.0.4) gives it a clean bill of health.
> 
> Attempting to mount results in:
> (linux-2.6.12-rc1-mm3)
> 
> ef_hash_table: 8192 buckets
> z_hash_table: 8192 buckets
> z_hash_table: 8192 buckets
> j_hash_table: 16384 buckets
> loading reiser4 bitmap......done (7395 jiffies)
> d_cursor_hash_table: 256 buckets
> reiser4[mount(212)]: reiser4_iget
> (fs/reiser4/inode.c:478)[nikita-3559]:
> code: -2 at fs/reiser4/tree_walk.c:189
> WARNING: Unlinked inode found: 1030481
> 

Please try to mount with attached patch.

> Unable to handle kernel paging request at virtual address
> 6b6b6ccb
>  printing eip:
> c0238c9a
> *pde = 00000000
> Oops: 0000 [#1]
> PREEMPT
> CPU:    0
> EIP:    0060:[<c0238c9a>]    Not tainted VLI
> EFLAGS: 00010202   (2.6.12-rc1-mm3)
> EIP is at is_reiser4_super+0xa/0x30
> eax: 6b6b6b6b   ebx: 6b6b6b6b   ecx: 00000000   edx: 6b6b6b6b
> esi: de905380   edi: 0000000a   ebp: c0584100   esp: de8ebc48
> ds: 007b   es: 007b   ss: 0068
> Process mount (pid: 212, threadinfo=de8ea000 task=c1631a30)
> Stack: c0238be7 6b6b6b6b de905380 de905380 c0171722 de905380
> c0636f60 00000000
>        c0257db0 6b6b6b6b 00000000 0000000a c0584100 c1632888
> c1627dcc 000fb951
>        00000000 00000000 de8ebcbc dfbc3078 de8ebd4c c0257fa7
> dfbc3078 00000000
> Call Trace:
>  [<c0238be7>] get_tree+0x17/0xc0
>  [<c0171722>] iput+0x62/0x80
>  [<c0257db0>] process_safelink+0xb0/0x210
>  [<c0257fa7>] process_safelinks+0x97/0x130
>  [<c02572bf>] _init_safelink+0xf/0x20
>  [<c0257384>] reiser4_fill_super+0x44/0xc0
>  [<c015cc5f>] get_sb_bdev+0x10f/0x160
>  [<c0172d92>] alloc_vfsmnt+0x92/0xe0
>  [<c02476ff>] reiser4_get_sb+0x2f/0x40
>  [<c0257340>] reiser4_fill_super+0x0/0xc0
>  [<c015cec7>] do_kern_mount+0x57/0xe0
>  [<c01740ec>] do_new_mount+0x9c/0xe0
>  [<c0174867>] do_mount+0x147/0x1a0
>  [<c01746c3>] copy_mount_options+0x63/0xc0
>  [<c04b127e>] lock_kernel+0x2e/0x50
>  [<c0174d2f>] sys_mount+0x9f/0xe0
>  [<c0102c75>] syscall_call+0x7/0xb
> 
> I have determined that despite the Call Trace, the iput() in
> process_safelink() does in fact return, but it decrements
> i_count to 0 and thus deletes the inode early, leading to a
> crash soon after.
> 
> I am new at kernel hacking, and have not traced the problem
> further back yet.
> 
> 
> ______________________________________________________________________ 
> Post your free ad now! http://personals.yahoo.ca
> 

--=-jWRxAGt2m9TE0WzL7CZU
Content-Disposition: attachment; filename=reiser4-safelink-fix.patch
Content-Type: text/plain; name=reiser4-safelink-fix.patch; charset=koi8-r
Content-Transfer-Encoding: 7bit

 fs/reiser4/plugin/dir/dir.c   |    3 ++-
 fs/reiser4/plugin/file/file.c |    2 +-
 fs/reiser4/plugin/object.c    |    4 +++-
 fs/reiser4/safe_link.c        |   23 +++++++++++++----------
 fs/reiser4/safe_link.h        |    2 +-
 5 files changed, 20 insertions(+), 14 deletions(-)

diff -puN fs/reiser4/safe_link.c~reiser4-safelink-fix fs/reiser4/safe_link.c
--- linux-2.6.12-rc1-mm3/fs/reiser4/safe_link.c~reiser4-safelink-fix	2005-03-29 17:18:13.000000000 +0400
+++ linux-2.6.12-rc1-mm3-root/fs/reiser4/safe_link.c	2005-03-29 17:27:03.000000000 +0400
@@ -91,11 +91,12 @@ safe_link_locality(reiser4_tree *tree)
 
  */
 static reiser4_key *
-build_link_key(struct inode *inode, reiser4_safe_link_t link, reiser4_key *key)
+build_link_key(reiser4_tree *tree, oid_t oid, reiser4_safe_link_t link,
+	       reiser4_key *key)
 {
 	reiser4_key_init(key);
-	set_key_locality(key, safe_link_locality(tree_by_inode(inode)));
-	set_key_objectid(key, get_inode_oid(inode));
+	set_key_locality(key, safe_link_locality(tree));
+	set_key_objectid(key, oid);
 	set_key_offset(key, link);
 	return key;
 }
@@ -171,7 +172,7 @@ reiser4_internal int safe_link_add(struc
 		cputod64(inode->i_size, &sl.size);
 	}
 	tree = tree_by_inode(inode);
-	build_link_key(inode, link, &key);
+	build_link_key(tree, get_inode_oid(inode), link, &key);
 
 	result = store_black_box(tree, &key, &sl, length);
 	if (result == -EEXIST)
@@ -183,12 +184,13 @@ reiser4_internal int safe_link_add(struc
  * remove safe-link corresponding to the operation @link on inode @inode from
  * the tree.
  */
-reiser4_internal int safe_link_del(struct inode *inode, reiser4_safe_link_t link)
+reiser4_internal int
+safe_link_del(reiser4_tree *tree, oid_t oid, reiser4_safe_link_t link)
 {
 	reiser4_key key;
 
-	return kill_black_box(tree_by_inode(inode),
-			      build_link_key(inode, link, &key));
+	return kill_black_box(tree,
+			      build_link_key(tree, oid, link, &key));
 }
 
 /*
@@ -273,6 +275,7 @@ static int process_safelink(struct super
 
 		fplug = inode_file_plugin(inode);
 		assert("nikita-3428", fplug != NULL);
+		assert("", oid == get_inode_oid(inode));
 		if (fplug->safelink != NULL) {
 			/* txn_restart_current is not necessary because
 			 * mounting is signle thread. However, without it
@@ -295,11 +298,11 @@ static int process_safelink(struct super
 		reiser4_iget_complete(inode);
 		iput(inode);
 		if (result == 0) {
-			result = safe_link_grab(tree_by_inode(inode),
+			result = safe_link_grab(get_tree(super),
 						BA_CAN_COMMIT);
 			if (result == 0)
-				result = safe_link_del(inode, link);
-			safe_link_release(tree_by_inode(inode));
+				result = safe_link_del(get_tree(super), oid, link);
+			safe_link_release(get_tree(super));
 			/*
 			 * restart transaction: if there was large number of
 			 * safe-links, their processing may fail to fit into
diff -puN fs/reiser4/safe_link.h~reiser4-safelink-fix fs/reiser4/safe_link.h
--- linux-2.6.12-rc1-mm3/fs/reiser4/safe_link.h~reiser4-safelink-fix	2005-03-29 17:18:13.000000000 +0400
+++ linux-2.6.12-rc1-mm3-root/fs/reiser4/safe_link.h	2005-03-29 17:18:13.000000000 +0400
@@ -11,7 +11,7 @@
 int safe_link_grab(reiser4_tree *tree, reiser4_ba_flags_t flags);
 void safe_link_release(reiser4_tree *tree);
 int safe_link_add(struct inode *inode, reiser4_safe_link_t link);
-int safe_link_del(struct inode *inode, reiser4_safe_link_t link);
+int safe_link_del(reiser4_tree *, oid_t oid, reiser4_safe_link_t link);
 
 int process_safelinks(struct super_block *super);
 
diff -puN fs/reiser4/plugin/dir/dir.c~reiser4-safelink-fix fs/reiser4/plugin/dir/dir.c
--- linux-2.6.12-rc1-mm3/fs/reiser4/plugin/dir/dir.c~reiser4-safelink-fix	2005-03-29 17:18:13.000000000 +0400
+++ linux-2.6.12-rc1-mm3-root/fs/reiser4/plugin/dir/dir.c	2005-03-29 17:27:50.000000000 +0400
@@ -142,7 +142,8 @@ link_common(struct inode *parent /* pare
 	 * reiser4_unlink() viz. creation of safe-link.
 	 */
 	if (unlikely(inode_file_plugin(object)->not_linked(object))) {
-		result = safe_link_del(object, SAFE_UNLINK);
+		result = safe_link_del(tree_by_inode(object),
+				       get_inode_oid(object), SAFE_UNLINK);
 		if (result != 0)
 			return result;
 	}
diff -puN fs/reiser4/plugin/file/file.c~reiser4-safelink-fix fs/reiser4/plugin/file/file.c
--- linux-2.6.12-rc1-mm3/fs/reiser4/plugin/file/file.c~reiser4-safelink-fix	2005-03-29 17:18:13.000000000 +0400
+++ linux-2.6.12-rc1-mm3-root/fs/reiser4/plugin/file/file.c	2005-03-29 17:18:13.000000000 +0400
@@ -2521,7 +2521,7 @@ setattr_truncate(struct inode *inode, st
 
 	s_result = safe_link_grab(tree, BA_CAN_COMMIT);
 	if (s_result == 0)
-		s_result = safe_link_del(inode, SAFE_TRUNCATE);
+		s_result = safe_link_del(tree, get_inode_oid(inode), SAFE_TRUNCATE);
 	if (s_result != 0) {
 		warning("nikita-3417", "Cannot kill safelink %lli: %i",
 			(unsigned long long)get_inode_oid(inode), s_result);
diff -puN fs/reiser4/plugin/object.c~reiser4-safelink-fix fs/reiser4/plugin/object.c
--- linux-2.6.12-rc1-mm3/fs/reiser4/plugin/object.c~reiser4-safelink-fix	2005-03-29 17:18:13.000000000 +0400
+++ linux-2.6.12-rc1-mm3-root/fs/reiser4/plugin/object.c	2005-03-29 17:18:13.000000000 +0400
@@ -507,7 +507,9 @@ common_object_delete_no_reserve(struct i
 			if (result == 0) {
 				oid_count_released();
 
-				result = safe_link_del(inode, SAFE_UNLINK);
+				result = safe_link_del(tree_by_inode(inode),
+						       get_inode_oid(inode),
+						       SAFE_UNLINK);
 			}
 		}
 	} else

_

--=-jWRxAGt2m9TE0WzL7CZU--

