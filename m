From: Laurent Riffard <laurent.riffard@free.fr>
Subject: Re: reiser4-2.6.18-rc2-mm1: possible circular locking dependency
 detected in txn_end
Date: Thu, 03 Aug 2006 17:07:22 +0200
Message-ID: <44D2112A.7080705@free.fr>
References: <44CD0115.4010608@free.fr> <1154375700.6460.125.camel@tribesman.namesys.com> <44CE761E.8080809@free.fr> <200608031009.18204.zam@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-29459-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200608031009.18204.zam@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Alexander Zarochentsev <zam@namesys.com>
Cc: reiserfs-list@namesys.com, "Vladimir V. Saveliev" <vs@namesys.com>



Le 03.08.2006 08:09, Alexander Zarochentsev a =E9crit :
> On Tuesday 01 August 2006 01:29, Laurent Riffard wrote:
>> Le 31.07.2006 21:55, Vladimir V. Saveliev a =E9crit :
>>> Hello
>>>
>>> What kind of load did you run on reiser4 at that time?
>> I just formatted a new 2GB Reiser4 FS, then I moved a whole ccache
>> cache tree to this new FS (cache size was about 20~30 Mbytes).
>> Something like:
>>
>> # mkfs.reiser4 /dev/vglinux1/ccache
>> # mount -tauto -onoatime /dev/vglinux1/ccache /mnt/disk
>> # mv ~laurent/.ccache/* /mnt/disk/
>=20
> I was not able to reproduce it.  Can you please try the following patch?
>=20
>=20
> lock validator friendly locking of new atom in=20
> atom_begin_and_assign_to_txnh and locking of two atoms.
>=20
> Signed-off-by: Alexander Zarochentsev <zam@namesys.com>
> ---
>=20
>  fs/reiser4/txnmgr.c |   14 ++++++++------
>  fs/reiser4/txnmgr.h |   15 +++++++++++++++
>  2 files changed, 23 insertions(+), 6 deletions(-)
>=20
> Index: linux-2.6-git/fs/reiser4/txnmgr.c
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> --- linux-2.6-git.orig/fs/reiser4/txnmgr.c
> +++ linux-2.6-git/fs/reiser4/txnmgr.c
> @@ -730,10 +730,12 @@ static int atom_begin_and_assign_to_txnh
>  	assert("jmacd-17", atom_isclean(atom));
> =20
>          /*
> -	 * do not use spin_lock_atom because we have broken lock ordering here
> -	 * which is ok, as long as @atom is new and inaccessible for others.
> +	 * lock ordering is broken here. It is ok, as long as @atom is new
> +	 * and inaccessible for others. We can't use spin_lock_atom or
> +	 * spin_lock(&atom->alock) because they care about locking
> +	 * dependencies. spin_trylock_lock doesn't.
>  	 */
> -	spin_lock(&(atom->alock));
> +	check_me("", spin_trylock_atom(atom));
> =20
>  	/* add atom to the end of transaction manager's list of atoms */
>  	list_add_tail(&atom->atom_link, &mgr->atoms_list);
> @@ -749,7 +751,7 @@ static int atom_begin_and_assign_to_txnh
>  	atom->super =3D reiser4_get_current_sb();
>  	capture_assign_txnh_nolock(atom, txnh);
> =20
> -	spin_unlock(&(atom->alock));
> +	spin_unlock_atom(atom);
>  	spin_unlock_txnh(txnh);
> =20
>  	return -E_REPEAT;
> @@ -2791,10 +2793,10 @@ static void lock_two_atoms(txn_atom * on
>  	/* lock the atom with lesser address first */
>  	if (one < two) {
>  		spin_lock_atom(one);
> -		spin_lock_atom(two);
> +		spin_lock_atom_nested(two);
>  	} else {
>  		spin_lock_atom(two);
> -		spin_lock_atom(one);
> +		spin_lock_atom_nested(one);
>  	}
>  }
> =20
> Index: linux-2.6-git/fs/reiser4/txnmgr.h
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> --- linux-2.6-git.orig/fs/reiser4/txnmgr.h
> +++ linux-2.6-git/fs/reiser4/txnmgr.h
> @@ -502,6 +502,7 @@ static inline void spin_lock_atom(txn_at
>  {
>  	/* check that spinlocks of lower priorities are not held */
>  	assert("", (LOCK_CNT_NIL(spin_locked_txnh) &&
> +		    LOCK_CNT_NIL(spin_locked_atom) &&
>  		    LOCK_CNT_NIL(spin_locked_jnode) &&
>  		    LOCK_CNT_NIL(spin_locked_zlock) &&
>  		    LOCK_CNT_NIL(rw_locked_dk) &&
> @@ -513,6 +514,20 @@ static inline void spin_lock_atom(txn_at
>  	LOCK_CNT_INC(spin_locked);
>  }
> =20
> +static inline void spin_lock_atom_nested(txn_atom *atom)
> +{
> +	assert("", (LOCK_CNT_NIL(spin_locked_txnh) &&
> +		    LOCK_CNT_NIL(spin_locked_jnode) &&
> +		    LOCK_CNT_NIL(spin_locked_zlock) &&
> +		    LOCK_CNT_NIL(rw_locked_dk) &&
> +		    LOCK_CNT_NIL(rw_locked_tree)));
> +
> +	spin_lock_nested(&(atom->alock), SINGLE_DEPTH_NESTING);
> +
> +	LOCK_CNT_INC(spin_locked_atom);
> +	LOCK_CNT_INC(spin_locked);
> +}
> +
>  static inline int spin_trylock_atom(txn_atom *atom)
>  {
>  	if (spin_trylock(&(atom->alock))) {
>=20
>=20
>=20

I tried this patch: it's slow as hell (CPU is ~100% system) and it
panics when syncing...

reiser4 panicked cowardly: reiser4[shutdown(1904)]: spin_lock_atom
(fs/reiser4/txmgr.h:509)[]:

--=20
laurent
