From: Frederic Weisbecker <fweisbec@gmail.com>
Subject: Re: [PATCH] reiserfs: Fix locking BUG during mount failure
Date: Mon, 29 Mar 2010 21:52:34 +0200
Message-ID: <20100329195232.GI5101@nowhere>
References: <4BB0FBA7.5080703@jeffreymahoney.com>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:received:date:from:to:cc
         :subject:message-id:references:mime-version:content-type
         :content-disposition:in-reply-to:user-agent;
        bh=YVtm/XUKFfUyX2z/N+Q48D34snoLEu7Fjd8aFRwYSZk=;
        b=Pne95vuhKC/IVJFRFkrtAHcxLMZuJGOOZheJzXLhMKp2QiYfYhnEc+udcab1ACZiV7
         UcDaKaeS/36OSrt4h3XFCwOI/mnL4e9pZ5Voh4K6Ilwq9ZBlfpz4PrsoQ4fAR83sSPAe
         Hiku9+5zQi4mz0+po4srWL/iSVR4HqwoOY/xQ=
Content-Disposition: inline
In-Reply-To: <4BB0FBA7.5080703@jeffreymahoney.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jeff Mahoney <jeffm@jeffreymahoney.com>
Cc: ReiserFS Mailing List <reiserfs-devel@vger.kernel.org>, Thomas Siedentopf <thomas.siedentopf@novell.com>, Andrew Morton <akpm@linux-foundation.org>

On Mon, Mar 29, 2010 at 03:12:39PM -0400, Jeff Mahoney wrote:
>  Commit 8ebc423238341b52912c7295b045a32477b33f09 (reiserfs: kill-the-BKL)
>  introduced a bug in the mount failure case.
> 
>  The error label releases the lock before calling journal_release_error,
>  but it requires that the lock be held. do_journal_release unlocks and
>  retakes it. When it releases it without it held, we trigger a BUG().
> 
>  The error_alloc label skips the unlock since the lock isn't held yet 
>  but none of the other conditions that are clean up exist yet either.
> 
>  This patch returns immediately after the kzalloc failure and moves
>  the reiserfs_write_unlock after the journal_release_error call.
> 
>  This was reported in https://bugzilla.novell.com/show_bug.cgi?id=591807
> 
> Reported-by:  Thomas Siedentopf <thomas.siedentopf@novell.com>
> Signed-off-by: Jeff Mahoney <jeffm@suse.com>
> Cc: Frederic Weisbecker <fweisbec@gmail.com>


I've applied it. Thanks a lot!



> ---
>  fs/reiserfs/super.c |   10 ++++------
>  1 file changed, 4 insertions(+), 6 deletions(-)
> 
> --- a/fs/reiserfs/super.c
> +++ b/fs/reiserfs/super.c
> @@ -1618,10 +1618,8 @@ static int reiserfs_fill_super(struct su
>  	save_mount_options(s, data);
>  
>  	sbi = kzalloc(sizeof(struct reiserfs_sb_info), GFP_KERNEL);
> -	if (!sbi) {
> -		errval = -ENOMEM;
> -		goto error_alloc;
> -	}
> +	if (!sbi)
> +		return -ENOMEM;
>  	s->s_fs_info = sbi;
>  	/* Set default values for options: non-aggressive tails, RO on errors */
>  	REISERFS_SB(s)->s_mount_opt |= (1 << REISERFS_SMALLTAIL);
> @@ -1881,12 +1879,12 @@ static int reiserfs_fill_super(struct su
>  	return (0);
>  
>  error:
> -	reiserfs_write_unlock(s);
> -error_alloc:
>  	if (jinit_done) {	/* kill the commit thread, free journal ram */
>  		journal_release_error(NULL, s);
>  	}
>  
> +	reiserfs_write_unlock(s);
> +
>  	reiserfs_free_bitmap_cache(s);
>  	if (SB_BUFFER_WITH_SB(s))
>  		brelse(SB_BUFFER_WITH_SB(s));

