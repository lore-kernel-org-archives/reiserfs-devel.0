From: Jan Kara <jack@suse.cz>
Subject: Re: [PATCH v2 14/92] reiserfs: convert to simple_rename_timestamp
Date: Thu, 6 Jul 2023 12:32:08 +0200
Message-ID: <20230706103208.3jwhlip4a6k7vzat@quack3>
References: <20230705185755.579053-1-jlayton@kernel.org>
 <20230705190309.579783-1-jlayton@kernel.org>
 <20230705190309.579783-12-jlayton@kernel.org>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
        t=1688639528; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=5GDhkv7kVU4fNDOWU2jUTGmYrtvjheK+E+ZD1vYsxzM=;
        b=R9dHok45Mfsd5AWQ5TKGFvH2lkRTzakQXx0Vme3cIW+e4NlWPDDhRdgN9ckkmOx+CBzm3i
        eAhKF4+HQ4y7lIXjMwO46Ukj0nnwYC+AIoTfg/XUrgHC6kKyr1oTFgSrprDhfAe7glNU1K
        Mimmblfj4o0AF4Kcm1ndxFX1Y40dAL0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
        s=susede2_ed25519; t=1688639528;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=5GDhkv7kVU4fNDOWU2jUTGmYrtvjheK+E+ZD1vYsxzM=;
        b=7V3m9xu1p3gDi+wXxP4ZbdybM6Rkfnxq3Ex/ZAA0dEbLTWOj7v5c/+HdS6a2I9kxAzQ88Q
        QKJi+3uX4+CuA1Dg==
Content-Disposition: inline
In-Reply-To: <20230705190309.579783-12-jlayton@kernel.org>
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jeff Layton <jlayton@kernel.org>
Cc: Christian Brauner <brauner@kernel.org>, Al Viro <viro@zeniv.linux.org.uk>, Jan Kara <jack@suse.cz>, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, reiserfs-devel@vger.kernel.org

On Wed 05-07-23 15:00:39, Jeff Layton wrote:
> Signed-off-by: Jeff Layton <jlayton@kernel.org>

Looks good. Feel free to add:

Reviewed-by: Jan Kara <jack@suse.cz>

								Honza

> ---
>  fs/reiserfs/namei.c | 7 +------
>  1 file changed, 1 insertion(+), 6 deletions(-)
> 
> diff --git a/fs/reiserfs/namei.c b/fs/reiserfs/namei.c
> index 52240cc891cf..405ac59eb2dd 100644
> --- a/fs/reiserfs/namei.c
> +++ b/fs/reiserfs/namei.c
> @@ -1325,7 +1325,6 @@ static int reiserfs_rename(struct mnt_idmap *idmap,
>  	int jbegin_count;
>  	umode_t old_inode_mode;
>  	unsigned long savelink = 1;
> -	struct timespec64 ctime;
>  
>  	if (flags & ~RENAME_NOREPLACE)
>  		return -EINVAL;
> @@ -1576,14 +1575,11 @@ static int reiserfs_rename(struct mnt_idmap *idmap,
>  
>  	mark_de_hidden(old_de.de_deh + old_de.de_entry_num);
>  	journal_mark_dirty(&th, old_de.de_bh);
> -	ctime = current_time(old_dir);
> -	old_dir->i_ctime = old_dir->i_mtime = ctime;
> -	new_dir->i_ctime = new_dir->i_mtime = ctime;
>  	/*
>  	 * thanks to Alex Adriaanse <alex_a@caltech.edu> for patch
>  	 * which adds ctime update of renamed object
>  	 */
> -	old_inode->i_ctime = ctime;
> +	simple_rename_timestamp(old_dir, old_dentry, new_dir, new_dentry);
>  
>  	if (new_dentry_inode) {
>  		/* adjust link number of the victim */
> @@ -1592,7 +1588,6 @@ static int reiserfs_rename(struct mnt_idmap *idmap,
>  		} else {
>  			drop_nlink(new_dentry_inode);
>  		}
> -		new_dentry_inode->i_ctime = ctime;
>  		savelink = new_dentry_inode->i_nlink;
>  	}
>  
> -- 
> 2.41.0
> 
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR
