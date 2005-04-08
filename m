From: Alex Zarochentsev <zam@namesys.com>
Subject: Re: [patch 1/1] reiserfs: make resize option auto-get new device size
Date: Fri, 8 Apr 2005 12:10:47 +0400
Message-ID: <20050408081047.GX6211@backtop.namesys.com>
References: <20050408045553.278CA11B7FE@zion>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-23808-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <20050408045553.278CA11B7FE@zion>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: blaisorblade@yahoo.it
Cc: akpm@osdl.org, linux-kernel@vger.kernel.org, reiserfs-dev@namesys.com, reiserfs-list@namesys.com, mtk-manpages@gmx.net

Hi,

On Fri, Apr 08, 2005 at 06:55:50AM +0200, blaisorblade@yahoo.it wrote:
> 
> Cc: <reiserfs-dev@namesys.com>, <reiserfs-list@namesys.com>, <mtk-manpages@gmx.net>
> 
> It's trivial for the resize option to auto-get the underlying device size, while
> it's harder for the user. I've copied the code from jfs.
> 
> Since of the different reiserfs option parser (which does not use the superior
> match_token used by almost every other filesystem), I've had to use the
> "resize=auto" and not "resize" option to specify this behaviour. Changing the
> option parser to the kernel one wouldn't be bad but I've no time to do this
> cleanup in this moment.

do people really need it?

user-level utility reisize_reiserfs, being called w/o size argument,
calculates the device size and uses resize mount option with correct value. 

> Btw, the mount(8) man page should be updated to include this option. Cc the
> relevant people, please (I hope I cc'ed the right people).
> 
> Signed-off-by: Paolo 'Blaisorblade' Giarrusso <blaisorblade@yahoo.it>
> ---
> 
>  linux-2.6.11-paolo/fs/reiserfs/super.c |   21 ++++++++++++++-------
>  1 files changed, 14 insertions(+), 7 deletions(-)
> 
> diff -puN fs/reiserfs/super.c~reiserfs-resize-option-like-jfs-auto-get fs/reiserfs/super.c
> --- linux-2.6.11/fs/reiserfs/super.c~reiserfs-resize-option-like-jfs-auto-get	2005-04-07 20:37:58.000000000 +0200
> +++ linux-2.6.11-paolo/fs/reiserfs/super.c	2005-04-08 01:01:18.000000000 +0200
> @@ -889,12 +889,18 @@ static int reiserfs_parse_options (struc
>  	    char * p;
>  	    
>  	    p = NULL;
> -	    /* "resize=NNN" */
> -	    *blocks = simple_strtoul (arg, &p, 0);
> -	    if (*p != '\0') {
> -		/* NNN does not look like a number */
> -		reiserfs_warning (s, "reiserfs_parse_options: bad value %s", arg);
> -		return 0;
> +	    /* "resize=NNN" or "resize=auto" */
> +
> +	    if (!strcmp(arg, "auto")) {
> +		    /* From JFS code, to auto-get the size.*/
> +		    *blocks = s->s_bdev->bd_inode->i_size >> s->s_blocksize_bits;
> +	    } else {
> +		    *blocks = simple_strtoul (arg, &p, 0);
> +		    if (*p != '\0') {
> +			/* NNN does not look like a number */
> +			reiserfs_warning (s, "reiserfs_parse_options: bad value %s", arg);
> +			return 0;
> +		    }
>  	    }
>  	}
>  
> @@ -903,7 +909,8 @@ static int reiserfs_parse_options (struc
>  		unsigned long val = simple_strtoul (arg, &p, 0);
>  		/* commit=NNN (time in seconds) */
>  		if ( *p != '\0' || val >= (unsigned int)-1) {
> -			reiserfs_warning (s, "reiserfs_parse_options: bad value %s", arg);			return 0;
> +			reiserfs_warning (s, "reiserfs_parse_options: bad value %s", arg);
> +			return 0;
>  		}
>  		*commit_max_age = (unsigned int)val;
>  	}
> _

-- 
Alex.
