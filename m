From: Jeff Mahoney <jeffm@suse.com>
Subject: Re: [PATCH 20/21] fs: Move prototype declaration to header file reiserfs.h
 from super.c
Date: Sun, 09 Feb 2014 13:08:50 -0500
Message-ID: <52F7C432.8080905@suse.com>
References: <b572932c3e016c55e596686283036316a1aacd2f.1391949868.git.rashika.kheria@gmail.com> <764a2eddc09cb8670d757cd4170d44d41b3971e0.1391949868.git.rashika.kheria@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <764a2eddc09cb8670d757cd4170d44d41b3971e0.1391949868.git.rashika.kheria@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Rashika Kheria <rashika.kheria@gmail.com>, linux-kernel@vger.kernel.org
Cc: Al Viro <viro@zeniv.linux.org.uk>, Andrew Morton <akpm@linux-foundation.org>, Alex Elder <alex.elder@linaro.org>, "David S. Miller" <davem@davemloft.net>, "Eric W. Biederman" <ebiederm@xmission.com>, Ionut-Gabriel Radu <ihonius@gmail.com>, reiserfs-devel@vger.kernel.org, josh@joshtriplett.org

On 02/09/2014 08:29 AM, Rashika Kheria wrote:
> Move prototype declaration to header file reiserfs/reiserfs.h from
> reiserfs/super.c because they are used by more than one file.
>=20
> This eliminates the following warning in reiserfs/bitmap.c:
> fs/reiserfs/bitmap.c:647:6: warning: no previous prototype for =E2=80=
=98show_alloc_options=E2=80=99 [-Wmissing-prototypes]
>=20
> Signed-off-by: Rashika Kheria <rashika.kheria@gmail.com>
> Reviewed-by: Josh Triplett <josh@joshtriplett.org>

Acked-by: Jeff Mahoney <jeffm@suse.com>


> ---
>  fs/reiserfs/reiserfs.h |    1 +
>  fs/reiserfs/super.c    |    1 -
>  2 files changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/fs/reiserfs/reiserfs.h b/fs/reiserfs/reiserfs.h
> index 8d06adf..83d4eac 100644
> --- a/fs/reiserfs/reiserfs.h
> +++ b/fs/reiserfs/reiserfs.h
> @@ -2831,6 +2831,7 @@ void reiserfs_init_alloc_options(struct super_b=
lock *s);
>   */
>  __le32 reiserfs_choose_packing(struct inode *dir);
> =20
> +void show_alloc_options(struct seq_file *seq, struct super_block *s)=
;
>  int reiserfs_init_bitmap_cache(struct super_block *sb);
>  void reiserfs_free_bitmap_cache(struct super_block *sb);
>  void reiserfs_cache_bitmap_metadata(struct super_block *sb, struct b=
uffer_head *bh, struct reiserfs_bitmap_info *info);
> diff --git a/fs/reiserfs/super.c b/fs/reiserfs/super.c
> index 2c80335..16d5335 100644
> --- a/fs/reiserfs/super.c
> +++ b/fs/reiserfs/super.c
> @@ -62,7 +62,6 @@ static int is_any_reiserfs_magic_string(struct reis=
erfs_super_block *rs)
> =20
>  static int reiserfs_remount(struct super_block *s, int *flags, char =
*data);
>  static int reiserfs_statfs(struct dentry *dentry, struct kstatfs *bu=
f);
> -void show_alloc_options(struct seq_file *seq, struct super_block *s)=
;
> =20
>  static int reiserfs_sync_fs(struct super_block *s, int wait)
>  {
>=20


--=20
Jeff Mahoney
SUSE Labs
--
To unsubscribe from this list: send the line "unsubscribe reiserfs-deve=
l" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
