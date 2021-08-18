From: Christian Brauner <christian.brauner@ubuntu.com>
Subject: Re: [PATCH] fs: reiserfs: fix NULL pointer dereference in
Date: Wed, 18 Aug 2021 10:39:02 +0200
Message-ID: <20210818083902.cggbknm3o2e75ewe@wittgenstein>
References: <1629273667-7687-1-git-send-email-tcs_kernel@tencent.com>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1629273667-7687-1-git-send-email-tcs_kernel@tencent.com>
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: tcs.kernel@gmail.com
Cc: mszeredi@redhat.com, jamorris@linux.microsoft.com, gustavoars@kernel.org, reiserfs-devel@vger.kernel.org, Haimin Zhang <tcs_kernel@tencent.com>

On Wed, Aug 18, 2021 at 04:01:07PM +0800, tcs.kernel@gmail.com wrote:
> From: Haimin Zhang <tcs_kernel@tencent.com> 
> 
> If root_inode->i_op is reiserfs_special_inode_operations
> reiserfs_special_inode_operations doesn't implement the lookup callback
> function,resulting an NULL pointer when the reiserfs_lookup_privroot() 
> function was called.
> 
> Call Trace:
>  __lookup_slow+0x267/0x490 build/../fs/namei.c:1646
>  lookup_one_len+0x163/0x190 build/../fs/namei.c:2663
>  reiserfs_lookup_privroot+0x92/0x290 build/../fs/reiserfs/xattr.c:980
>  reiserfs_fill_super+0x1f2a/0x2d80 build/../fs/reiserfs/super.c:2176
>  mount_bdev+0x33d/0x410 build/../fs/super.c:1368
>  legacy_get_tree+0x103/0x210 build/../fs/fs_context.c:610
>  vfs_get_tree+0x86/0x2f0 build/../fs/super.c:1498
>  do_new_mount build/../fs/namespace.c:2905 [inline]
>  path_mount+0x688/0x1d10 build/../fs/namespace.c:3235
>  do_mount+0xf1/0x110 build/../fs/namespace.c:3248
>  __do_sys_mount build/../fs/namespace.c:3456 [inline]
>  __se_sys_mount build/../fs/namespace.c:3433 [inline]
>  __x64_sys_mount+0x1d5/0x220 build/../fs/namespace.c:3433
>  do_syscall_x64 build/../arch/x86/entry/common.c:50 [inline]
>  do_syscall_64+0x34/0xb0 build/../arch/x86/entry/common.c:80
>  entry_SYSCALL_64_after_hwframe+0x44/0xae
> 

Hey Haimin,

This is rather suspicious. I'd really like to see the syzbot reproducer
for this. Which brings us to:

> Reported-by: syzbot+11c49c...@syzkaller.appspotmail.com

what's the full syzbot link? This is hacked off.

> Signed-off-by: Haimin Zhang <tcs_kernel@tencent.com>
> ---
>  fs/reiserfs/namei.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/fs/reiserfs/namei.c b/fs/reiserfs/namei.c
> index 3d7a35d..947b51b 100644
> --- a/fs/reiserfs/namei.c
> +++ b/fs/reiserfs/namei.c
> @@ -350,6 +350,12 @@ static int reiserfs_find_entry(struct inode *dir, const char *name, int namelen,
>  	}			/* while (1) */
>  }
>  
> +static struct dentry *reiserfs_noop_lookup(struct inode *dir, struct dentry *dentry,
> +				      unsigned int flags)
> +{
> +	return ERR_PTR(-ENOENT);
> +}
> +
>  static struct dentry *reiserfs_lookup(struct inode *dir, struct dentry *dentry,
>  				      unsigned int flags)
>  {
> @@ -1680,6 +1686,7 @@ static int reiserfs_rename(struct user_namespace *mnt_userns,
>   * special file operations.. just xattr/acl stuff
>   */
>  const struct inode_operations reiserfs_special_inode_operations = {
> +	.lookup = reiserfs_noop_lookup,
>  	.setattr = reiserfs_setattr,
>  	.listxattr = reiserfs_listxattr,
>  	.permission = reiserfs_permission,

In any case, this seems like the wrong fix tapering over the real issue.
The issue here seems to me some sort of corruption going on. The root
inode should not be a special file. So reiserfs should do it like xfs,
ext4, btrfs etc. and verify one way or the other that the root inode is
a directory and return an error when it isn't. Sm like this (completely
untested and produced with marginal knowledge about reiserfs):

diff --git a/fs/reiserfs/super.c b/fs/reiserfs/super.c
index 3ffafc73acf0..be4c301f5c94 100644
--- a/fs/reiserfs/super.c
+++ b/fs/reiserfs/super.c
@@ -2062,7 +2062,7 @@ static int reiserfs_fill_super(struct super_block *s, void *data, int silent)
        root_inode =
            iget5_locked(s, REISERFS_ROOT_OBJECTID, reiserfs_find_actor,
                         reiserfs_init_locked_inode, (void *)&args);
-       if (!root_inode) {
+       if (!root_inode || !S_ISDIR(root_inode)) {
                SWARN(silent, s, "jmacd-10", "get root inode failed");
                goto error_unlocked;
        }

