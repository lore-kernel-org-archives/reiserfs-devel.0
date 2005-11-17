From: "Vladimir V. Saveliev" <vs@namesys.com>
Subject: Re: More Slowdown
Date: Thu, 17 Nov 2005 15:40:57 +0300
Message-ID: <437C7A59.7040008@namesys.com>
References: <200511111359.39715.jgilmore@glycou.com>	 <200511120906.39109.jgilmore@glycou.com>	 <1131997263.10816.56.camel@teratron.lan.etheus.net>	 <200511142147.07787.chrivers@iversen-net.dk>	 <1132064829.8002.9.camel@teratron.lan.etheus.net> <b14e81f00511161908k30ed471esbc12b284842b8078@mail.gmail.com> <437C0BF1.3080109@namesys.com> <437C715A.206@ursynow.2a.pl>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------090100080100050905070304"
Return-path: <reiserfs-list-return-26978-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <437C715A.206@ursynow.2a.pl>
List-Id: <reiserfs-devel.vger.kernel.org>
To: =?ISO-8859-1?Q?Artur_Mak=F3wka?= <juice@ursynow.2a.pl>
Cc: michael chang <thenewme91@gmail.com>, Craig Shelley <craig@microtron.org.uk>, reiserfs-list@namesys.com, Reiserfs-dev <reiserfs-dev@namesys.com>

--------------090100080100050905070304
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hello

Artur Mak=F3wka wrote:
> Hans Reiser wrote:
>> fsync can be dramatically better optimized, and it will be after the
>> kernel merge work is completed.  This optimization will likely consist
>> of reducing the tendency to merge atoms and handling fsync by using
>> write twice algorithms to a fixed journal area.  Other improvements will
>> doubtless be found when time is spent on it.  I am sorry that vim and
>> evolution are suffering so much from our neglecting fsync until after
>> the merge.  fsync is one of the things I would have us working on if I
>> had my choice of what we improved in reiser4 rather than other persons
>> making that choice for us at the moment.  Oh well, such is life in the
>> society of men.;-)
>>
>> It looks like akpm is going to start reading the reiser4 code.  I
>> suspect his remarks will be a step above the ones made so far, he wrote
>> such nice readahead code.
>>
>=20
> Just want to add, that for desktop systems its only vim and evolution,
> but for my free hosting server it was very frequent system crashes
> (because of that i lost part of my database) and so on. Just want to
> warn anyone deciding to use reiser4 on server, to use 2.6.12 kernels or
> lower as this bug is almost not existent there.
>=20
> For some uses of reiser4 this bug is very dangerous. Not just slow work
> of some application, but like i said data loss, system instability (few
> crashes every day), and so on.
>=20
> I would say such a bug/design choice should be top priority, number one.
> Of course thats not true if reiser4 is meant to be only for home use.
> Just want to point that out, because it seems everybody is using reiser4
> only at home, and i am the only one on earth using it on server
> environment (i guess that wasn't the best idea...)
>=20
> Thanks in advance for consideration of taking this bug to top of your
> TODO list.
>=20

Please try whether the attached patch improves anything. It simplifies fsyn=
c by
avoid commiting of transactions which do not modify file being fsync-ed.

The patch applied to 2.6.14-mm2 with warnings, but that can be ignored.



--------------090100080100050905070304
Content-Type: text/plain;
 name="reiser4-fix-fsync.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="reiser4-fix-fsync.patch"


This patch simplifies reiser4's fsync. 
It is an experimental patch to test whether it helps against slowdowns reported by users.


 fs/reiser4/plugin/file/file.c |   14 ++++++++++++++
 fs/reiser4/txnmgr.c           |   22 +++++++++++++++-------
 fs/reiser4/txnmgr.h           |    1 +
 3 files changed, 30 insertions(+), 7 deletions(-)

diff -puN fs/reiser4/plugin/file/file.c~reiser4-fix-fsync fs/reiser4/plugin/file/file.c
--- linux-2.6.14-mm2/fs/reiser4/plugin/file/file.c~reiser4-fix-fsync	2005-11-17 13:42:26.000000000 +0300
+++ linux-2.6.14-mm2-vs/fs/reiser4/plugin/file/file.c	2005-11-17 13:42:26.000000000 +0300
@@ -1633,11 +1633,25 @@ int sync_unix_file(struct file *file, st
 {
 	int result;
 	reiser4_context *ctx;
+	txn_atom *atom;
+	reiser4_block_nr reserve;
 
 	ctx = init_context(dentry->d_inode->i_sb);
 	if (IS_ERR(ctx))
 		return PTR_ERR(ctx);
 
+	reserve = estimate_update_common(dentry->d_inode);
+	if (reiser4_grab_space(reserve, BA_CAN_COMMIT))
+		return RETERR(-ENOSPC);
+	write_sd_by_inode_common(dentry->d_inode);
+
+	atom = get_current_atom_locked();
+	spin_lock_txnh(ctx->trans);
+	force_commit_atom(ctx->trans);
+	reiser4_exit_context(ctx);
+	return 0;
+
+
 	assert("nikita-3486", ctx->trans->atom == NULL);
 	result = commit_file_atoms(dentry->d_inode);
 	assert("nikita-3484", ergo(result == 0, ctx->trans->atom == NULL));
diff -puN fs/reiser4/txnmgr.c~reiser4-fix-fsync fs/reiser4/txnmgr.c
--- linux-2.6.14-mm2/fs/reiser4/txnmgr.c~reiser4-fix-fsync	2005-11-17 13:42:26.000000000 +0300
+++ linux-2.6.14-mm2-vs/fs/reiser4/txnmgr.c	2005-11-17 13:42:26.000000000 +0300
@@ -1173,9 +1173,14 @@ static int commit_current_atom(long *nr_
 
 /* TXN_TXNH */
 
-/* commit current atom and wait commit completion; atom and txn_handle should be
- * locked before call, this function unlocks them on exit. */
-static int force_commit_atom_nolock(txn_handle * txnh)
+/**
+ * force_commit_atom - commit current atom and wait commit completion
+ * @txnh:
+ *
+ * Commits current atom and wait commit completion; current atom and @txnh have
+ * to be spinlocked before call, this function unlocks them on exit.
+ */
+int force_commit_atom(txn_handle *txnh)
 {
 	txn_atom *atom;
 
@@ -1188,14 +1193,17 @@ static int force_commit_atom_nolock(txn_
 	assert("zam-834", atom != NULL);
 	assert_spin_locked(&(atom->alock));
 
-	/* Set flags for atom and txnh: forcing atom commit and waiting for
-	 * commit completion */
+	/*
+	 * Set flags for atom and txnh: forcing atom commit and waiting for
+	 * commit completion
+	 */
 	txnh->flags |= TXNH_WAIT_COMMIT;
 	atom->flags |= ATOM_FORCE_COMMIT;
 
 	spin_unlock_txnh(txnh);
 	spin_unlock_atom(atom);
 
+	/* commit is here */
 	txn_restart_current();
 	return 0;
 }
@@ -1240,7 +1248,7 @@ int txnmgr_force_commit_all(struct super
 					spin_lock_txnh(txnh);
 					/* Add force-context txnh */
 					capture_assign_txnh_nolock(atom, txnh);
-					ret = force_commit_atom_nolock(txnh);
+					ret = force_commit_atom(txnh);
 					if (ret)
 						return ret;
 				} else
@@ -2541,7 +2549,7 @@ int sync_atom(txn_atom * atom)
 		if (atom->stage < ASTAGE_PRE_COMMIT) {
 			spin_lock_txnh(txnh);
 			capture_assign_txnh_nolock(atom, txnh);
-			result = force_commit_atom_nolock(txnh);
+			result = force_commit_atom(txnh);
 		} else if (atom->stage < ASTAGE_POST_COMMIT) {
 			/* wait atom commit */
 			atom_wait_event(atom);
diff -puN fs/reiser4/txnmgr.h~reiser4-fix-fsync fs/reiser4/txnmgr.h
--- linux-2.6.14-mm2/fs/reiser4/txnmgr.h~reiser4-fix-fsync	2005-11-17 13:42:26.000000000 +0300
+++ linux-2.6.14-mm2-vs/fs/reiser4/txnmgr.h	2005-11-17 13:42:26.000000000 +0300
@@ -416,6 +416,7 @@ extern int current_atom_should_commit(vo
 extern jnode *find_first_dirty_jnode(txn_atom *, int);
 
 extern int commit_some_atoms(txn_mgr *);
+extern int force_commit_atom(txn_handle *);
 extern int flush_current_atom(int, long, long *, txn_atom **, jnode *);
 
 extern int flush_some_atom(jnode *, long *, const struct writeback_control *, int);

_

--------------090100080100050905070304--
