From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: git tree for reiser4 development
Date: Sun, 07 Nov 2010 22:25:23 +0100
Message-ID: <4CD71943.30808@gmail.com>
References: <201011071538.44063.a.miskiewicz@gmail.com> <201011071639.23764.a.miskiewicz@gmail.com> <4CD6CBDD.9020802@gmail.com> <201011072156.36359.a.miskiewicz@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from
         :user-agent:mime-version:to:cc:subject:references:in-reply-to
         :content-type:content-transfer-encoding;
        bh=YpAVEFSu3b8nSpuHdpmUfsVy23ijWQkJUxG+dYRIyMI=;
        b=lkjvnDO7aQvxtNXSDGAHC/8vSHPXfKKsdq0sXq5N49DELxGFpv3unN2uavVegKmXBM
         XLZJQSRAD9y4Sjzt/VXVGypzoIQgdMC2BRactafHULA4NXqeYorY8AIUS88XXrP98Ixy
         An8cLESoRqNHv7LDVfReSCzkyg0VABzFdAMnw=
In-Reply-To: <201011072156.36359.a.miskiewicz@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Arkadiusz Miskiewicz <a.miskiewicz@gmail.com>
Cc: reiserfs-devel@vger.kernel.org

Arkadiusz Miskiewicz wrote:
> On Sunday 07 of November 2010, Edward Shishkin wrote:
>
>   
>>> Was looking for something newer - close to 2.6.36
>>>       
>> reiser4-for-2.6.36 stuff is not yet ready.
>>     
>
> Dirty, untested change for .35 patch ... I assume "real" update needs more than this?
>   

Yes, much more:
reiser4-for-2.6.35 stuff works incorrectly.
->write_end() methods of both file plugins should be fixed.
Also reiser4 needs a ->sync_fs() method of super operations.
I am working on this at my spare time.

Edward.

> Index: kernel-reiser4.patch
> ===================================================================
> RCS file: /cvsroot/packages/kernel/kernel-reiser4.patch,v
> retrieving revision 1.13
> retrieving revision 1.14
> diff -u -u -r1.13 -r1.14
> --- kernel-reiser4.patch	5 Aug 2010 19:52:26 -0000	1.13
> +++ kernel-reiser4.patch	7 Nov 2010 18:25:45 -0000	1.14
> @@ -40016,7 +40016,7 @@
>  diff -urN linux-2.6.35.orig/fs/reiser4/plugin/inode_ops.c linux-2.6.35/fs/reiser4/plugin/inode_ops.c
>  --- linux-2.6.35.orig/fs/reiser4/plugin/inode_ops.c	1970-01-01 01:00:00.000000000 +0100
>  +++ linux-2.6.35/fs/reiser4/plugin/inode_ops.c	2010-08-04 15:44:57.000000000 +0200
> -@@ -0,0 +1,906 @@
> +@@ -0,0 +1,916 @@
>  +/*
>  + * Copyright 2005 by Hans Reiser, licensing governed by reiser4/README
>  + */
> @@ -40479,9 +40479,19 @@
>  +				return result;
>  +			}
>  +		}
> -+		result = inode_setattr(inode, attr);
> -+		if (!result)
> ++
> ++		if ((attr->ia_valid & ATTR_SIZE) &&
> ++		    attr->ia_size != i_size_read(inode))
> ++			result = vmtruncate(inode, attr->ia_size);
> ++			if (result)
> ++				goto result_error;
> ++		setattr_copy(inode, attr);
> ++		mark_inode_dirty(inode);
> ++		result = 0;
> ++result_error:
> ++		if (!result) {
>  +			reiser4_update_sd(inode);
> ++		}
>  +	}
>  +
>  +	context_set_commit_async(ctx);
> @@ -56458,7 +56468,7 @@
>  +	.read = reiser4_read_careful,
>  +	.write = reiser4_write_careful,
>  +	.aio_read = generic_file_aio_read,
> -+	.ioctl = reiser4_ioctl_careful,
> ++	.unlocked_ioctl = reiser4_ioctl_careful,
>  +	.mmap = reiser4_mmap_careful,
>  +	.open = reiser4_open_careful,
>  +	.release = reiser4_release_careful,
> @@ -65466,7 +65476,7 @@
>  +
>  +	truncate_inode_pages(&inode->i_data, 0);
>  +	inode->i_blocks = 0;
> -+	clear_inode(inode);
> ++	end_writeback(inode);
>  +	reiser4_exit_context(ctx);
>  +}
>  +
> @@ -65726,11 +65736,11 @@
>  +	.alloc_inode = reiser4_alloc_inode,
>  +	.destroy_inode = reiser4_destroy_inode,
>  +	.dirty_inode = reiser4_dirty_inode,
> -+	.delete_inode = reiser4_delete_inode,
> ++	.evict_inode = reiser4_delete_inode,
>  +	.put_super = reiser4_put_super,
>  +	.write_super = reiser4_write_super,
>  +	.statfs = reiser4_statfs,
> -+	.clear_inode = reiser4_clear_inode,
> ++//	.clear_inode = reiser4_clear_inode,
>  +	.writeback_inodes = reiser4_writeback_inodes,
>  +	.show_options = reiser4_show_options
>  +};
>
>
>   
>> Thanks,
>> Edward.
>>     
>
>
>   

