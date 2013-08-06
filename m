From: Jan Kara <jack@suse.cz>
Subject: Re: [patch 1/2] reiserfs: locking, handle nested locks properly
Date: Tue, 6 Aug 2013 22:46:08 +0200
Message-ID: <20130806204608.GB11383@quack.suse.cz>
References: <20130806001216.080404663@suse.com>
 <20130806001314.727159902@suse.com>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20130806001314.727159902@suse.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jeff Mahoney <jeffm@suse.com>
Cc: reiserfs-devel@vger.kernel.org, jack@suse.com

On Mon 05-08-13 20:12:17, Jeff Mahoney wrote:
> The reiserfs write lock replaced the BKL and uses similar semantics.
> 
> Frederic's locking code makes a distinction between when the lock is nested
> and when it's being acquired/released, but I don't think that's the right
> distinction to make.
> 
> The right distinction is between the lock being released at end-of-use and
> the lock being released for a schedule. The unlock should return the depth
> and the lock should restore it, rather than the other way around as it is now.
> 
> This patch implements that and adds a number of places where the lock
> should be dropped.
...

> --- a/fs/reiserfs/reiserfs.h	2013-08-05 20:08:59.258412220 -0400
> +++ b/fs/reiserfs/reiserfs.h	2013-08-05 20:09:52.537601042 -0400
> @@ -630,8 +630,8 @@ static inline int __reiserfs_is_journal_
>   */
>  void reiserfs_write_lock(struct super_block *s);
>  void reiserfs_write_unlock(struct super_block *s);
> -int reiserfs_write_lock_once(struct super_block *s);
> -void reiserfs_write_unlock_once(struct super_block *s, int lock_depth);
> +int __must_check reiserfs_write_unlock_nested(struct super_block *s);
> +void reiserfs_write_lock_nested(struct super_block *s, int depth);
>  
>  #ifdef CONFIG_REISERFS_CHECK
>  void reiserfs_lock_check_recursive(struct super_block *s);
> @@ -666,45 +666,54 @@ static inline void reiserfs_lock_check_r
>   * - The journal lock
>   * - The inode mutex
>   */
> -static inline void reiserfs_mutex_lock_safe(struct mutex *m,
> -			       struct super_block *s)
> +
> +#define reiserfs_safe(sb, action)			\
> +do {							\
> +	struct super_block *__sb = (sb);		\
> +	int __depth;					\
> +	__depth = reiserfs_write_unlock_nested(__sb);	\
> +	(action);					\
> +	reiserfs_write_lock_nested(__sb, __depth);	\
> +} while(0)
> +
> +#define reiserfs_mutex_lock_safe(mtx, s) reiserfs_safe(s, mutex_lock(mtx))
> +#define reiserfs_mutex_lock_nested_safe(mtx, subclass, s) \
> +	reiserfs_safe(s, mutex_lock_nested(mtx, subclass))
> +#define reiserfs_down_read_safe(sem, s) reiserfs_safe(s, down_read(sem))
> +
> +/*
> + * When we schedule, we usually want to also release the write lock,
> + * according to the previous bkl based locking scheme of reiserfs.
> + */
> +static inline void reiserfs_cond_resched(struct super_block *s)
>  {
> -	reiserfs_lock_check_recursive(s);
> -	reiserfs_write_unlock(s);
> -	mutex_lock(m);
> -	reiserfs_write_lock(s);
> +	if (need_resched())
> +		reiserfs_safe(s, schedule());
>  }
>  
> -static inline void
> -reiserfs_mutex_lock_nested_safe(struct mutex *m, unsigned int subclass,
> -			       struct super_block *s)
> +static inline struct buffer_head *
> +reiserfs_safe_sb_bread(struct super_block *s, sector_t block)
>  {
> -	reiserfs_lock_check_recursive(s);
> -	reiserfs_write_unlock(s);
> -	mutex_lock_nested(m, subclass);
> -	reiserfs_write_lock(s);
> +	int depth;
> +	struct buffer_head *bh;
> +
> +	depth = reiserfs_write_unlock_nested(s);
> +	bh = sb_bread(s, block);
> +	reiserfs_write_lock_nested(s, depth);
> +
> +	return bh;
>  }
>
> +void reiserfs_safe_lock_buffer(struct buffer_head *bh);
> +
>  static inline void
> -reiserfs_down_read_safe(struct rw_semaphore *sem, struct super_block *s)
> +reiserfs_safe_wait_on_buffer(struct buffer_head *bh, struct super_block *s)
>  {
> -	reiserfs_lock_check_recursive(s);
> -	reiserfs_write_unlock(s);
> -	down_read(sem);
> -	reiserfs_write_lock(s);
> -}
> +	int depth;
>  
> -/*
> - * When we schedule, we usually want to also release the write lock,
> - * according to the previous bkl based locking scheme of reiserfs.
> - */
> -static inline void reiserfs_cond_resched(struct super_block *s)
> -{
> -	if (need_resched()) {
> -		reiserfs_write_unlock(s);
> -		schedule();
> -		reiserfs_write_lock(s);
> -	}
> +	depth = reiserfs_write_unlock_nested(s);
> +	__wait_on_buffer(bh);
> +	reiserfs_write_lock_nested(s, depth);
>  }
>  
>  struct fid;
> @@ -2463,6 +2472,15 @@ int reiserfs_commit_for_inode(struct ino
>  int reiserfs_inode_needs_commit(struct inode *);
>  void reiserfs_update_inode_transaction(struct inode *);
>  void reiserfs_wait_on_write_block(struct super_block *s);
> +static inline void reiserfs_safe_wait_on_write_block(struct super_block *s)
> +{
> +	int depth;
> +
> +	depth = reiserfs_write_unlock_nested(s);
> +	reiserfs_wait_on_write_block(s);
> +	reiserfs_write_lock_nested(s, depth);
> +}
> +
  I didn't find where the above 'safe' functions are called...

								Honza
-- 
Jan Kara <jack@suse.cz>
SUSE Labs, CR
