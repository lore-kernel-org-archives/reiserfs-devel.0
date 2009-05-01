From: Andi Kleen <andi@firstfloor.org>
Subject: Re: [PATCH 1/6] kill-the-BKL/reiserfs: release write lock on fs_changed()
Date: Fri, 01 May 2009 08:31:12 +0200
Message-ID: <878wlhpc5r.fsf@basil.nowhere.org>
References: <1241145862-21700-1-git-send-email-fweisbec@gmail.com>
	<1241145862-21700-2-git-send-email-fweisbec@gmail.com>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <1241145862-21700-2-git-send-email-fweisbec@gmail.com> (Frederic Weisbecker's message of "Fri,  1 May 2009 04:44:17 +0200")
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Frederic Weisbecker <fweisbec@gmail.com>
Cc: Ingo Molnar <mingo@elte.hu>, LKML <linux-kernel@vger.kernel.org>, Jeff Mahoney <jeffm@suse.com>, ReiserFS Development List <reiserfs-devel@vger.kernel.org>, Chris Mason <chris.mason@oracle.com>, Alexander Beregalov <a.beregalov@gmail.com>, Alessio Igor Bogani <abogani@texware.it>, Jonathan Corbet <corbet@lwn.net>, Alexander Viro <viro@zeniv.linux.org.uk>

Frederic Weisbecker <fweisbec@gmail.com> writes:
>
> diff --git a/include/linux/reiserfs_fs.h b/include/linux/reiserfs_fs.h
> index 6587b4e..397d281 100644
> --- a/include/linux/reiserfs_fs.h
> +++ b/include/linux/reiserfs_fs.h
> @@ -1302,7 +1302,13 @@ static inline loff_t max_reiserfs_offset(struct inode *inode)
>  #define get_generation(s) atomic_read (&fs_generation(s))
>  #define FILESYSTEM_CHANGED_TB(tb)  (get_generation((tb)->tb_sb) != (tb)->fs_gen)
>  #define __fs_changed(gen,s) (gen != get_generation (s))
> -#define fs_changed(gen,s) ({cond_resched(); __fs_changed(gen, s);})
> +#define fs_changed(gen,s)		\
> +({					\
> +	reiserfs_write_unlock(s);	\
> +	cond_resched();			\
> +	reiserfs_write_lock(s);		\

Did you try writing that 

    if (need_resched()) {               \
	reiserfs_write_unlock(s);	\
	cond_resched();			\  (or schedule(), but cond_resched does a loop)
	reiserfs_write_lock(s);		\
    }				

? That might give better performance under load because users will be better
batched and you don't release the lock unnecessarily in the unloaded case.

-Andi

-- 
ak@linux.intel.com -- Speaking for myself only.
