From: Laurent Riffard <laurent.riffard@free.fr>
Subject: Re: 2.6.23-mm1: BUG in reiserfs_delete_xattrs
Date: Mon, 15 Oct 2007 21:51:54 +0200
Message-ID: <4713C4DA.8090708__16006.8863108338$1192481073$gmane$org@free.fr>
References: <20071011213126.cf92efb7.akpm@linux-foundation.org> <47129992.4040903@free.fr> <20071015084052.GA21870@infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <20071015084052.GA21870@infradead.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Christoph Hellwig <hch@infradead.org>, Laurent Riffard <laurent.riffard@free.fr>, Andrew Morton <akpm@linux-foundation.org>, Dave Hansen <haveblue@us.ibm.com>, linux-kernel@vger.kern

Le 15.10.2007 10:40, Christoph Hellwig a =E9crit :
> On Mon, Oct 15, 2007 at 12:34:58AM +0200, Laurent Riffard wrote:
>> reiserfs_delete_xattrs
>> reiserfs_delete_inode
>> generic_delete_inode
>> generic_drop_inode
>> iput
>> do_unlinkat
>> sys_unlink
>> sys_enter_past_esp
>>
>> I reported a similar BUG in 2.6.22-rc8-mm2 (see
>> http://lkml.org/lkml/2007/9/27/235). Dave Hansen sent a patch for it=
, I
>> tested it and it was OK for 2.6.22-rc8-mm2.
>>
>> I tried this patch on 2.6.23-mm1, and it fixed the BUGs here too.
>=20
> The delete path is a similar case as the one Dave fixed, also cause b=
y
> a NULL vfsmount passed to dentry_open, but through a different code-p=
ath.
>=20
> Untested fix for this problem below:

Does work fine, thanks.

Tested-by: Laurent Riffard <laurent.riffard@free.fr>

=20
> Index: linux-2.6.23-rc8/fs/reiserfs/xattr.c
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> --- linux-2.6.23-rc8.orig/fs/reiserfs/xattr.c	2007-09-30 14:13:46.000=
000000 +0200
> +++ linux-2.6.23-rc8/fs/reiserfs/xattr.c	2007-09-30 14:18:30.00000000=
0 +0200
> @@ -207,9 +207,8 @@ static struct dentry *get_xa_file_dentry
>   * we're called with i_mutex held, so there are no worries about the=
 directory
>   * changing underneath us.
>   */
> -static int __xattr_readdir(struct file *filp, void *dirent, filldir_=
t filldir)
> +static int __xattr_readdir(struct inode *inode, void *dirent, filldi=
r_t filldir)
>  {
> -	struct inode *inode =3D filp->f_path.dentry->d_inode;
>  	struct cpu_key pos_key;	/* key of current position in the directory=
 (key of directory entry) */
>  	INITIALIZE_PATH(path_to_entry);
>  	struct buffer_head *bh;
> @@ -352,24 +351,19 @@ static int __xattr_readdir(struct file *
>   * this is stolen from vfs_readdir
>   *
>   */
> -static
> -int xattr_readdir(struct file *file, filldir_t filler, void *buf)
> +static int xattr_readdir(struct inode *inode, filldir_t filler, void=
 *buf)
>  {
> -	struct inode *inode =3D file->f_path.dentry->d_inode;
>  	int res =3D -ENOTDIR;
> -	if (!file->f_op || !file->f_op->readdir)
> -		goto out;
> +
>  	mutex_lock_nested(&inode->i_mutex, I_MUTEX_XATTR);
> -//        down(&inode->i_zombie);
>  	res =3D -ENOENT;
>  	if (!IS_DEADDIR(inode)) {
>  		lock_kernel();
> -		res =3D __xattr_readdir(file, buf, filler);
> +		res =3D __xattr_readdir(inode, buf, filler);
>  		unlock_kernel();
>  	}
> -//        up(&inode->i_zombie);
>  	mutex_unlock(&inode->i_mutex);
> -      out:
> +
>  	return res;
>  }
> =20
> @@ -721,7 +715,6 @@ reiserfs_delete_xattrs_filler(void *buf,
>  /* This is called w/ inode->i_mutex downed */
>  int reiserfs_delete_xattrs(struct inode *inode)
>  {
> -	struct file *fp;
>  	struct dentry *dir, *root;
>  	int err =3D 0;
> =20
> @@ -742,15 +735,8 @@ int reiserfs_delete_xattrs(struct inode=20
>  		return 0;
>  	}
> =20
> -	fp =3D dentry_open(dir, NULL, O_RDWR);
> -	if (IS_ERR(fp)) {
> -		err =3D PTR_ERR(fp);
> -		/* dentry_open dputs the dentry if it fails */
> -		goto out;
> -	}
> -
>  	lock_kernel();
> -	err =3D xattr_readdir(fp, reiserfs_delete_xattrs_filler, dir);
> +	err =3D xattr_readdir(dir->d_inode, reiserfs_delete_xattrs_filler, =
dir);
>  	if (err) {
>  		unlock_kernel();
>  		goto out_dir;
> @@ -770,7 +756,7 @@ int reiserfs_delete_xattrs(struct inode=20
>  	unlock_kernel();
> =20
>        out_dir:
> -	fput(fp);
> +	dput(dir);
> =20
>        out:
>  	if (!err)
> @@ -812,7 +798,6 @@ reiserfs_chown_xattrs_filler(void *buf,=20
> =20
>  int reiserfs_chown_xattrs(struct inode *inode, struct iattr *attrs)
>  {
> -	struct file *fp;
>  	struct dentry *dir;
>  	int err =3D 0;
>  	struct reiserfs_chown_buf buf;
> @@ -836,13 +821,6 @@ int reiserfs_chown_xattrs(struct inode *
>  		goto out;
>  	}
> =20
> -	fp =3D dentry_open(dir, NULL, O_RDWR);
> -	if (IS_ERR(fp)) {
> -		err =3D PTR_ERR(fp);
> -		/* dentry_open dputs the dentry if it fails */
> -		goto out;
> -	}
> -
>  	lock_kernel();
> =20
>  	attrs->ia_valid &=3D (ATTR_UID | ATTR_GID | ATTR_CTIME);
> @@ -850,7 +828,7 @@ int reiserfs_chown_xattrs(struct inode *
>  	buf.attrs =3D attrs;
>  	buf.inode =3D inode;
> =20
> -	err =3D xattr_readdir(fp, reiserfs_chown_xattrs_filler, &buf);
> +	err =3D xattr_readdir(dir->d_inode, reiserfs_chown_xattrs_filler, &=
buf);
>  	if (err) {
>  		unlock_kernel();
>  		goto out_dir;
> @@ -860,7 +838,7 @@ int reiserfs_chown_xattrs(struct inode *
>  	unlock_kernel();
> =20
>        out_dir:
> -	fput(fp);
> +	dput(dir);
> =20
>        out:
>  	attrs->ia_valid =3D ia_valid;
> @@ -1008,7 +986,6 @@ reiserfs_listxattr_filler(void *buf, con
>   */
>  ssize_t reiserfs_listxattr(struct dentry * dentry, char *buffer, siz=
e_t size)
>  {
> -	struct file *fp;
>  	struct dentry *dir;
>  	int err =3D 0;
>  	struct reiserfs_listxattr_buf buf;
> @@ -1031,13 +1008,6 @@ ssize_t reiserfs_listxattr(struct dentry
>  		goto out;
>  	}
> =20
> -	fp =3D dentry_open(dir, NULL, O_RDWR);
> -	if (IS_ERR(fp)) {
> -		err =3D PTR_ERR(fp);
> -		/* dentry_open dputs the dentry if it fails */
> -		goto out;
> -	}
> -
>  	buf.r_buf =3D buffer;
>  	buf.r_size =3D buffer ? size : 0;
>  	buf.r_pos =3D 0;
> @@ -1045,7 +1015,7 @@ ssize_t reiserfs_listxattr(struct dentry
> =20
>  	REISERFS_I(dentry->d_inode)->i_flags |=3D i_has_xattr_dir;
> =20
> -	err =3D xattr_readdir(fp, reiserfs_listxattr_filler, &buf);
> +	err =3D xattr_readdir(dir->d_inode, reiserfs_listxattr_filler, &buf=
);
>  	if (err)
>  		goto out_dir;
> =20
> @@ -1055,7 +1025,7 @@ ssize_t reiserfs_listxattr(struct dentry
>  		err =3D buf.r_pos;
> =20
>        out_dir:
> -	fput(fp);
> +	dput(dir);
> =20
>        out:
>  	reiserfs_read_unlock_xattr_i(dentry->d_inode);
>=20

-
To unsubscribe from this list: send the line "unsubscribe reiserfs-deve=
l" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
