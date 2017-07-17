From: Jan Kara <jack@suse.cz>
Subject: Re: [PATCH 5/5] reiserfs: preserve i_mode if __reiserfs_set_acl()
 fails
Date: Mon, 17 Jul 2017 18:45:54 +0200
Message-ID: <20170717164554.GD22195@quack2.suse.cz>
References: <cover.1499805484.git.ernesto.mnd.fernandez@gmail.com>
 <3ab632985cbf6fdd2ee5284482b9749c5893a5a1.1499805488.git.ernesto.mnd.fernandez@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="jI8keyz6grp/JLjh"
Content-Transfer-Encoding: 8bit
Return-path: <linux-ext4-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <3ab632985cbf6fdd2ee5284482b9749c5893a5a1.1499805488.git.ernesto.mnd.fernandez@gmail.com>
Sender: linux-ext4-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
To: Ernesto =?iso-8859-1?Q?A=2E_Fern=E1ndez?= <ernesto.mnd.fernandez@gmail.com>
Cc: Jan Kara <jack@suse.com>, Theodore Ts'o <tytso@mit.edu>, Andreas Dilger <adilger.kernel@dilger.ca>, Dave Kleikamp <shaggy@kernel.org>, linux-ext4@vger.kernel.org, jfs-discussion@lists.sourceforge.net, reiserfs-devel@vger.kernel.org


--jI8keyz6grp/JLjh
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed 12-07-17 06:56:04, Ernesto A. Fern=E1ndez wrote:
> When changing a file's acl mask, __reiserfs_set_acl() will first set the
> group bits of i_mode to the value of the mask, and only then set the
> actual extended attribute representing the new acl.
>=20
> If the second part fails (due to lack of space, for example) and the file
> had no acl attribute to begin with, the system will from now on assume
> that the mask permission bits are actual group permission bits, potential=
ly
> granting access to the wrong users.
>=20
> Prevent this by only changing the inode mode after the acl has been set.
> Also make reiserfs_xattr_set_handle() return -ENODATA only in case of
> actual error, and return 0 when requested deletion of a nonexistent acl.
> This is more consistent with the behaviour of other *_xattr_set()
> functions and makes the patch simpler.
>=20
> Signed-off-by: Ernesto A. Fern=E1ndez <ernesto.mnd.fernandez@gmail.com>

Thanks for the patch!  I have rebased this onto my tree and merged the
resulting patch (attached).

								Honza

> ---
>  fs/reiserfs/xattr.c     |  4 ++++
>  fs/reiserfs/xattr_acl.c | 25 +++++++++----------------
>  2 files changed, 13 insertions(+), 16 deletions(-)
>=20
> diff --git a/fs/reiserfs/xattr.c b/fs/reiserfs/xattr.c
> index e87aa21..936a57a 100644
> --- a/fs/reiserfs/xattr.c
> +++ b/fs/reiserfs/xattr.c
> @@ -513,6 +513,10 @@ reiserfs_xattr_set_handle(struct reiserfs_transactio=
n_handle *th,
> =20
>  	if (!buffer) {
>  		err =3D lookup_and_delete_xattr(inode, name);
> +		if (flags & XATTR_REPLACE)
> +			return err;
> +		if (err =3D=3D -ENODATA)
> +			err =3D 0;
>  		return err;
>  	}
> =20
> diff --git a/fs/reiserfs/xattr_acl.c b/fs/reiserfs/xattr_acl.c
> index 3d2256a..c02e5ac 100644
> --- a/fs/reiserfs/xattr_acl.c
> +++ b/fs/reiserfs/xattr_acl.c
> @@ -237,14 +237,17 @@ __reiserfs_set_acl(struct reiserfs_transaction_hand=
le *th, struct inode *inode,
>  	void *value =3D NULL;
>  	size_t size =3D 0;
>  	int error;
> +	int update_mode =3D 0;
> +	umode_t mode =3D inode->i_mode;
> =20
>  	switch (type) {
>  	case ACL_TYPE_ACCESS:
>  		name =3D XATTR_NAME_POSIX_ACL_ACCESS;
>  		if (acl) {
> -			error =3D posix_acl_update_mode(inode, &inode->i_mode, &acl);
> +			error =3D posix_acl_update_mode(inode, &mode, &acl);
>  			if (error)
>  				return error;
> +			update_mode =3D 1;
>  		}
>  		break;
>  	case ACL_TYPE_DEFAULT:
> @@ -264,25 +267,15 @@ __reiserfs_set_acl(struct reiserfs_transaction_hand=
le *th, struct inode *inode,
> =20
>  	error =3D reiserfs_xattr_set_handle(th, inode, name, value, size, 0);
> =20
> -	/*
> -	 * Ensure that the inode gets dirtied if we're only using
> -	 * the mode bits and an old ACL didn't exist. We don't need
> -	 * to check if the inode is hashed here since we won't get
> -	 * called by reiserfs_inherit_default_acl().
> -	 */
> -	if (error =3D=3D -ENODATA) {
> -		error =3D 0;
> -		if (type =3D=3D ACL_TYPE_ACCESS) {
> +	kfree(value);
> +	if (!error) {
> +		set_cached_acl(inode, type, acl);
> +		if (update_mode) {
> +			inode->i_mode =3D mode;
>  			inode->i_ctime =3D current_time(inode);
>  			mark_inode_dirty(inode);
>  		}
>  	}
> -
> -	kfree(value);
> -
> -	if (!error)
> -		set_cached_acl(inode, type, acl);
> -
>  	return error;
>  }
> =20
> --=20
> 2.1.4
>=20
>=20
--=20
Jan Kara <jack@suse.com>
SUSE Labs, CR

--jI8keyz6grp/JLjh
Content-Type: text/x-patch; charset="iso-8859-1"
Content-Disposition: attachment; filename="0001-reiserfs-preserve-i_mode-if-__reiserfs_set_acl-fails.patch"
Content-Transfer-Encoding: quoted-printable

From 71edef97f294dbff5d84bca5721c7b30273a0786 Mon Sep 17 00:00:00 2001
From: =3D?UTF-8?q?Ernesto=3D20A=3D2E=3D20Fern=3DC3=3DA1ndez?=3D
 <ernesto.mnd.fernandez@gmail.com>
Date: Mon, 17 Jul 2017 18:42:41 +0200
Subject: [PATCH] reiserfs: preserve i_mode if __reiserfs_set_acl() fails
MIME-Version: 1.0
Content-Type: text/plain; charset=3DUTF-8
Content-Transfer-Encoding: 8bit

When changing a file's acl mask, reiserfs_set_acl() will first set the
group bits of i_mode to the value of the mask, and only then set the
actual extended attribute representing the new acl.

If the second part fails (due to lack of space, for example) and the
file had no acl attribute to begin with, the system will from now on
assume that the mask permission bits are actual group permission bits,
potentially granting access to the wrong users.

Prevent this by only changing the inode mode after the acl has been set.

Signed-off-by: Ernesto A. Fern=E1ndez <ernesto.mnd.fernandez@gmail.com>
Signed-off-by: Jan Kara <jack@suse.cz>
---
 fs/reiserfs/xattr_acl.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/fs/reiserfs/xattr_acl.c b/fs/reiserfs/xattr_acl.c
index d92a1dc6ee70..54415f0e3d18 100644
--- a/fs/reiserfs/xattr_acl.c
+++ b/fs/reiserfs/xattr_acl.c
@@ -23,7 +23,8 @@ reiserfs_set_acl(struct inode *inode, struct posix_acl *a=
cl, int type)
 	struct reiserfs_transaction_handle th;
 	size_t jcreate_blocks;
 	int size =3D acl ? posix_acl_xattr_size(acl->a_count) : 0;
--jI8keyz6grp/JLjh--
