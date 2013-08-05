From: Jeff Mahoney <jeffm@suse.com>
Subject: Re: [patch 1/3] reiserfs: locking, push write lock out of xattr code
Date: Mon, 05 Aug 2013 18:07:24 -0400
Message-ID: <5200221C.5010307@suse.com>
References: <20130805215322.224020225@suse.com> <20130805215807.443726160@suse.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature";
 boundary="FVeOXWMf0cjTnvl88VlNADRt7uj0O9enN"
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <20130805215807.443726160@suse.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
To: reiserfs-devel@vger.kernel.org
Cc: jack@suse.com

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--FVeOXWMf0cjTnvl88VlNADRt7uj0O9enN
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On 8/5/13 5:53 PM, jeffm@suse.com wrote:
> The reiserfs xattr code doesn't need the write lock and sleeps all over=

> the place. We can simplify the locking by releasing it and reacquiring
> after the xattr call.
>=20
> Signed-off-by: Jeff Mahoney <jeffm@suse.com>
> ---
>  fs/reiserfs/inode.c     |   37 ++++++++++++++++++++-----------------
>  fs/reiserfs/super.c     |   48 +++++++++++++++++++++++----------------=
---------
>  fs/reiserfs/xattr.c     |   46 +++++++++++++++++----------------------=
-------
>  fs/reiserfs/xattr_acl.c |   16 ++++++++++------
>  4 files changed, 70 insertions(+), 77 deletions(-)
>=20
> --- a/fs/reiserfs/inode.c	2013-08-05 17:50:12.326240529 -0400
> +++ b/fs/reiserfs/inode.c	2013-08-05 17:50:14.042214338 -0400
> @@ -30,7 +30,6 @@ void reiserfs_evict_inode(struct inode *
>  	    JOURNAL_PER_BALANCE_CNT * 2 +
>  	    2 * REISERFS_QUOTA_INIT_BLOCKS(inode->i_sb);
>  	struct reiserfs_transaction_handle th;
> -	int depth;
>  	int err;
> =20
>  	if (!inode->i_nlink && !is_bad_inode(inode))
> @@ -40,12 +39,14 @@ void reiserfs_evict_inode(struct inode *
>  	if (inode->i_nlink)
>  		goto no_delete;
> =20
> -	depth =3D reiserfs_write_lock_once(inode->i_sb);
> -
>  	/* The =3D 0 happens when we abort creating a new inode for some reas=
on like lack of space.. */
>  	if (!(inode->i_state & I_NEW) && INODE_PKEY(inode)->k_objectid !=3D 0=
) {	/* also handles bad_inode case */
> +		int depth;
> +
>  		reiserfs_delete_xattrs(inode);
> =20
> +		depth =3D reiserfs_write_lock_once(inode->i_sb);
> +
>  		if (journal_begin(&th, inode->i_sb, jbegin_count))
>  			goto out;
>  		reiserfs_update_inode_transaction(inode);
> @@ -72,12 +73,12 @@ void reiserfs_evict_inode(struct inode *
>  		/* all items of file are deleted, so we can remove "save" link */
>  		remove_save_link(inode, 0 /* not truncate */ );	/* we can't do anyth=
ing
>  								 * about an error here */
> +out:
> +		reiserfs_write_unlock_once(inode->i_sb, depth);
>  	} else {
>  		/* no object items are in the tree */
>  		;
>  	}
> -      out:
> -	reiserfs_write_unlock_once(inode->i_sb, depth);
>  	clear_inode(inode);	/* note this must go after the journal_end to pre=
vent deadlock */
>  	dquot_drop(inode);
>  	inode->i_blocks =3D 0;
> @@ -1941,7 +1942,9 @@ int reiserfs_new_inode(struct reiserfs_t
>  	}
> =20
>  	if (reiserfs_posixacl(inode->i_sb)) {
> +		reiserfs_write_unlock(inode->i_sb);
>  		retval =3D reiserfs_inherit_default_acl(th, dir, dentry, inode);
> +		reiserfs_write_lock(inode->i_sb);
>  		if (retval) {
>  			err =3D retval;
>  			reiserfs_check_path(&path_to_key);
> @@ -1956,7 +1959,9 @@ int reiserfs_new_inode(struct reiserfs_t
>  		inode->i_flags |=3D S_PRIVATE;
> =20
>  	if (security->name) {
> +		reiserfs_write_unlock(inode->i_sb);
>  		retval =3D reiserfs_security_write(th, inode, security);
> +		reiserfs_write_lock(inode->i_sb);
>  		if (retval) {
>  			err =3D retval;
>  			reiserfs_check_path(&path_to_key);
> @@ -3129,6 +3134,7 @@ int reiserfs_setattr(struct dentry *dent
>  		 */
>  		if (get_inode_item_key_version(inode) =3D=3D KEY_FORMAT_3_5 &&
>  		    attr->ia_size > MAX_NON_LFS) {
> +			reiserfs_write_unlock_once(inode->i_sb, depth);
>  			error =3D -EFBIG;
>  			goto out;
>  		}
> @@ -3150,8 +3156,10 @@ int reiserfs_setattr(struct dentry *dent
>  				if (err)
>  					error =3D err;
>  			}
> -			if (error)
> +			if (error) {
> +				reiserfs_write_unlock_once(inode->i_sb, depth);
>  				goto out;
> +			}
>  			/*
>  			 * file size is changed, ctime and mtime are
>  			 * to be updated
> @@ -3159,10 +3167,12 @@ int reiserfs_setattr(struct dentry *dent
>  			attr->ia_valid |=3D (ATTR_MTIME | ATTR_CTIME);
>  		}
>  	}
> +	reiserfs_write_unlock_once(inode->i_sb, depth);
> =20
>  	if ((((attr->ia_valid & ATTR_UID) && (from_kuid(&init_user_ns, attr->=
ia_uid) & ~0xffff)) ||
>  	     ((attr->ia_valid & ATTR_GID) && (from_kgid(&init_user_ns, attr->=
ia_gid) & ~0xffff))) &&
>  	    (get_inode_sd_version(inode) =3D=3D STAT_DATA_V1)) {
> +		reiserfs_write_unlock_once(inode->i_sb, depth);
>  		/* stat data of format v3.5 has 16 bit uid and gid */
>  		error =3D -EINVAL;
>  		goto out;

Oops. This was an old version of the patch. This will cause a double unlo=
ck.

-Jeff

> @@ -3183,14 +3193,16 @@ int reiserfs_setattr(struct dentry *dent
>  			return error;
> =20
>  		/* (user+group)*(old+new) structure - we count quota info and , inod=
e write (sb, inode) */
> +		depth =3D reiserfs_write_lock_once(inode->i_sb);
>  		error =3D journal_begin(&th, inode->i_sb, jbegin_count);
> +		reiserfs_write_unlock_once(inode->i_sb, depth);
>  		if (error)
>  			goto out;
> -		reiserfs_write_unlock_once(inode->i_sb, depth);
>  		error =3D dquot_transfer(inode, attr);
>  		depth =3D reiserfs_write_lock_once(inode->i_sb);
>  		if (error) {
>  			journal_end(&th, inode->i_sb, jbegin_count);
> +			reiserfs_write_unlock_once(inode->i_sb, depth);
>  			goto out;
>  		}
> =20
> @@ -3202,17 +3214,11 @@ int reiserfs_setattr(struct dentry *dent
>  			inode->i_gid =3D attr->ia_gid;
>  		mark_inode_dirty(inode);
>  		error =3D journal_end(&th, inode->i_sb, jbegin_count);
> +		reiserfs_write_unlock_once(inode->i_sb, depth);
>  		if (error)
>  			goto out;
>  	}
> =20
> -	/*
> -	 * Relax the lock here, as it might truncate the
> -	 * inode pages and wait for inode pages locks.
> -	 * To release such page lock, the owner needs the
> -	 * reiserfs lock
> -	 */
> -	reiserfs_write_unlock_once(inode->i_sb, depth);
>  	if ((attr->ia_valid & ATTR_SIZE) &&
>  	    attr->ia_size !=3D i_size_read(inode)) {
>  		error =3D inode_newsize_ok(inode, attr->ia_size);
> @@ -3226,7 +3232,6 @@ int reiserfs_setattr(struct dentry *dent
>  		setattr_copy(inode, attr);
>  		mark_inode_dirty(inode);
>  	}
> -	depth =3D reiserfs_write_lock_once(inode->i_sb);
> =20
>  	if (!error && reiserfs_posixacl(inode->i_sb)) {
>  		if (attr->ia_valid & ATTR_MODE)
> @@ -3234,8 +3239,6 @@ int reiserfs_setattr(struct dentry *dent
>  	}
> =20
>        out:
> -	reiserfs_write_unlock_once(inode->i_sb, depth);
> -
>  	return error;
>  }
> =20
> --- a/fs/reiserfs/super.c	2013-08-05 17:50:12.326240529 -0400
> +++ b/fs/reiserfs/super.c	2013-08-05 17:50:14.066213971 -0400
> @@ -1335,7 +1335,7 @@ static int reiserfs_remount(struct super
>  				kfree(qf_names[i]);
>  #endif
>  		err =3D -EINVAL;
> -		goto out_unlock;
> +		goto out_err_unlock;
>  	}
>  #ifdef CONFIG_QUOTA
>  	handle_quota_files(s, qf_names, &qfmt);
> @@ -1379,35 +1379,32 @@ static int reiserfs_remount(struct super
>  	if (blocks) {
>  		err =3D reiserfs_resize(s, blocks);
>  		if (err !=3D 0)
> -			goto out_unlock;
> +			goto out_err_unlock;
>  	}
> =20
>  	if (*mount_flags & MS_RDONLY) {
> +		reiserfs_write_unlock(s);
>  		reiserfs_xattr_init(s, *mount_flags);
>  		/* remount read-only */
>  		if (s->s_flags & MS_RDONLY)
>  			/* it is read-only already */
> -			goto out_ok;
> +			goto out_ok_unlocked;
> =20
> -		/*
> -		 * Drop write lock. Quota will retake it when needed and lock
> -		 * ordering requires calling dquot_suspend() without it.
> -		 */
> -		reiserfs_write_unlock(s);
>  		err =3D dquot_suspend(s, -1);
>  		if (err < 0)
>  			goto out_err;
> -		reiserfs_write_lock(s);
> =20
>  		/* try to remount file system with read-only permissions */
>  		if (sb_umount_state(rs) =3D=3D REISERFS_VALID_FS
>  		    || REISERFS_SB(s)->s_mount_state !=3D REISERFS_VALID_FS) {
> -			goto out_ok;
> +			goto out_ok_unlocked;
>  		}
> =20
> +		reiserfs_write_lock(s);
> +
>  		err =3D journal_begin(&th, s, 10);
>  		if (err)
> -			goto out_unlock;
> +			goto out_err_unlock;
> =20
>  		/* Mounting a rw partition read-only. */
>  		reiserfs_prepare_for_journal(s, SB_BUFFER_WITH_SB(s), 1);
> @@ -1416,13 +1413,14 @@ static int reiserfs_remount(struct super
>  	} else {
>  		/* remount read-write */
>  		if (!(s->s_flags & MS_RDONLY)) {
> +			reiserfs_write_unlock(s);
>  			reiserfs_xattr_init(s, *mount_flags);
> -			goto out_ok;	/* We are read-write already */
> +			goto out_ok_unlocked;	/* We are read-write already */
>  		}
> =20
>  		if (reiserfs_is_journal_aborted(journal)) {
>  			err =3D journal->j_errno;
> -			goto out_unlock;
> +			goto out_err_unlock;
>  		}
> =20
>  		handle_data_mode(s, mount_options);
> @@ -1431,7 +1429,7 @@ static int reiserfs_remount(struct super
>  		s->s_flags &=3D ~MS_RDONLY;	/* now it is safe to call journal_begin =
*/
>  		err =3D journal_begin(&th, s, 10);
>  		if (err)
> -			goto out_unlock;
> +			goto out_err_unlock;
> =20
>  		/* Mount a partition which is read-only, read-write */
>  		reiserfs_prepare_for_journal(s, SB_BUFFER_WITH_SB(s), 1);
> @@ -1448,26 +1446,22 @@ static int reiserfs_remount(struct super
>  	SB_JOURNAL(s)->j_must_wait =3D 1;
>  	err =3D journal_end(&th, s, 10);
>  	if (err)
> -		goto out_unlock;
> +		goto out_err_unlock;
> =20
> +	reiserfs_write_unlock(s);
>  	if (!(*mount_flags & MS_RDONLY)) {
> -		/*
> -		 * Drop write lock. Quota will retake it when needed and lock
> -		 * ordering requires calling dquot_resume() without it.
> -		 */
> -		reiserfs_write_unlock(s);
>  		dquot_resume(s, -1);
>  		reiserfs_write_lock(s);
>  		finish_unfinished(s);
> +		reiserfs_write_unlock(s);
>  		reiserfs_xattr_init(s, *mount_flags);
>  	}
> =20
> -out_ok:
> +out_ok_unlocked:
>  	replace_mount_options(s, new_opts);
> -	reiserfs_write_unlock(s);
>  	return 0;
> =20
> -out_unlock:
> +out_err_unlock:
>  	reiserfs_write_unlock(s);
>  out_err:
>  	kfree(new_opts);
> @@ -2014,12 +2008,14 @@ static int reiserfs_fill_super(struct su
>  			goto error;
>  		}
> =20
> +		reiserfs_write_unlock(s);
>  		if ((errval =3D reiserfs_lookup_privroot(s)) ||
>  		    (errval =3D reiserfs_xattr_init(s, s->s_flags))) {
>  			dput(s->s_root);
>  			s->s_root =3D NULL;
> -			goto error;
> +			goto error_unlocked;
>  		}
> +		reiserfs_write_lock(s);
> =20
>  		/* look for files which were to be removed in previous session */
>  		finish_unfinished(s);
> @@ -2028,12 +2024,14 @@ static int reiserfs_fill_super(struct su
>  			reiserfs_info(s, "using 3.5.x disk format\n");
>  		}
> =20
> +		reiserfs_write_unlock(s);
>  		if ((errval =3D reiserfs_lookup_privroot(s)) ||
>  		    (errval =3D reiserfs_xattr_init(s, s->s_flags))) {
>  			dput(s->s_root);
>  			s->s_root =3D NULL;
> -			goto error;
> +			goto error_unlocked;
>  		}
> +		reiserfs_write_lock(s);
>  	}
>  	// mark hash in super block: it could be unset. overwrite should be o=
k
>  	set_sb_hash_function_code(rs, function2code(sbi->s_hash_function));
> --- a/fs/reiserfs/xattr.c	2013-08-05 17:50:12.326240529 -0400
> +++ b/fs/reiserfs/xattr.c	2013-08-05 17:50:14.078213788 -0400
> @@ -81,8 +81,7 @@ static int xattr_unlink(struct inode *di
>  	int error;
>  	BUG_ON(!mutex_is_locked(&dir->i_mutex));
> =20
> -	reiserfs_mutex_lock_nested_safe(&dentry->d_inode->i_mutex,
> -					I_MUTEX_CHILD, dir->i_sb);
> +	mutex_lock_nested(&dentry->d_inode->i_mutex, I_MUTEX_CHILD);
>  	error =3D dir->i_op->unlink(dir, dentry);
>  	mutex_unlock(&dentry->d_inode->i_mutex);
> =20
> @@ -96,8 +95,7 @@ static int xattr_rmdir(struct inode *dir
>  	int error;
>  	BUG_ON(!mutex_is_locked(&dir->i_mutex));
> =20
> -	reiserfs_mutex_lock_nested_safe(&dentry->d_inode->i_mutex,
> -					I_MUTEX_CHILD, dir->i_sb);
> +	mutex_lock_nested(&dentry->d_inode->i_mutex, I_MUTEX_CHILD);
>  	error =3D dir->i_op->rmdir(dir, dentry);
>  	if (!error)
>  		dentry->d_inode->i_flags |=3D S_DEAD;
> @@ -232,22 +230,17 @@ static int reiserfs_for_each_xattr(struc
>  	if (IS_PRIVATE(inode) || get_inode_sd_version(inode) =3D=3D STAT_DATA=
_V1)
>  		return 0;
> =20
> -	reiserfs_write_unlock(inode->i_sb);
>  	dir =3D open_xa_dir(inode, XATTR_REPLACE);
>  	if (IS_ERR(dir)) {
>  		err =3D PTR_ERR(dir);
> -		reiserfs_write_lock(inode->i_sb);
>  		goto out;
>  	} else if (!dir->d_inode) {
>  		err =3D 0;
> -		reiserfs_write_lock(inode->i_sb);
>  		goto out_dir;
>  	}
> =20
>  	mutex_lock_nested(&dir->d_inode->i_mutex, I_MUTEX_XATTR);
> =20
> -	reiserfs_write_lock(inode->i_sb);
> -
>  	buf.xadir =3D dir;
>  	while (1) {
>  		err =3D reiserfs_readdir_inode(dir->d_inode, &buf.ctx);
> @@ -281,14 +274,17 @@ static int reiserfs_for_each_xattr(struc
>  		int blocks =3D JOURNAL_PER_BALANCE_CNT * 2 + 2 +
>  			     4 * REISERFS_QUOTA_TRANS_BLOCKS(inode->i_sb);
>  		struct reiserfs_transaction_handle th;
> +		reiserfs_write_lock(inode->i_sb);
>  		err =3D journal_begin(&th, inode->i_sb, blocks);
> +		reiserfs_write_unlock(inode->i_sb);
>  		if (!err) {
>  			int jerror;
> -			reiserfs_mutex_lock_nested_safe(
> -					  &dir->d_parent->d_inode->i_mutex,
> -					  I_MUTEX_XATTR, inode->i_sb);
> +			mutex_lock_nested(&dir->d_parent->d_inode->i_mutex,
> +					  I_MUTEX_XATTR);
>  			err =3D action(dir, data);
> +			reiserfs_write_lock(inode->i_sb);
>  			jerror =3D journal_end(&th, inode->i_sb, blocks);
> +			reiserfs_write_unlock(inode->i_sb);
>  			mutex_unlock(&dir->d_parent->d_inode->i_mutex);
>  			err =3D jerror ?: err;
>  		}
> @@ -455,9 +451,7 @@ static int lookup_and_delete_xattr(struc
>  	}
> =20
>  	if (dentry->d_inode) {
> -		reiserfs_write_lock(inode->i_sb);
>  		err =3D xattr_unlink(xadir->d_inode, dentry);
> -		reiserfs_write_unlock(inode->i_sb);
>  		update_ctime(inode);
>  	}
> =20
> @@ -491,24 +485,17 @@ reiserfs_xattr_set_handle(struct reiserf
>  	if (get_inode_sd_version(inode) =3D=3D STAT_DATA_V1)
>  		return -EOPNOTSUPP;
> =20
> -	reiserfs_write_unlock(inode->i_sb);
> -
>  	if (!buffer) {
>  		err =3D lookup_and_delete_xattr(inode, name);
> -		reiserfs_write_lock(inode->i_sb);
>  		return err;
>  	}
> =20
>  	dentry =3D xattr_lookup(inode, name, flags);
> -	if (IS_ERR(dentry)) {
> -		reiserfs_write_lock(inode->i_sb);
> +	if (IS_ERR(dentry))
>  		return PTR_ERR(dentry);
> -	}
> =20
>  	down_write(&REISERFS_I(inode)->i_xattr_sem);
> =20
> -	reiserfs_write_lock(inode->i_sb);
> -
>  	xahash =3D xattr_hash(buffer, buffer_size);
>  	while (buffer_pos < buffer_size || buffer_pos =3D=3D 0) {
>  		size_t chunk;
> @@ -538,6 +525,7 @@ reiserfs_xattr_set_handle(struct reiserf
>  			rxh->h_hash =3D cpu_to_le32(xahash);
>  		}
> =20
> +		reiserfs_write_lock(inode->i_sb);
>  		err =3D __reiserfs_write_begin(page, page_offset, chunk + skip);
>  		if (!err) {
>  			if (buffer)
> @@ -546,6 +534,7 @@ reiserfs_xattr_set_handle(struct reiserf
>  						    page_offset + chunk +
>  						    skip);
>  		}
> +		reiserfs_write_unlock(inode->i_sb);
>  		unlock_page(page);
>  		reiserfs_put_page(page);
>  		buffer_pos +=3D chunk;
> @@ -563,10 +552,8 @@ reiserfs_xattr_set_handle(struct reiserf
>  			.ia_valid =3D ATTR_SIZE | ATTR_CTIME,
>  		};
> =20
> -		reiserfs_write_unlock(inode->i_sb);
>  		mutex_lock_nested(&dentry->d_inode->i_mutex, I_MUTEX_XATTR);
>  		inode_dio_wait(dentry->d_inode);
> -		reiserfs_write_lock(inode->i_sb);
> =20
>  		err =3D reiserfs_setattr(dentry, &newattrs);
>  		mutex_unlock(&dentry->d_inode->i_mutex);
> @@ -592,18 +579,19 @@ int reiserfs_xattr_set(struct inode *ino
> =20
>  	reiserfs_write_lock(inode->i_sb);
>  	error =3D journal_begin(&th, inode->i_sb, jbegin_count);
> +	reiserfs_write_unlock(inode->i_sb);
>  	if (error) {
> -		reiserfs_write_unlock(inode->i_sb);
>  		return error;
>  	}
> =20
>  	error =3D reiserfs_xattr_set_handle(&th, inode, name,
>  					  buffer, buffer_size, flags);
> =20
> +	reiserfs_write_lock(inode->i_sb);
>  	error2 =3D journal_end(&th, inode->i_sb, jbegin_count);
> +	reiserfs_write_unlock(inode->i_sb);
>  	if (error =3D=3D 0)
>  		error =3D error2;
> -	reiserfs_write_unlock(inode->i_sb);
> =20
>  	return error;
>  }
> @@ -968,7 +956,7 @@ int reiserfs_lookup_privroot(struct supe
>  	int err =3D 0;
> =20
>  	/* If we don't have the privroot located yet - go find it */
> -	reiserfs_mutex_lock_safe(&s->s_root->d_inode->i_mutex, s);
> +	mutex_lock(&s->s_root->d_inode->i_mutex);
>  	dentry =3D lookup_one_len(PRIVROOT_NAME, s->s_root,
>  				strlen(PRIVROOT_NAME));
>  	if (!IS_ERR(dentry)) {
> @@ -996,14 +984,14 @@ int reiserfs_xattr_init(struct super_blo
>  		goto error;
> =20
>  	if (!privroot->d_inode && !(mount_flags & MS_RDONLY)) {
> -		reiserfs_mutex_lock_safe(&s->s_root->d_inode->i_mutex, s);
> +		mutex_lock(&s->s_root->d_inode->i_mutex);
>  		err =3D create_privroot(REISERFS_SB(s)->priv_root);
>  		mutex_unlock(&s->s_root->d_inode->i_mutex);
>  	}
> =20
>  	if (privroot->d_inode) {
>  		s->s_xattr =3D reiserfs_xattr_handlers;
> -		reiserfs_mutex_lock_safe(&privroot->d_inode->i_mutex, s);
> +		mutex_lock(&privroot->d_inode->i_mutex);
>  		if (!REISERFS_SB(s)->xattr_root) {
>  			struct dentry *dentry;
>  			dentry =3D lookup_one_len(XAROOT_NAME, privroot,
> --- a/fs/reiserfs/xattr_acl.c	2013-08-05 17:50:12.326240529 -0400
> +++ b/fs/reiserfs/xattr_acl.c	2013-08-05 17:50:14.090213605 -0400
> @@ -49,13 +49,15 @@ posix_acl_set(struct dentry *dentry, con
> =20
>  	reiserfs_write_lock(inode->i_sb);
>  	error =3D journal_begin(&th, inode->i_sb, jcreate_blocks);
> +	reiserfs_write_unlock(inode->i_sb);
>  	if (error =3D=3D 0) {
>  		error =3D reiserfs_set_acl(&th, inode, type, acl);
> +		reiserfs_write_lock(inode->i_sb);
>  		error2 =3D journal_end(&th, inode->i_sb, jcreate_blocks);
> +		reiserfs_write_unlock(inode->i_sb);
>  		if (error2)
>  			error =3D error2;
>  	}
> -	reiserfs_write_unlock(inode->i_sb);
> =20
>        release_and_out:
>  	posix_acl_release(acl);
> @@ -435,12 +437,14 @@ int reiserfs_cache_default_acl(struct in
>  	return nblocks;
>  }
> =20
> +/*
> + * Called under i_mutex
> + */
>  int reiserfs_acl_chmod(struct inode *inode)
>  {
>  	struct reiserfs_transaction_handle th;
>  	struct posix_acl *acl;
>  	size_t size;
> -	int depth;
>  	int error;
> =20
>  	if (IS_PRIVATE(inode))
> @@ -454,9 +458,7 @@ int reiserfs_acl_chmod(struct inode *ino
>  		return 0;
>  	}
> =20
> -	reiserfs_write_unlock(inode->i_sb);
>  	acl =3D reiserfs_get_acl(inode, ACL_TYPE_ACCESS);
> -	reiserfs_write_lock(inode->i_sb);
>  	if (!acl)
>  		return 0;
>  	if (IS_ERR(acl))
> @@ -466,16 +468,18 @@ int reiserfs_acl_chmod(struct inode *ino
>  		return error;
> =20
>  	size =3D reiserfs_xattr_nblocks(inode, reiserfs_acl_size(acl->a_count=
));
> -	depth =3D reiserfs_write_lock_once(inode->i_sb);
> +	reiserfs_write_lock(inode->i_sb);
>  	error =3D journal_begin(&th, inode->i_sb, size * 2);
> +	reiserfs_write_unlock(inode->i_sb);
>  	if (!error) {
>  		int error2;
>  		error =3D reiserfs_set_acl(&th, inode, ACL_TYPE_ACCESS, acl);
> +		reiserfs_write_lock(inode->i_sb);
>  		error2 =3D journal_end(&th, inode->i_sb, size * 2);
> +		reiserfs_write_unlock(inode->i_sb);
>  		if (error2)
>  			error =3D error2;
>  	}
> -	reiserfs_write_unlock_once(inode->i_sb, depth);
>  	posix_acl_release(acl);
>  	return error;
>  }
>=20
>=20
> --
> To unsubscribe from this list: send the line "unsubscribe reiserfs-deve=
l" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>=20


--=20
Jeff Mahoney
SUSE Labs


--FVeOXWMf0cjTnvl88VlNADRt7uj0O9enN
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG/MacGPG2 v2.0.19 (Darwin)

iQIcBAEBAgAGBQJSACIfAAoJEB57S2MheeWy+E4P+wZ4kwlLse3muN4s+Kvmd3qc
pndz3Z9HlCB75qr7K1SqLbc5J1OaR8VQthJOWCQKcnXphZGJk8bLfEe2k4SENGl9
LBc2T5hhBkKdli+Qg2MQHZwuO3U4geeKLNOITzNWu8RAN8u2B3tJWulCLiSmRIus
gjxUvblc7VKAB7f5Kiyj/t4DZqG4RcVgZgxI/qxTFoxIHABc86rIm0qtw1Yn+Aq5
ckKFZCW5iHQAp0nEuNfxa5zyaB1Ba7NdRtmpWN/OJPJiquAxaAKrHTiLAxk2BZHT
zViBxm5XQL3U53rVobkhOrUPFVxycpiika1EpLJJ+LZae8+LLZLYpJEtogEmelMs
ZXOffIrn5tV3wzHfO3xT+ZI4G/0H6uhqZVPfXDU9p9IV0WzMVL3yyOaxYXlYjIjs
YZUvICCCPrTZqESQ9Y7eYV6mNrEgCGsbjEs3vewzEeF6kPrzGKR6NxFtipciQA83
UYiKxUReHbWGr8fH/p7Uuv/Bx21ptIvW95JfO5CNM33++8cBfuJfHOe5eoE7XHeq
aBLlg/nC9EXatHm65uQuqF7WvHJLs3QQ+IIMOsVdP7S0bRILxahA6HflzK6HNztd
+uJX3xGjVx1siRge/fZLY7mob1SioCNHFkUcC7J2ojx/NmIpB0XEXFBVq9sxGCwG
KPfZSJqmLS5ypmiImqzR
=weZe
-----END PGP SIGNATURE-----

--FVeOXWMf0cjTnvl88VlNADRt7uj0O9enN--
