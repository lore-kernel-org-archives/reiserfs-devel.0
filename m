From: Chris Mason <chris.mason@oracle.com>
Subject: Re: [PATCH 1/2] ext3: make ext3 mount default to barrier=1
Date: Tue, 12 Jul 2011 09:24:47 -0400
Message-ID: <1310476587-sup-1581@shiny>
References: <20110711182532.GA12099@infradead.org> <20110711182558.GB12099@infradead.org>
Content-Transfer-Encoding: 8bit
Return-path: <linux-ext4-owner@vger.kernel.org>
In-reply-to: <20110711182558.GB12099@infradead.org>
Sender: linux-ext4-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
To: Christoph Hellwig <hch@infradead.org>
Cc: viro <viro@zeniv.linux.org.uk>, jeffm <jeffm@suse.com>, jack <jack@suse.cz>, reiserfs-devel <reiserfs-devel@vger.kernel.org>, linux-ext4 <linux-ext4@vger.kernel.org>, linux-fsdevel <linux-fsdevel@vger.kernel.org>

Excerpts from Christoph Hellwig's message of 2011-07-11 14:25:59 -0400:
> From: Chris Mason <mason@suse.com>
> 

Thanks for digging this out, you can toss in a sob for me.  Probably
best to give yourself credit in the from:, since you went to all the
trouble of diving in the vendor kernels.

Then again, if you're using the old email to try and throw Andrew off
our trail, go for it.

-chris

> This patch turns on barriers by default for ext3.  mount -o barrier=0
> will turn them off.
> 
> Acked-by: Jeff Mahoney <jeffm@suse.com>
> 
> Index: linux-2.6/fs/ext3/super.c
> ===================================================================
> --- linux-2.6.orig/fs/ext3/super.c    2011-06-30 21:19:37.389544975 +0200
> +++ linux-2.6/fs/ext3/super.c    2011-07-02 13:56:51.877784292 +0200
> @@ -1718,6 +1718,8 @@ static int ext3_fill_super (struct super
>      sbi->s_resuid = le16_to_cpu(es->s_def_resuid);
>      sbi->s_resgid = le16_to_cpu(es->s_def_resgid);
>  
> +    /* enable barriers by default */
> +    set_opt(sbi->s_mount_opt, BARRIER);
>      set_opt(sbi->s_mount_opt, RESERVATION);
>  
>      if (!parse_options ((char *) data, sb, &journal_inum, &journal_devnum,
