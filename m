From: Hamish Rodda <rodda@kde.org>
Subject: Oops with reiser4 on x86_64
Date: Wed, 25 Aug 2004 20:34:22 +1000
Message-ID: <200408252034.22827.rodda@kde.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-20496-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

Hi,

I just started using reiser4 on my AMD x86_64 computer running debian pure64 
and a custom compiled 2.6.8.1-mm4 kernel, with reiser4 compiled in but no 
debugging.  I got an oops while copying 6G of smallish files using cpio (5G 
was completed); fsck reports "FS is consistent", I haven't tried to reproduce 
the problem yet.  I realise reiser4 is only tested on i386 so far but I 
thought you might be interested anyway:

Unable to handle kernel paging request at ffffff006090c7cc RIP: 
<ffffffff8021e8b1>{load_and_lock_bnode+17}
PML4 622063 PGD 0 
Oops: 0000 [1] PREEMPT 
CPU 0 
Modules linked in: ds yenta_socket pcmcia_core thermal fan button processor ac 
battery 8139too mii crc32 snd_intel8x0 snd_ac97_codec snd_mpu401_uart 
ehci_hcd
Pid: 28307, comm: ent:dm-4! Not tainted 2.6.8.1-mm4
RIP: 0010:[<ffffffff8021e8b1>] <ffffffff8021e8b1>{load_and_lock_bnode+17}
RSP: 0018:0000010007ad3678  EFLAGS: 00010216
RAX: 000001000a41c3a0 RBX: ffffff006090c7a0 RCX: 0000000000000001
RDX: 0000000000000700 RSI: 0000010007ad3734 RDI: ffffff006090c7a0
RBP: 000000000000001f R08: 000000000000001f R09: 00000000ffffffff
R10: 0000010007ad3724 R11: 0000000000000000 R12: 0000000000007fe0
R13: 0000000000000700 R14: ffffff006090c7a0 R15: 0000010007ad3860
FS:  0000002a97d84380(0000) GS:ffffffff8061e5c0(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 000000008005003b
CR2: ffffff006090c7cc CR3: 0000000000101000 CR4: 00000000000006e0
Process ent:dm-4! (pid: 28307, threadinfo 0000010007ad2000, task 
000001000870d800)
Stack: 0000000000000000 0000000000000000 0000010007ad3688 0000010007ad3778 
       000000000000001f ffffffff8021ea3c 0000010007ad3720 0000010007ad35b8 
       0000000007ad36b8 000000010000001f 
Call Trace:<ffffffff8021ea3c>{search_one_bitmap_forward+92} 
<ffffffff8021ed3f>{bitmap_alloc_forward+207} 
       <ffffffff8021eed8>{alloc_blocks_forward+136} 
<ffffffff801e61b1>{reiser4_alloc_blocks+145} 
       <ffffffff80215b2a>{extent_allocate_blocks+58} 
<ffffffff80216d78>{squalloc_extent+376} 
       <ffffffff802074cc>{plugin_by_coord_node40+44} 
<ffffffff801ec000>{squeeze_right_twig+96} 
       <ffffffff8020f349>{down_link_internal+9} 
<ffffffff801ec2dd>{squeeze_right_twig_and_advance_coord+29} 
       <ffffffff801ecb65>{handle_pos_end_of_twig+213} 
<ffffffff801ed080>{handle_pos_to_twig+240} 
       <ffffffff801ed0cc>{squalloc+28} <ffffffff801eb453>{jnode_flush+739} 
       <ffffffff801eb812>{flush_current_atom+626} 
<ffffffff801e808b>{flush_some_atom+731} 
       <ffffffff801fdaa7>{entd_flush+103} <ffffffff801fd77a>{entd+426} 
       <ffffffff801107c3>{child_rip+8} <ffffffff801fd5d0>{entd+0} 
       <ffffffff801107bb>{child_rip+0} 

Code: 8b 47 2c 85 c0 74 0f ff 0f 0f 88 3f 0d 00 00 31 c0 e9 eb 00 
RIP <ffffffff8021e8b1>{load_and_lock_bnode+17} RSP <0000010007ad3678>
CR2: ffffff006090c7cc

Hope it helps, let me know if there is anything else you'd like.

Cheers,
Hamish.
(Please CC me)
