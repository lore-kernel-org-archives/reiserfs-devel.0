From: Eric Sandeen <sandeen@redhat.com>
Subject: Re: [PATCH 1/2] ext3: make ext3 mount default to barrier=1
Date: Mon, 11 Jul 2011 19:16:06 -0500
Message-ID: <4E1B9246.3060507@redhat.com>
References: <20110711182532.GA12099@infradead.org> <20110711182558.GB12099@infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-ext4-owner@vger.kernel.org>
In-Reply-To: <20110711182558.GB12099@infradead.org>
Sender: linux-ext4-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Christoph Hellwig <hch@infradead.org>
Cc: viro@zeniv.linux.org.uk, jeffm@suse.com, chris.mason@oracle.com, jack@suse.cz, reiserfs-devel@vger.kernel.org, linux-ext4@vger.kernel.org, linux-fsdevel@vger.kernel.org

On 7/11/11 1:25 PM, Christoph Hellwig wrote:
> From: Chris Mason <mason@suse.com>
> 
> This patch turns on barriers by default for ext3.  mount -o barrier=0
> will turn them off.
> 
> Acked-by: Jeff Mahoney <jeffm@suse.com>
> 
> Index: linux-2.6/fs/ext3/super.c
> ===================================================================
> --- linux-2.6.orig/fs/ext3/super.c	2011-06-30 21:19:37.389544975 +0200
> +++ linux-2.6/fs/ext3/super.c	2011-07-02 13:56:51.877784292 +0200
> @@ -1718,6 +1718,8 @@ static int ext3_fill_super (struct super
>  	sbi->s_resuid = le16_to_cpu(es->s_def_resuid);
>  	sbi->s_resgid = le16_to_cpu(es->s_def_resgid);
>  
> +	/* enable barriers by default */
> +	set_opt(sbi->s_mount_opt, BARRIER);
>  	set_opt(sbi->s_mount_opt, RESERVATION);
>  
>  	if (!parse_options ((char *) data, sb, &journal_inum, &journal_devnum,

Thank you, I hope it will get upstream THIS time ;)

As Jan said, despite uptream rejection last time, RHEL6 and SuSE have made this change anyway, because it's the Right Thing To Do.

Acked-by: Eric Sandeen <sandeen@redhat.com>

-Eric
