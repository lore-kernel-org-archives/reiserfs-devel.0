From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: [reiser4] Point
Date: Sat, 09 Aug 2008 00:47:44 +0400
Message-ID: <489CB0F0.8020806@gmail.com>
References: <558.1643-13003-1386678025-1217242012@post.cz>	 <488DD846.70002@gmail.com>	 <a08621850808040328o36ab4901m63a0d978a221e833@mail.gmail.com>	 <48971680.2010906@gmail.com>	 <a08621850808040757h2f421e38lc295fb54fc719687@mail.gmail.com>	 <4897333E.3030600@gmail.com> <a08621850808041457y2f30559ve104c2a86a5f9970@mail.gmail.com> <489B44FD.5000108@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <489B44FD.5000108@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Ryan Hope <rmh3093@gmail.com>
Cc: reiserfs-devel@vger.kernel.org

Ryan Hope wrote:
> Is this todo really done?

nop

>
> >> As in point 6. in todo list (pub.namesys.com/Reiser4/ToDo ) try to
> >> replace wake_up() with wake_up_process()
>
> There are still a few more wake_up()'s in the code, the following
> patch takes care of 2 of them.

 both are not obvious for me, review is needed..

Edward.

>
> diff --git a/fs/reiser4/entd.c b/fs/reiser4/entd.c
> index a164f5a..355548d 100644
> --- a/fs/reiser4/entd.c
> +++ b/fs/reiser4/entd.c
> @@ -218,7 +218,7 @@ void reiser4_leave_flush(struct super_block *super)
>  #endif
>      spin_unlock(&ent->guard);
>      if (wake_up_ent)
> -        wake_up(&ent->wait);
> +        wake_up_process(ent->tsk);
>  }
>
>  #define ENTD_CAPTURE_APAGE_BURST SWAP_CLUSTER_MAX
> @@ -304,7 +304,7 @@ int write_page_by_ent(struct page *page, struct
> writeback_control *wbc)
>      ent->nr_todo_reqs++;
>      list_add_tail(&rq.link, &ent->todo_list);
>      if (ent->nr_todo_reqs == 1)
> -        wake_up(&ent->wait);
> +        wake_up_process(ent->tsk);
>
>      spin_unlock(&ent->guard);
>
>
> -- 
> To unsubscribe from this list: send the line "unsubscribe
> reiserfs-devel" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>

