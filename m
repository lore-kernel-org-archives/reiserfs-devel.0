From: Linux Tard <linuxtard@yahoo.com>
Subject: Re: Trying to mount ReiserFS file system read only results in change
Date: Thu, 22 Dec 2005 12:43:21 -0800 (PST)
Message-ID: <20051222204321.639.qmail@web34606.mail.mud.yahoo.com>
References: <43A7F3A0.6010004@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-list-return-27485-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <43A7F3A0.6010004@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "Vladimir V. Saveliev" <vs@namesys.com>
Cc: reiserfs-list@namesys.com, Chris Mason <mason@suse.com>, Jeff Mahoney <jeffm@suse.com>

Hi Vladimar,

Thank you again.  

--- "Vladimir V. Saveliev" <vs@namesys.com> wrote:
> I do not think that this is  a good way.
> 

Why is this?  Is there something else other than
preventing journal increment this would do?  Again, we
use this kernel only in certain situations.

> I would propose the following patch.
>  
>  fs/reiserfs/journal.c |    1 +
>  1 files changed, 1 insertion(+)
> 
> diff -puN
>
fs/reiserfs/journal.c~reiserfs-dont-update-journla-header-mounting-readonly
> fs/reiserfs/journal.c
> ---
>
linux-2.6.15-rc5-mm3/fs/reiserfs/journal.c~reiserfs-dont-update-journla-header-mounting-readonly
> 2005-12-20 13:09:28.000000000 +0300
> +++ linux-2.6.15-rc5-mm3-vs/fs/reiserfs/journal.c
> 2005-12-20 13:10:51.000000000 +0300
> @@ -2458,6 +2458,7 @@ static int journal_read(struct
> super_blo
>  			      replay_count, get_seconds() - start);
>  	}
>  	if (!bdev_read_only(p_s_sb->s_bdev) &&
> +	    !(p_s_sb->s_flags & MS_RDONLY) &&
>  	    _update_journal_header_block(p_s_sb,
> journal->j_start,
>  					 journal->j_last_flush_trans_id)) {
>  		/* replay failed, caller must call
> free_journal_ram and abort

We not able to test this patch.  We're using 2.4.32
kernel.  Output of patch;

[root@dumb linux-2.4.32]# patch -p1 <
reiserfs_dont_update_journla_header_mounting_readonly.patch
 --dry-run
patching file fs/reiserfs/journal.c
Hunk #1 FAILED at 2458.
1 out of 1 hunk FAILED -- saving rejects to file
fs/reiserfs/journal.c.rej
[root@dumb linux-2.4.32]#

And the REJ file;

[root@dumb reiserfs]# more journal.c.rej 
***************
*** 2458,2463 ****
                              replay_count,
get_seconds() - start);
        }
        if (!bdev_read_only(p_s_sb->s_bdev) &&
            _update_journal_header_block(p_s_sb,
journal->j_start,
                                        
journal->j_last_flush_trans_id)) {
                /* replay failed, caller must call
free_journal_ram and abort
--- 2458,2464 ----
                              replay_count,
get_seconds() - start);
        }
        if (!bdev_read_only(p_s_sb->s_bdev) &&
+           !(p_s_sb->s_flags & MS_RDONLY) &&
            _update_journal_header_block(p_s_sb,
journal->j_start,
                                        
journal->j_last_flush_trans_id)) {
                /* replay failed, caller must call
free_journal_ram and abort
[root@dumb reiserfs]#





I'm guessing you made patch for 2.6 kernel?  Or
failure for some other reason?  
We have to use 2.4 series kernel now.  Would you be
able to write this patch for 2.4 kernel if it was for
2.6?

kind regards,
-lt



	
		
__________________________________ 
Yahoo! for Good - Make a difference this year. 
http://brand.yahoo.com/cybergivingweek2005/
