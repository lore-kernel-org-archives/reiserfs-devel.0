From: Alexander Zarochentsev <zam@namesys.com>
Subject: Re: reiser4-2.6.18-rc2-mm1: possible circular locking dependency detected in txn_end
Date: Tue, 22 Aug 2006 17:08:58 +0400
Message-ID: <200608221708.59110.zam@namesys.com>
References: <44CD0115.4010608@free.fr> <44D2112A.7080705@free.fr> <44DDD707.1000506@free.fr>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-29655-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <44DDD707.1000506@free.fr>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: reiserfs-list@namesys.com
Cc: Laurent Riffard <laurent.riffard@free.fr>

Hello,

On 12 August 2006 17:26, Laurent Riffard wrote:
> Le 03.08.2006 17:07, Laurent Riffard a =E9crit :
> > Le 03.08.2006 08:09, Alexander Zarochentsev a =E9crit :
> >> On Tuesday 01 August 2006 01:29, Laurent Riffard wrote:
> >>> Le 31.07.2006 21:55, Vladimir V. Saveliev a =E9crit :
> >>>> Hello
> >>>>
> >>>> What kind of load did you run on reiser4 at that time?
> >>>
> >>> I just formatted a new 2GB Reiser4 FS, then I moved a whole
> >>> ccache cache tree to this new FS (cache size was about 20~30
> >>> Mbytes). Something like:
> >>>
> >>> # mkfs.reiser4 /dev/vglinux1/ccache
> >>> # mount -tauto -onoatime /dev/vglinux1/ccache /mnt/disk
> >>> # mv ~laurent/.ccache/* /mnt/disk/
> >>
> >> I was not able to reproduce it.  Can you please try the following
> >> patch?
> >>
> >>
> >> lock validator friendly locking of new atom in
> >> atom_begin_and_assign_to_txnh and locking of two atoms.
> >>
> >> Signed-off-by: Alexander Zarochentsev <zam@namesys.com>
> >> ---
> >>
> >>  fs/reiser4/txnmgr.c |   14 ++++++++------
> >>  fs/reiser4/txnmgr.h |   15 +++++++++++++++
> >>  2 files changed, 23 insertions(+), 6 deletions(-)
>
> [patch snipped]
>
> > I tried this patch: it's slow as hell (CPU is ~100% system) and it

overhead of locking dependency checks?

also disabling CONFIG_REISER4_DEBUG should help tp reduce cpu usage.

> > panics when syncing...

please apply another patch

lock validator friendly locking of new atom in=20
atom_begin_and_assign_to_txnh and locking of two atoms.

Signed-off-by: Alexander Zarochentsev <zam@namesys.com>
=2D--

 fs/reiser4/txnmgr.c |   14 ++++++++------
 fs/reiser4/txnmgr.h |   15 +++++++++++++++
 2 files changed, 23 insertions(+), 6 deletions(-)

=2D-- linux-2.6-git.orig/fs/reiser4/txnmgr.c
+++ linux-2.6-git/fs/reiser4/txnmgr.c
@@ -397,7 +397,7 @@ static void atom_init(txn_atom * atom)
 	INIT_LIST_HEAD(ATOM_OVRWR_LIST(atom));
 	INIT_LIST_HEAD(ATOM_WB_LIST(atom));
 	INIT_LIST_HEAD(&atom->inodes);
=2D	spin_lock_init(&atom->alock);
+	spin_lock_init(&(atom->alock));
 	/* list of transaction handles */
 	INIT_LIST_HEAD(&atom->txnh_list);
 	/* link to transaction manager's list of atoms */
@@ -732,10 +732,12 @@ static int atom_begin_and_assign_to_txnh
 	assert("jmacd-17", atom_isclean(atom));
=20
         /*
=2D	 * do not use spin_lock_atom because we have broken lock ordering here
=2D	 * which is ok, as long as @atom is new and inaccessible for others.
+	 * lock ordering is broken here. It is ok, as long as @atom is new
+	 * and inaccessible for others. We can't use spin_lock_atom or
+	 * spin_lock(&atom->alock) because they care about locking
+	 * dependencies. spin_trylock_lock doesn't.
 	 */
=2D	spin_lock(&(atom->alock));
+	check_me("", spin_trylock_atom(atom));
=20
 	/* add atom to the end of transaction manager's list of atoms */
 	list_add_tail(&atom->atom_link, &mgr->atoms_list);
@@ -751,7 +753,7 @@ static int atom_begin_and_assign_to_txnh
 	atom->super =3D reiser4_get_current_sb();
 	capture_assign_txnh_nolock(atom, txnh);
=20
=2D	spin_unlock(&(atom->alock));
+	spin_unlock_atom(atom);
 	spin_unlock_txnh(txnh);
=20
 	return -E_REPEAT;
@@ -2112,11 +2114,11 @@ static void fuse_not_fused_lock_owners(t
 		atomic_inc(&atomf->refcount);
 		spin_unlock_txnh(ctx->trans);
 		if (atomf > atomh) {
=2D			spin_lock_atom(atomf);
+			spin_lock_atom_nested(atomf);
 		} else {
 			spin_unlock_atom(atomh);
 			spin_lock_atom(atomf);
=2D			spin_lock_atom(atomh);
+			spin_lock_atom_nested(atomh);
 		}
 		if (atomh =3D=3D atomf || !atom_isopen(atomh) || !atom_isopen(atomf)) {
 			release_two_atoms(atomf, atomh);
@@ -2794,10 +2796,10 @@ static void lock_two_atoms(txn_atom * on
 	/* lock the atom with lesser address first */
 	if (one < two) {
 		spin_lock_atom(one);
=2D		spin_lock_atom(two);
+		spin_lock_atom_nested(two);
 	} else {
 		spin_lock_atom(two);
=2D		spin_lock_atom(one);
+		spin_lock_atom_nested(one);
 	}
 }
=20
=2D-- linux-2.6-git.orig/fs/reiser4/txnmgr.h
+++ linux-2.6-git/fs/reiser4/txnmgr.h
@@ -503,6 +503,7 @@ static inline void spin_lock_atom(txn_at
 {
 	/* check that spinlocks of lower priorities are not held */
 	assert("", (LOCK_CNT_NIL(spin_locked_txnh) &&
+		    LOCK_CNT_NIL(spin_locked_atom) &&
 		    LOCK_CNT_NIL(spin_locked_jnode) &&
 		    LOCK_CNT_NIL(spin_locked_zlock) &&
 		    LOCK_CNT_NIL(rw_locked_dk) &&
@@ -514,6 +515,20 @@ static inline void spin_lock_atom(txn_at
 	LOCK_CNT_INC(spin_locked);
 }
=20
+static inline void spin_lock_atom_nested(txn_atom *atom)
+{
+	assert("", (LOCK_CNT_NIL(spin_locked_txnh) &&
+		    LOCK_CNT_NIL(spin_locked_jnode) &&
+		    LOCK_CNT_NIL(spin_locked_zlock) &&
+		    LOCK_CNT_NIL(rw_locked_dk) &&
+		    LOCK_CNT_NIL(rw_locked_tree)));
+
+	spin_lock_nested(&(atom->alock), SINGLE_DEPTH_NESTING);
+
+	LOCK_CNT_INC(spin_locked_atom);
+	LOCK_CNT_INC(spin_locked);
+}
+
 static inline int spin_trylock_atom(txn_atom *atom)
 {
 	if (spin_trylock(&(atom->alock))) {

