From: "Xu CanHao" <xucanhao@gmail.com>
Subject: Re: Reiser4 performance bottlenecks and possible solutions
Date: Fri, 8 Jun 2007 08:22:55 +0800
Message-ID: <6ec7a4340706071722p64f4acd9n647941b32916a300@mail.gmail.com>
References: <214131.49556.qm@web31706.mail.mud.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: a=rsa-sha1; c=relaxed/relaxed;
        d=gmail.com; s=beta;
        h=domainkey-signature:received:received:message-id:date:from:to:subject:in-reply-to:mime-version:content-type:content-transfer-encoding:content-disposition:references;
        b=ZeY6sEmR4JAT/fcrG5dKPay8NhJlsSjm4CD7grq4jmVG6fZOpbrWAqs1HWdy0qGxrmtApQCohdEMe0FdK34S47eUvJlCegGZsEUDewtHz2QwP/BydS5b/ZosH1v/o0KjPPCm/71IG0QvnfNZUID0F5ixdb3y8YELuP+4Ppf996Q=
In-Reply-To: <214131.49556.qm@web31706.mail.mud.yahoo.com>
Content-Disposition: inline
Sender: reiserfs-devel-owner@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: reiserfs-devel@vger.kernel.org

Hello!

 You've got a good idea too.

Thanks!

2007/6/8, devsk <funtoos@yahoo.com>:
>
> > you may use "#mount /dev/sda1 /mnt/tmp -o fsync=10" which means "fsync
> > once when invoked fsync 10 times"
>
> or if 5 (may be use sys.vm.dirty_writeback_centisecs)
> seconds have elapsed since last fsync.
>
> -devsk
>
>
> ----- Original Message ----
> From: Xu CanHao <xucanhao@gmail.com>
> To: reiserfs-devel@vger.kernel.org
> Sent: Thursday, June 7, 2007 5:14:46 AM
> Subject: Reiser4 performance bottlenecks and possible solutions
>
>
> Hello!
>
> Since performance is one of the most important aspect of Reiser4, I
> indeed encountered some performance bottlenecks of Reiser4 during my
> daily usage. The following is my own(possibly wrong) experiences:
>
> 1, Tail-conversion/Extent-only
> May save space at a 5-10 percent, while impacts performance much more
> greater. Extent-only performs better.
>
> 2, read()...
> Old read_unix_file() is not efficient, especially in
> read_unix_file_container_tails(). So I think
> generic_file_read() is
> better for Extent-only users.
>
> 1+2, Extent-only + generic_file_read()
> During my benchmark, 1+2 provides 10%-400% better performance(varies
> with the benchmark utility)
>
> 3, fsync()
> Terrible fsync() performance has been talked for a thousand times
> without a full solution. I'm thinking of a temporary solution: adding
> a mount option and let the user determine the fsync() frequency(yes,
> you may lose data when power-fail), things like:
>
> int sync_unix_file(struct file *file, struct dentry *dentry, int datasync)
> {
>       reiser4_context *ctx;
>       txn_atom *atom;
>       reiser4_block_nr reserve;
>       reiser4_super_info_data *sbinfo;
>
>       ctx = init_context(dentry->d_inode->i_sb);
>       if (IS_ERR(ctx))
>               return PTR_ERR(ctx);
>
>       sbinfo = get_current_super_private();
>       if (sbinfo->fsync == 0)
>       {
>               reiser4_exit_context(ctx);
>               return 0;
>       }
>       else if (sbinfo->fsync == 1)
>       {
> fsync_file:     reserve =
> estimate_update_common(dentry->d_inode);
>               if (reiser4_grab_space(reserve, BA_CAN_COMMIT)) {
>                       reiser4_exit_context(ctx);
>                       return RETERR(-ENOSPC);
>               }
>               write_sd_by_inode_common(dentry->d_inode);
>
>               atom = get_current_atom_locked();
>               spin_lock_txnh(ctx->trans);
>               force_commit_atom(ctx->trans);
>               reiser4_exit_context(ctx);
>               return 0;
>       }
>       else if (sbinfo->fsync > 1)
>       {
>               fsync_num++;
>               if (fsync_num >= sbinfo->fsync) {
>                       fsync_num = 0;
>                       goto fsync_file;
>               }
>               reiser4_exit_context(ctx);
>               return 0;
>       }
>       return 0;
> }
>
> you may use "#mount /dev/sda1 /mnt/tmp -o fsync=10" which means "fsync
> once when invoked fsync 10 times"
>
> 4, Relocation/Overwrite
> Should you take 1+2 the default value 64 of flush.relocate_threshold
> and flush.relocate_distance may not suitable, a lower value maybe
> better for most case.
>
> 1+2+3+4
> If you take all of them, the performance gain would be dramatically
> and still as stable as before, at least for my months of experience.
>
> Thanks!
> -
> To unsubscribe from this list: send the line "unsubscribe reiserfs-devel" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at
> http://vger.kernel.org/majordomo-info.html
>
>
>  ________________________________
> Sucker-punch spam with award-winning protection.
>  Try the free Yahoo! Mail Beta.
