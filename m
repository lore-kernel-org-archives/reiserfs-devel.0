From: Peter Zelezny <peter.zelezny@dektech.com.au>
Subject: NULL pointer dereference in do_journal_end()
Date: Mon, 08 Dec 2014 10:40:31 +1100
Message-ID: <5484E56F.7080005@dektech.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=dektech.com.au;
	 h=content-transfer-encoding:content-type:content-type:subject
	:subject:mime-version:user-agent:from:from:date:date:message-id
	:received:received:received; s=mail_dkim; t=1417995636; bh=s4FJd
	pGdOjkI3RX9PCwokgofyl7HKmM+rq23Uvpn2XU=; b=XaZe6oZ80169ZxpqTImwW
	HYyphaLak2vR0+nPeo5RiwKyeBcq4cLAkrqpdYwlCtsh3sxly1dwB6TwXLjBPW7L
	tnNSuEltEdFtt6A01N5uYmtNf3Q8G6eTnNlbC3x+PifVmepF4Do50li+zyRiNIey
	FD3xD0mfPmULzEW4m+Rn5s=
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-devel@vger.kernel.org

Hi,

I've recently come across an instance (yes just one) of a crash inside
do_journal_end().
Unfortunately it's difficult to nail down the exact reiserfs version, as
it is a vendor patched kernel: SuSE SLES 11 SP3, which is based on linux
kernel 3.0.82.

I realise the information I have is a bit limited, and I don't know the
steps to reproduce, but I am hoping someone recognises this as an old or
familiar issue.

By my analyses (I could be mistaken), journal_getblk() returned NULL,
which then caused set_buffer_uptodate to crash. Does it ring any bells
for someone familiar with the source base?

Thanks for any insights,
-Peter.


---
        /* setup description block */
        d_bh =i
            journal_getblk(sb,
                           SB_ONDISK_JOURNAL_1st_BLOCK(sb) +
                           journal->j_start);   // journal_getblk
returned NULL.
        set_buffer_uptodate(d_bh);      // caused set_buffer_uptodate to
crash.


Call Trace:
2014-10-08 11:44:16  [176904.299346] RIP: 0010:[<ffffffffa00955e4>] 
[<ffffffffa00955e4>] do_journal_end+0x214/0xca0 [reiserfs]
...
2014-10-08 11:44:16  [176904.299346]  [<ffffffffa0083b60>]
reiserfs_sync_fs+0x60/0x80 [reiserfs]
2014-10-08 11:44:16  [176904.299346]  [<ffffffff8118e4c3>]
__sync_filesystem+0x53/0x90
2014-10-08 11:44:16  [176904.299346]  [<ffffffff8118e5a2>]
sync_filesystem+0x22/0x50
2014-10-08 11:44:16  [176904.299346]  [<ffffffff811986a6>]
fsync_bdev+0x26/0x60
2014-10-08 11:44:16  [176904.299346]  [<ffffffff81232493>]
blkdev_ioctl+0x4c3/0x710
2014-10-08 11:44:16  [176904.299346]  [<ffffffff81196755>]
block_ioctl+0x35/0x40
2014-10-08 11:44:16  [176904.299346]  [<ffffffff81173a0b>]
do_vfs_ioctl+0x8b/0x3b0
2014-10-08 11:44:16  [176904.299346]  [<ffffffff81173dd1>]
sys_ioctl+0xa1/0xb0
2014-10-08 11:44:16  [176904.299346]  [<ffffffff8145c012>]
system_call_fastpath+0x16/0x1b

Disassembly:
0000000000024400 <do_journal_end>:
...
   245f9:    48 8b 44 24 18           mov    0x18(%rsp),%rax
   245fe:    48 03 70 40              add    0x40(%rax),%rsi
   24602:    48 8b 41 18              mov    0x18(%rcx),%rax
   24606:    48 8b 78 18              mov    0x18(%rax),%rdi
   2460a:    e8 00 00 00 00           callq  2460f <do_journal_end+0x20f>
   2460f:    48 89 44 24 30           mov    %rax,0x30(%rsp)
   24614:    f0 80 08 01              lock orb $0x1,(%rax)           
    ; **** CRASH ****
   24618:    48 8b 50 28              mov    0x28(%rax),%rdx
   2461c:    31 f6                    xor    %esi,%esi
   2461e:    49 bc 52 65 49 73 45     movabs $0x424c724573496552,%r12 ;
memcpy(get_journal_desc_magic(d_bh), JOURNAL_DESC_MAGIC, 8);

