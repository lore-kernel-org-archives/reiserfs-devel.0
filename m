From: Ingo Molnar <mingo@elte.hu>
Subject: Re: [PATCH] reiserfs: kill-the-BKL
Date: Tue, 7 Apr 2009 15:40:17 +0200
Message-ID: <20090407134017.GA20556@elte.hu>
References: <1239070789-13354-1-git-send-email-fweisbec@gmail.com>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1239070789-13354-1-git-send-email-fweisbec@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Frederic Weisbecker <fweisbec@gmail.com>
Cc: LKML <linux-kernel@vger.kernel.org>, Jeff Mahoney <jeffm@suse.com>, Peter Zijlstra <a.p.zijlstra@chello.nl>, ReiserFS Development List <reiserfs-devel@vger.kernel.org>, Bron Gondwana <brong@fastmail.fm>, Andrew Morton <akpm@linux-foundation.org>, Linus Torvalds <torvalds@linux-foundation.org>, Alexander Viro <viro@zeniv.linux.org.uk>


* Frederic Weisbecker <fweisbec@gmail.com> wrote:

> +/*
> + * Utility function to force a BUG if it is called without the superblock
> + * write lock held.  caller is the string printed just before calling BUG()
> + */
> +void reiserfs_check_lock_depth(struct super_block *sb, char *caller)
> +{
> +	struct reiserfs_sb_info *sb_i = REISERFS_SB(sb);
> +
> +	if (sb_i->lock_depth < 0)
> +		reiserfs_panic(sb, "%s called without kernel lock held %d",
> +			       caller);

s/kernel lock/sb write lock/

> +	reiserfs_write_unlock(s);
> +	mutex_destroy(&REISERFS_SB(s)->lock);
>  	kfree(s->s_fs_info);
>  	s->s_fs_info = NULL;

ah, mutex_destroy() - it's a small detail but still nice ;-)

Anyway, it still looks good to me, after the earlier patch i 
reviewed. Would be nice to have the testing feedback of reiserfs 
users, and the locking review from anyone who knows this code.

	Ingo
