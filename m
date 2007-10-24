From: Dushan Tcholich <dusanc@gmail.com>
Subject: [PATCH 23/8] flush_queue.c cleanup
Date: Wed, 24 Oct 2007 14:33:42 +0200
Message-ID: <1193229222.24225.10.camel@krshina3.gekom>
Reply-To: dusanc@gmail.com
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="=-mpurDLSluayuScJ2eWLx"
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
To: Edward Shishkin <edward@namesys.com>, reiser4 <reiserfs-devel@vger.kernel.org>


--=-mpurDLSluayuScJ2eWLx
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

orig:	total: 17 errors, 4 warnings, 680 lines checked
patched:Your patch has no obvious style problems and is ready for
submission.

--=-mpurDLSluayuScJ2eWLx
Content-Disposition: attachment; filename=flush_queue.c.patch
Content-Type: text/x-patch; name=flush_queue.c.patch; charset=UTF-8
Content-Transfer-Encoding: 7bit

Signed-off-by: Dushan Tcholich <dusanc@gmail.com>
--- flush_queue.c.orig	2007-10-24 14:23:41.000000000 +0200
+++ flush_queue.c	2007-10-24 14:30:03.000000000 +0200
@@ -1,4 +1,5 @@
-/* Copyright 2001, 2002, 2003 by Hans Reiser, licensing governed by reiser4/README */
+/* Copyright 2001, 2002, 2003 by Hans Reiser, licensing governed by
+   reiser4/README */
 
 #include "debug.h"
 #include "super.h"
@@ -50,7 +51,7 @@
 #define mark_fq_ready(fq)      do { (fq)->state &= ~FQ_IN_USE;   } while (0)
 
 /* get lock on atom from locked flush queue object */
-static txn_atom *atom_locked_by_fq_nolock(flush_queue_t * fq)
+static txn_atom *atom_locked_by_fq_nolock(flush_queue_t *fq)
 {
 	/* This code is similar to jnode_get_atom(), look at it for the
 	 * explanation. */
@@ -84,7 +85,7 @@ static txn_atom *atom_locked_by_fq_noloc
 	return atom;
 }
 
-txn_atom *atom_locked_by_fq(flush_queue_t * fq)
+txn_atom *atom_locked_by_fq(flush_queue_t *fq)
 {
 	txn_atom *atom;
 
@@ -94,7 +95,7 @@ txn_atom *atom_locked_by_fq(flush_queue_
 	return atom;
 }
 
-static void init_fq(flush_queue_t * fq)
+static void init_fq(flush_queue_t *fq)
 {
 	memset(fq, 0, sizeof *fq);
 
@@ -148,12 +149,12 @@ static flush_queue_t *create_fq(gfp_t gf
 }
 
 /* adjust atom's and flush queue's counters of queued nodes */
-static void count_enqueued_node(flush_queue_t * fq)
+static void count_enqueued_node(flush_queue_t *fq)
 {
 	ON_DEBUG(fq->atom->num_queued++);
 }
 
-static void count_dequeued_node(flush_queue_t * fq)
+static void count_dequeued_node(flush_queue_t *fq)
 {
 	assert("zam-993", fq->atom->num_queued > 0);
 	ON_DEBUG(fq->atom->num_queued--);
@@ -168,7 +169,7 @@ static void attach_fq(txn_atom *atom, fl
 	ON_DEBUG(atom->nr_flush_queues++);
 }
 
-static void detach_fq(flush_queue_t * fq)
+static void detach_fq(flush_queue_t *fq)
 {
 	assert_spin_locked(&(fq->atom->alock));
 
@@ -181,7 +182,7 @@ static void detach_fq(flush_queue_t * fq
 }
 
 /* destroy flush queue object */
-static void done_fq(flush_queue_t * fq)
+static void done_fq(flush_queue_t *fq)
 {
 	assert("zam-763", list_empty_careful(ATOM_FQ_LIST(fq)));
 	assert("zam-766", atomic_read(&fq->nr_submitted) == 0);
@@ -190,7 +191,7 @@ static void done_fq(flush_queue_t * fq)
 }
 
 /* */
-static void mark_jnode_queued(flush_queue_t * fq, jnode * node)
+static void mark_jnode_queued(flush_queue_t *fq, jnode * node)
 {
 	JF_SET(node, JNODE_FLUSH_QUEUED);
 	count_enqueued_node(fq);
@@ -198,7 +199,7 @@ static void mark_jnode_queued(flush_queu
 
 /* Putting jnode into the flush queue. Both atom and jnode should be
    spin-locked. */
-void queue_jnode(flush_queue_t * fq, jnode * node)
+void queue_jnode(flush_queue_t *fq, jnode * node)
 {
 	assert_spin_locked(&(node->guard));
 	assert("zam-713", node->atom != NULL);
@@ -220,7 +221,7 @@ void queue_jnode(flush_queue_t * fq, jno
 }
 
 /* repeatable process for waiting io completion on a flush queue object */
-static int wait_io(flush_queue_t * fq, int *nr_io_errors)
+static int wait_io(flush_queue_t *fq, int *nr_io_errors)
 {
 	assert("zam-738", fq->atom != NULL);
 	assert_spin_locked(&(fq->atom->alock));
@@ -240,7 +241,8 @@ static int wait_io(flush_queue_t * fq, i
 		blk_run_address_space(reiser4_get_super_fake(super)->i_mapping);
 
 		if (!(super->s_flags & MS_RDONLY))
-			wait_event(fq->wait, atomic_read(&fq->nr_submitted) == 0);
+			wait_event(fq->wait,
+				   atomic_read(&fq->nr_submitted) == 0);
 
 		/* Ask the caller to re-acquire the locks and call this
 		   function again. Note: this technique is commonly used in
@@ -253,7 +255,7 @@ static int wait_io(flush_queue_t * fq, i
 }
 
 /* wait on I/O completion, re-submit dirty nodes to write */
-static int finish_fq(flush_queue_t * fq, int *nr_io_errors)
+static int finish_fq(flush_queue_t *fq, int *nr_io_errors)
 {
 	int ret;
 	txn_atom *atom = fq->atom;
@@ -452,7 +454,7 @@ end_io_handler(struct bio *bio, unsigned
 
 /* Count I/O requests which will be submitted by @bio in given flush queues
    @fq */
-void add_fq_to_bio(flush_queue_t * fq, struct bio *bio)
+void add_fq_to_bio(flush_queue_t *fq, struct bio *bio)
 {
 	bio->bi_private = fq;
 	bio->bi_end_io = end_io_handler;
@@ -462,7 +464,7 @@ void add_fq_to_bio(flush_queue_t * fq, s
 }
 
 /* Move all queued nodes out from @fq->prepped list. */
-static void release_prepped_list(flush_queue_t * fq)
+static void release_prepped_list(flush_queue_t *fq)
 {
 	txn_atom *atom;
 
@@ -484,11 +486,13 @@ static void release_prepped_list(flush_q
 
 		if (JF_ISSET(cur, JNODE_DIRTY)) {
 			list_add_tail(&cur->capture_link,
-				      ATOM_DIRTY_LIST(atom, jnode_get_level(cur)));
+				      ATOM_DIRTY_LIST(atom,
+						      jnode_get_level(cur)));
 			ON_DEBUG(count_jnode(atom, cur, FQ_LIST,
 					     DIRTY_LIST, 1));
 		} else {
-			list_add_tail(&cur->capture_link, ATOM_CLEAN_LIST(atom));
+			list_add_tail(&cur->capture_link,
+				      ATOM_CLEAN_LIST(atom));
 			ON_DEBUG(count_jnode(atom, cur, FQ_LIST,
 					     CLEAN_LIST, 1));
 		}
@@ -506,8 +510,8 @@ static void release_prepped_list(flush_q
 
    @fq: flush queue object which contains jnodes we can (and will) write.
    @return: number of submitted blocks (>=0) if success, otherwise -- an error
-            code (<0). */
-int reiser4_write_fq(flush_queue_t * fq, long *nr_submitted, int flags)
+	    code (<0). */
+int reiser4_write_fq(flush_queue_t *fq, long *nr_submitted, int flags)
 {
 	int ret;
 	txn_atom *atom;
@@ -587,7 +591,7 @@ static int fq_by_atom_gfp(txn_atom *atom
 	return RETERR(-E_REPEAT);
 }
 
-int reiser4_fq_by_atom(txn_atom * atom, flush_queue_t ** new_fq)
+int reiser4_fq_by_atom(txn_atom * atom, flush_queue_t **new_fq)
 {
 	return fq_by_atom_gfp(atom, new_fq, reiser4_ctx_gfp_mask_get());
 }
@@ -620,7 +624,7 @@ void reiser4_fq_put_nolock(flush_queue_t
 	ON_DEBUG(fq->owner = NULL);
 }
 
-void reiser4_fq_put(flush_queue_t * fq)
+void reiser4_fq_put(flush_queue_t *fq)
 {
 	txn_atom *atom;
 

--=-mpurDLSluayuScJ2eWLx--

