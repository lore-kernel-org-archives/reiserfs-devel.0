From: Edward Shishkin <edward@namesys.com>
Subject: Re: Segfault mounting a reiserfs 3.6 partition
Date: Thu, 19 Oct 2006 13:45:39 +0400
Message-ID: <45374943.5050009@namesys.com>
References: <200610190903.43896.greisberger@zenon-media.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-30074-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200610190903.43896.greisberger@zenon-media.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: greisberger@zenon-media.net
Cc: reiserfs-list@namesys.com

Hello.
would you please upgrade your kernel to the latest stable version (2.6.18)
and try to mount again.

Thanks,
Edward.
 

Christophe Greisberger wrote:

>Hi,
>
>I have a strange problem with a partition w/ reiserfs.
>After a power loss, the partition has been damaged in a way reiserfs doesn't 
>seem to handle correctly. When mounting the partition, there is a segfault.
>The original system was a SuSE 8.0 (kernel 2.4.20)
>I did a 'reiserfsck --check ' , then a 'reiserfsck --fix-fixable' : no 
>errors found/fixed.
>I then tried 'reiserfsck --rebuild-sb' and 'reiserfsck --rebuild-tree' : 
>some errors fixed, still segfaulting.
>Finally, 'reiserfsck --clean-attributes' : no errors found, still 
>segfaulting.
>
>I then tried with a recent SuSE live CD (10.0 - kernel 2.6.13) : same error.
>
>Finally, I used sysresccd (kernel 2.6.16.10)  to save & restore the 
>partition with partimage, hoping that it would rebuild a clean partition.
>-The save was ok.
>-I then reformatted the partition with r/w check - ok.
>-The restoration worked.
>I then tried to mount the partition : still the same error. Damn!
>
>Here the error :
>----------8<----------
># mount /dev/sda4 /mnt/temp1
>ReiserFS: sda4: found reiserfs format "3.6" with standard journal
>ReiserFS: sda4: using ordered data mode
>ReiserFS: sda4: journal params: device sda4, size 8192, journal first block 
>18, max trans len 1024,
>max batch 900, max commit age 30, max trans age 30
>ReiserFS: sda4: checking transaction log (sda4)
>ReiserFS: sda4: Using r5 hash to sort names
>------------[ cut here ]------------
>kernel BUG at fs/reiserfs/journal.c:3168!
>invalid opcode: 0000 [#1]
>Modules linked in: i2c_nforce2 yellowfin via_velocity typhoon tg3 sungem_phy 
>sundance starfire slip
>slhc skge sis900 sis190 shaper s2io plip pcnet32 ns83820 ne3210 ne2k_pci 
>natsemi hp100 hamachi fealnx epic100 eepro100 dl2k dgrs depca cassini bnx2 
>b44 amd8111e 8390 8139cp 3c59x 3c509
>CPU:    0
>EIP:    0060:[<c01a5c4d>]    Not tainted VLI
>EFLAGS: 00010246   (2.6.16.10-fd24 #1)
>EIP is at journal_mark_dirty+0x215/0x240
>eax: cfb5dc00   ebx: cfb5dc00   ecx: 00000002   edx: 00000000
>esi: d0061600   edi: cf073e08   ebp: e0df5000   esp: cf09ddc4
>ds: 007b   es: 007b   ss: 0068
>Process mount (pid: 4720, threadinfo=cf09c000 task=dfae4570)
>Stack: <0>00000002 00000000 cfb5dc00 ce7f5dac d0061600 d0061600 c019779c 
>cf09de1c
>       d0061600 cf073e08 00000000 cef17000 00000000 00000002 00000001 
>00000000
>       00000000 00000000 00000004 dfb875f0 cf09de74 c0367a02 d0061600 
>00000001
>Call Trace:
> [<c019779c>] reiserfs_fill_super+0x58c/0x664
> [<c0367a02>] snprintf+0x16/0x1c
> [<c014d8d7>] get_sb_bdev+0xbb/0x114
> [<c036842e>] strncpy_from_user+0x2e/0x4c
> [<c016016c>] copy_mount_options+0x44/0xa0
> [<c016061c>] sys_mount+0x74/0xb0
> [<c0102ce9>] syscall_call+0x7/0xb
>Code: 8b 45 30 50 68 fc bd 6c c0 56 e8 bb 2d ff ff 83 c4 0c b8 01 00 00 00 
>eb b3 50 52 68 40 be 6c c0 8b 54 24 28 ff 32 e8 4f 2e ff ff <0f> 0b 60 0c 
>72 cd 6b c0 e9 0d fe ff ff 52 68 7c be 6c c0 8b 44
> Badness in do_exit at kernel/exit.c:802
> [<c0115af1>] do_exit+0x34d/0x358
> [<c01035ac>] do_trap+0x0/0xd4
> [<c0103828>] do_invalid_op+0x0/0x88
> [<c01038a2>] do_invalid_op+0x7a/0x88
> [<c0110907>] __wake_up_common+0x27/0x4c
> [<c01a5c4d>] journal_mark_dirty+0x215/0x240
> [<c067b395>] schedule+0x2dd/0x5d0
> [<c067bbb7>] cond_resched+0x37/0x50
> [<c01a5592>] do_journal_begin_r+0x56/0x2b8
> [<c0102f13>] error_code+0x4f/0x54
> [<c01a5c4d>] journal_mark_dirty+0x215/0x240
> [<c019779c>] reiserfs_fill_super+0x58c/0x664
> [<c0367a02>] snprintf+0x16/0x1c
> [<c014d8d7>] get_sb_bdev+0xbb/0x114
> [<c01980aa>] get_super_block+0x1a/0x20
> [<c0197210>] reiserfs_fill_super+0x0/0x664
> [<c014da8c>] do_kern_mount+0x3c/0x98
> [<c015fe02>] do_new_mount+0x62/0xa8
> [<c0160357>] do_mount+0x18f/0x1bc
> [<c036842e>] strncpy_from_user+0x2e/0x4c
> [<c016016c>] copy_mount_options+0x44/0xa0
> [<c016061c>] sys_mount+0x74/0xb0
> [<c0102ce9>] syscall_call+0x7/0xb
>Segmentation fault
>----------8<----------
>
>I also googled a while, but I only found a post (was in 2005 I think), with 
>the same error, but to which nobody answered.
>
>An idea someone?
>
>  
>

