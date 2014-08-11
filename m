From: Jeff Mahoney <jeffm@suse.com>
Subject: Re: [PATCH 1/2] reiserfs: Avoid warning from unlock_new_inode()
Date: Mon, 11 Aug 2014 15:25:15 -0400
Message-ID: <53E9189B.2080705@suse.com>
References: <1407348240-1991-1-git-send-email-jack@suse.cz> <1407348240-1991-2-git-send-email-jack@suse.cz>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <1407348240-1991-2-git-send-email-jack@suse.cz>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jan Kara <jack@suse.cz>, reiserfs-devel@vger.kernel.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 8/6/14, 2:03 PM, Jan Kara wrote:
> xfstest run for reiserfs produces lots of warnings like:
> 
> WARNING: CPU: 4 PID: 24572 at fs/inode.c:937
> unlock_new_inode+0x76/0x80()
> 
> because reiserfs uses new_inode() to allocate new inodes and that
> doesn't set I_NEW in i_state. This seems like it could cause subtle
> bugs because half-initialized inodes may be visible in superblock
> inode list or inode hashes. So make sure inode has I_NEW set before
> it's visible anywhere which also gets rid of the warning.
> 
> Signed-off-by: Jan Kara <jack@suse.cz>

The problem is that reiserfs_new_inode drops down to the error
handling case without having called insert_inode_locked4. I have a
patch that just moves the quota check after the insertion so we don't
need to do gross things like if (!inode_unhashed(inode))
unlock_new_inode(inode) in the error path. It's consistent with how
ext4 does it.

- -Jeff


> --- fs/reiserfs/namei.c | 34 ++++++++++++++++++---------------- 1
> file changed, 18 insertions(+), 16 deletions(-)
> 
> diff --git a/fs/reiserfs/namei.c b/fs/reiserfs/namei.c index
> cd11358b10c7..c4f435c4e6fc 100644 --- a/fs/reiserfs/namei.c +++
> b/fs/reiserfs/namei.c @@ -580,8 +580,8 @@ static int
> reiserfs_add_entry(struct reiserfs_transaction_handle *th, }
> 
> /* - * quota utility function, call if you've had to abort after
> calling - * new_inode_init, and have not called reiserfs_new_inode
> yet. + * Utility function to call if you've had to abort after
> calling + * get_new_inode, and have not called reiserfs_new_inode
> yet. * This should only be called on inodes that do not have stat
> data * inserted into the tree yet. */ @@ -590,6 +590,7 @@ static
> int drop_new_inode(struct inode *inode) dquot_drop(inode); 
> make_bad_inode(inode); inode->i_flags |= S_NOQUOTA; +
> unlock_new_inode(inode); iput(inode); return 0; } @@ -600,8 +601,16
> @@ static int drop_new_inode(struct inode *inode) * outside of a
> transaction, so we had to pull some bits of * reiserfs_new_inode
> out into this func. */ -static int new_inode_init(struct inode
> *inode, struct inode *dir, umode_t mode) +static struct inode
> *get_new_inode(struct inode *dir, umode_t mode) { +	struct inode
> *inode = new_inode_pseudo(dir->i_sb); + +	if (!inode) +		return
> NULL; +	/* Make sure inode is invisible until it's fully set up */ 
> +	inode->i_state |= I_NEW; +	inode_sb_list_add(inode); + /* * Make
> inode invalid - just in case we are going to drop it before * the
> initialization happens @@ -614,7 +623,8 @@ static int
> new_inode_init(struct inode *inode, struct inode *dir, umode_t
> mode) */ inode_init_owner(inode, dir, mode); 
> dquot_initialize(inode); -	return 0; + +	return inode; }
> 
> static int reiserfs_create(struct inode *dir, struct dentry
> *dentry, umode_t mode, @@ -635,10 +645,8 @@ static int
> reiserfs_create(struct inode *dir, struct dentry *dentry, umode_t
> mod
> 
> dquot_initialize(dir);
> 
> -	if (!(inode = new_inode(dir->i_sb))) { +	if (!(inode =
> get_new_inode(dir, mode))) return -ENOMEM; -	} -
> new_inode_init(inode, dir, mode);
> 
> jbegin_count += reiserfs_cache_default_acl(dir); retval =
> reiserfs_security_init(dir, inode, &dentry->d_name, &security); @@
> -712,10 +720,8 @@ static int reiserfs_mknod(struct inode *dir,
> struct dentry *dentry, umode_t mode
> 
> dquot_initialize(dir);
> 
> -	if (!(inode = new_inode(dir->i_sb))) { +	if (!(inode =
> get_new_inode(dir, mode))) return -ENOMEM; -	} -
> new_inode_init(inode, dir, mode);
> 
> jbegin_count += reiserfs_cache_default_acl(dir); retval =
> reiserfs_security_init(dir, inode, &dentry->d_name, &security); @@
> -797,10 +803,8 @@ static int reiserfs_mkdir(struct inode *dir,
> struct dentry *dentry, umode_t mode 
> REISERFS_I(dir)->new_packing_locality = 1; #endif mode = S_IFDIR |
> mode; -	if (!(inode = new_inode(dir->i_sb))) { +	if (!(inode =
> get_new_inode(dir, mode))) return -ENOMEM; -	} -
> new_inode_init(inode, dir, mode);
> 
> jbegin_count += reiserfs_cache_default_acl(dir); retval =
> reiserfs_security_init(dir, inode, &dentry->d_name, &security); @@
> -1097,10 +1101,8 @@ static int reiserfs_symlink(struct inode
> *parent_dir,
> 
> dquot_initialize(parent_dir);
> 
> -	if (!(inode = new_inode(parent_dir->i_sb))) { +	if (!(inode =
> get_new_inode(parent_dir, mode))) return -ENOMEM; -	} -
> new_inode_init(inode, parent_dir, mode);
> 
> retval = reiserfs_security_init(parent_dir, inode,
> &dentry->d_name, &security);
> 


- -- 
Jeff Mahoney
SUSE Labs
-----BEGIN PGP SIGNATURE-----
Version: GnuPG/MacGPG2 v2.0.19 (Darwin)

iQIcBAEBAgAGBQJT6RibAAoJEB57S2MheeWyQN8P/A9BE9Xbp0tSwBi1TklqE3Hm
xKK1IHgdVPODpysKKbr6V2llVOl+Fis/1kT7SKyVZ5LraVhrfQU/37HzO0535ITR
n1bBiQV/PgejEtkSqKDMispk0kGaVCCgg2o6scHg3Qr8w9qF2mmrTUUOQPcMsaEa
YKmd7sN+3+RbvP7mHderAM4Yjb+EXzjlgfqyOZYg+jY8Id+b5Yn5TekMQJMvvsPh
tWiGaDF9cYsVZL2fdNUvOXdUMycYx2xDTzcCNBOEHh9FHS3kIVrCtrwfXQJEys5a
nB1Es94tAW2M3Au/8L3kugcy8iR7gxqGFctCtfmtUpm7SiusNDIfXyNpbRtgdbF5
QFlqmNF2mLDYKNr93SbMLbF+fnl1NzkoFmrsu17bWiiQaxmqNDsnZeNUANWSrXsE
QXS2Ardd24+BOW2aiSQXXwSkaHeQy3h/H9gX+TqbpUBdsRJO9bggm7IDFNn7n4ow
mM0jRlu5tzyUHQRjzkwqqAqjBTB9l+rEV5zwikNE9QzWjovlKZ+NltW3mkMtYKKX
P/wQs49zKT8g+InLiLFXanYrZkMpQ/HgQGw3rRMd5o5P2I0kih3Flaa2Gwlf4P7n
6xcv+STczVUg/htRUIMppQVIkriOD92QVmKAzmIsPBXIPTpJNVjrknc0e8MDDfql
8j0moTvJ8CloSg25k0W5
=xfQ5
-----END PGP SIGNATURE-----
