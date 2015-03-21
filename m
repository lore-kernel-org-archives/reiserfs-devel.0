From: Josh Triplett <josh@joshtriplett.org>
Subject: Re: [PATCH] reiserfs: kstrdup() memory handling
Date: Sat, 21 Mar 2015 10:15:47 -0700
Message-ID: <20150321171547.GA5663@thin>
References: <1426957213-5508-1-git-send-email-sanidhya.gatech@gmail.com>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1426957213-5508-1-git-send-email-sanidhya.gatech@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Sanidhya Kashyap <sanidhya.gatech@gmail.com>
Cc: jack@suse.cz, jeffm@suse.com, akpm@linux-foundation.org, fabf@skynet.be, rashika.kheria@gmail.com, reiserfs-devel@vger.kernel.org, linux-kernel@vger.kernel.org, taesoo@gatech.edu, changwoo@gatech.edu, sanidhya@gatech.edu, blee@gatech.edu

On Sat, Mar 21, 2015 at 01:00:13PM -0400, Sanidhya Kashyap wrote:
> Checking for ENOMEM even for new_opts in reiserfs_remount function as
> there is a possibility of nothing being allocated.

You don't need to add a new label; kfree(NULL) is a no-op.

> Signed-off-by: Sanidhya Kashyap <sanidhya.gatech@gmail.com>
> ---
>  fs/reiserfs/super.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/fs/reiserfs/super.c b/fs/reiserfs/super.c
> index 71fbbe3..bf9bc66 100644
> --- a/fs/reiserfs/super.c
> +++ b/fs/reiserfs/super.c
> @@ -1397,6 +1397,11 @@ static int reiserfs_remount(struct super_block *s, int *mount_flags, char *arg)
>  	int i;
>  #endif
>  
> +	if (!new_opts) {
> +		err = -ENOMEM;
> +		goto out_err_no_kfree;
> +	}
> +
>  	sync_filesystem(s);
>  	reiserfs_write_lock(s);
>  
> @@ -1549,6 +1554,7 @@ out_err_unlock:
>  	reiserfs_write_unlock(s);
>  out_err:
>  	kfree(new_opts);
> +out_err_no_kfree:
>  	return err;
>  }
>  
> -- 
> 2.1.0
> 
