From: "Vladimir V. Saveliev" <vs@namesys.com>
Subject: Re: reiserfs_panic error.
Date: Thu, 08 Jul 2004 12:40:32 +0400
Message-ID: <40ED0880.3040505@namesys.com>
References: <20040707043718.GA10504@cbn.net.id>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-19553-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20040707043718.GA10504@cbn.net.id>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: kisanak@cbn.net.id
Cc: reiserfs-list@namesys.com

Hello

kisanak@cbn.net.id wrote:
> I just found this error in one of my box, I'm not sure wether it's an hardware 
> problem ( http://www.uwsg.iu.edu/hypermail/linux/kernel/0404.2/0251.html ) or
> just a bug (I still haven't investigate the hardware yet).
> 

You seem to have hardware problem. You see, kernel fails to write a 
block to disk.

> I use RH7,1 kernel 2.4.18 with reiserfsprogs 3.x.0k-pre8
> 

Please also upgrade kernel and reiserfsprogs 
(ftp://ftp.namesys.com/pub/reiserfsprogs/reiserfsprogs-3.6.17.tar.gz)

> Many Thanks.
> 
> journal-601, buffer write failed
> ------------[ cut here ]------------
> kernel BUG at fs/reiserfs/prints.c:339!
> invalid operand: 0000 [#1]
> CPU:    1
> EIP:    0060:[<c01ebe88>]    Not tainted
> EFLAGS: 00010286
> EIP is at reiserfs_panic+0x38/0x70
> eax: 00000024   ebx: f72f9c00   ecx: c03f0054   edx: 00000286
> esi: f8bdd398   edi: 00000000   ebp: 00000000   esp: f7a69dc8
> ds: 007b   es: 007b   ss: 0068
> Process pdflush (pid: 12, threadinfo=f7a68000 task=f7a7ece0)
> Stack: c03a009c c04db8e0 f8bdd398 f7809a80 c01f7c8e f72f9c00 c03afee0 00000000
>        00001000 00000003 00000006 00000004 00000000 db1289d4 00000000 0000003f
>        00000004 00000002 c01fc5a1 f72f9c00 f8bdd398 00000001 00001000 c01fae87
> Call Trace:
>  [<c01f7c8e>] flush_commit_list+0x30e/0x4b0
>  [<c01fc5a1>] do_journal_end+0x641/0xcd0
>  [<c01fae87>] do_journal_begin_r+0x267/0x2a0
>  [<c01fb7fc>] flush_old_commits+0x13c/0x1e0
>  [<c01e8a83>] reiserfs_write_super+0x93/0xb0
>  [<c016a60b>] sync_supers+0xcb/0xf0
>  [<c0148dde>] wb_kupdate+0x4e/0x140
>  [<c0120c83>] schedule+0x383/0x6f0
>  [<c0149509>] __pdflush+0x109/0x230
>  [<c0149630>] pdflush+0x0/0x20
>  [<c014963f>] pdflush+0xf/0x20
>  [<c0148d90>] wb_kupdate+0x0/0x140
>  [<c01092e4>] kernel_thread_helper+0x0/0xc
>  [<c01092e9>] kernel_thread_helper+0x5/0xc
> 
> Code: 0f 0b 53 01 55 56 3a c0 b8 68 52 3a c0 8d 93 24 01 00 00 85
>  <3>scsi0 (2:0): rejecting I/O to offline device
> 
> 
> 


