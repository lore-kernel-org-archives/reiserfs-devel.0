From: Andi Kleen <andi@firstfloor.org>
Subject: Re: [patch 32/35 code-cleanup] reiserfs: rename p_s_inode to inode
Date: Mon, 30 Mar 2009 20:50:27 +0200
Message-ID: <87tz5alua4.fsf@basil.nowhere.org>
References: <20090330180215.951354436@suse.com>
	<20090330181013.465420330@suse.com>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <20090330181013.465420330@suse.com> (Jeff Mahoney's message of "Mon, 30 Mar 2009 14:02:47 -0400")
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jeff Mahoney <jeffm@suse.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>, Linus Torvalds <torvalds@linux-foundation.org>, ReiserFS Development List <reiserfs-devel@vger.kernel.org>

Jeff Mahoney <jeffm@suse.com> writes:
>
> --- a/fs/reiserfs/file.c
> +++ b/fs/reiserfs/file.c
> @@ -137,17 +137,17 @@ static void reiserfs_vfs_truncate_file(s
>  static int reiserfs_sync_file(struct file *p_s_filp,
>  			      struct dentry *p_s_dentry, int datasync)
>  {
> -	struct inode *p_s_inode = p_s_dentry->d_inode;
> +	struct inode *inode = p_s_dentry->d_inode;
>  	int n_err;
>  	int barrier_done;

Didn't you miss one here?

-Andi


-- 
ak@linux.intel.com -- Speaking for myself only.
