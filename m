From: <mysql.jorge@decimal.pt>
Subject: Re: Reiser4 for Linux-2.6.31
Date: Mon, 05 Oct 2009 17:40:38 +0100
Message-ID: <2ec5eacc8b8d390ee6bcf88045837ba5@192.168.1.222>
References: <4AC947C6.40005@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <4AC947C6.40005@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Edward Shishkin <edward.shishkin@gmail.com>
Cc: ReiserFS Development List <reiserfs-devel@vger.kernel.org>

Howdy Edward,

To when reiserfs4 included on the main kernel?

Jorge,


On Mon, 05 Oct 2009 03:11:34 +0200, Edward Shishkin
<edward.shishkin@gmail.com> wrote:
> Hello everyone.
> 
> This includes a fixup for a rather old bug:
> Reiser4 stepped to the journal code of other journalling
> file systems.
> Typical symptoms:
> . ReiserFS complaints:
> "clm-2100", nesting info a different FS".
> . Ext3 complaints:
> "called recursively, non-PF_MEMALLOC"
> example of Call Trace:
>  [<c0535873>] ext3_write_inode+0x1e/0x3a
>  [<c04b16bc>] __writeback_single_inode+0x193/0x2ad
>  [<c0508d86>] ? flush_some_atom+0x427/0x44d
>  [<c04b1bb5>] ? generic_sync_sb_inodes+0x27c/0x338
>  [<c04b1b68>] generic_sync_sb_inodes+0x22f/0x338
>  [<c04b1c8e>] sync_sb_inodes+0x1d/0x20
>  [<c04b1e1e>] writeback_inodes+0x79/0xb9
>  [<c047c76a>] balance_dirty_pages_ratelimited_nr+0x119/0x21d
>  [<c0504803>] reiser4_exit_context+0x5f/0xf6
>  [<c051e5a3>] reiser4_write_careful+0x3ba/0x3cc
>  [<c049bc3c>] ? do_sync_read+0xab/0xe9
>  [<c0613dae>] ? selinux_file_permission+0x44/0x48
>  [<c060fea6>] ? security_file_permission+0xf/0x11
>  [<c051e1e9>] ? reiser4_write_careful+0x0/0x3cc
>  [<c049c494>] vfs_write+0x84/0xdf
>  [<c049c588>] sys_write+0x3b/0x60
>  [<c0403178>] sysenter_do_call+0x12/0x2d
> 
> Other changes since 2.6.30:
> . Fix compile warnings (prepared by Brandon Berhent);
> . Address a compiler complaints about large frame size
>   of reiser4_init_super_data() when building for x86_64.
> 
> Please, find at
>
http://www.kernel.org/pub/linux/kernel/people/edward/reiser4/reiser4-for-2.6/
> 
> Thanks,
> Edward.
> 
> --
> To unsubscribe from this list: send the line "unsubscribe
reiserfs-devel"
> in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
