From: Vitaly Fertman <vitaly@namesys.com>
Subject: Re: Bug in reiserfsck
Date: Tue, 13 Apr 2004 11:00:29 +0400
Message-ID: <200404131100.29679.vitaly@namesys.com>
References: <20040413000419.GA12988@Fifarafa.fifarafa>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-17882-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20040413000419.GA12988@Fifarafa.fifarafa>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Sebo <sebo@fifarafa.eu.org>, reiserfs-list@namesys.com

Hello, 

On Tuesday 13 April 2004 04:04, Sebo wrote:
>     Hi, I did bad ram and my file system crased. I did hreiserfsck
> --rebuild-tree and it was segfaul in pass1. I have been testing reiserfs
> 3.6.15-pre1 and this version also have this bug. This bug is fully
> recurrence and I can make more test for you. Thx for advice. Sebo.

did you fix you ram before testing reiserfsck?
did you recompile the progs after fixing the ram?
did you compile the progs on the same computer 
where you run reiserfsck ?

>     My system:
> 	Kernel 2.6.3
> 	Reiserfsprogs 3.6.15-pre1
>     Backtrace of bug:
>
> #0  0x4009ba55 in memmove () from /lib/libc.so.6
> No symbol table info available.
> #1  0x0806e5af in leaf_cut_entries (bh=0xfffffff0, ih=0x80e3328, from=32,
> del_count=1) at lbalance.c:849 item = 0x8135000 <Address 0x8135000 out of
> bounds>
>
>         prev_record_offset = 1073659064
>         prev_record = 0x80e4300 "mem_end"
>         cut_records_len = 32
>         i = -16
>         entry_count = 135483376
> #2  0x0806e858 in leaf_cut_from_buffer (fs=0x8090348, bi=0xbffffb90,
> cut_item_num=0, pos_in_item=2, cut_size=1) at lbalance.c:888
>         nr = 32
>         bh = (struct buffer_head *) 0x80e30e8
>         blkh = (struct block_head *) 0x80e3310
>         ih = (struct item_head *) 0x80e3328
>         last_loc = -48
>         unmoved_loc = -16
>         i = -16

-- 
Thanks,
Vitaly Fertman

