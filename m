From: Jan Kara <jack@suse.cz>
Subject: Re: [PATCH] Re: memory leak in reiserfs_fill_super
Date: Mon, 16 Dec 2019 12:57:42 +0100
Message-ID: <20191216115741.GE22157@quack2.suse.cz>
References: <000000000000ab22f20599779d25@google.com>
 <dbad2a8f-5a58-ecb5-eec7-1d6ef90abaed@infradead.org>
Mime-Version: 1.0
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <dbad2a8f-5a58-ecb5-eec7-1d6ef90abaed@infradead.org>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Randy Dunlap <rdunlap@infradead.org>
Cc: syzbot <syzbot+1c6756baf4b16b94d2a6@syzkaller.appspotmail.com>, deepa.kernel@gmail.com, jack@suse.cz, jeffm@suse.com, jlayton@kernel.org, linux-kernel@vger.kernel.org, reiserfs-devel@vger.kernel.org, syzkaller-bugs@googlegroups.com, viro@zeniv.linux.org.uk

On Sat 14-12-19 15:12:57, Randy Dunlap wrote:
> From: Randy Dunlap <rdunlap@infradead.org>
> 
> fill_super() conditionally allocates a jdev string if "jdev=x"
> is specified.  put_super() should free that memory.
> 
> Reported-by: syzbot+1c6756baf4b16b94d2a6@syzkaller.appspotmail.com
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>

Thanks Randy but I've already sent a similar (and more complete) fix to this
bug as part of [1].

								Honza

[1] https://lore.kernel.org/linux-fsdevel/20191212105018.910-1-jack@suse.cz/

> ---
>  fs/reiserfs/super.c |    1 +
>  1 file changed, 1 insertion(+)
> 
> --- linux-next-20191213.orig/fs/reiserfs/super.c
> +++ linux-next-20191213/fs/reiserfs/super.c
> @@ -629,6 +629,7 @@ static void reiserfs_put_super(struct su
>  	reiserfs_write_unlock(s);
>  	mutex_destroy(&REISERFS_SB(s)->lock);
>  	destroy_workqueue(REISERFS_SB(s)->commit_wq);
> +	kfree(REISERFS_SB(s)->s_jdev);
>  	kfree(s->s_fs_info);
>  	s->s_fs_info = NULL;
>  }
> 
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR
