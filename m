From: Nikita Danilov <Nikita@Namesys.COM>
Subject: Re: is this a known bug?
Date: Thu, 24 Jul 2003 14:46:02 +0400
Message-ID: <16159.47338.177850.21443@laputa.namesys.com>
References: <20030723235435.3C63E9C91@mail.animeslovenija.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-15023-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20030723235435.3C63E9C91@mail.animeslovenija.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: pegasus@nerv.eu.org
Cc: reiserfs mailing list <reiserfs-list@namesys.com>

pegasus@nerv.eu.org writes:
 > 
 > Again some RedHat advanced server fun, this time 2.4.9-e.24:

2.4.9 is very very old. A host of bugs was fixed since then.

We don't recommend anything earlier than 2.4.18. The later the better.

 > 
 > Jul 14 13:25:41 mai-stor2 kernel: kernel BUG at prints.c:334!
 > Jul 14 13:25:41 mai-stor2 kernel: invalid operand: 0000
 > Jul 14 13:25:41 mai-stor2 kernel: CPU:    1

Looks like it crashed in reiserfs_panic(). But then, there should have
been messages in the log. Can you check, please?

Is this reproducible, and if yes, then how?

This looks like journal-1413 bug, where space reserved in the
transaction for unlink wasn't enough due to file blocks located in too
many bitmaps. How large is block device?

journal-1413 is already fixed in newer kernels.

 > Jul 14 13:25:41 mai-stor2 kernel: EIP:   
 > 0010:[usb-ohci:sohci_device_operations+686506/95231418]    Not tainted
 > Jul 14 13:25:41 mai-stor2 kernel: EIP:    0010:[<f8a2e476>]    Not tainted
 > Using defaults from ksymoops -t elf32-i386 -a i386
 > Jul 14 13:25:41 mai-stor2 kernel: EFLAGS: 00010292
 > Jul 14 13:25:41 mai-stor2 kernel: eax: 0000001f   ebx: f8a43d60   ecx: c02f6644
 >   edx: 001246c5
 > Jul 14 13:25:41 mai-stor2 kernel: esi: f3e75aa0   edi: 00000000   ebp: efd48400
 >   esp: ec737aec
 > Jul 14 13:25:41 mai-stor2 kernel: ds: 0018   es: 0018   ss: 0018
 > Jul 14 13:25:41 mai-stor2 kernel: Process ctl_cyrusdb (pid: 23408,
 > stackpage=ec737000)
 > Jul 14 13:25:41 mai-stor2 kernel: Stack: f8a456d5 0000014e ec737eec f8a3ad1e
 > efd48400 f8a43d60 00000400 efd48400
 > Jul 14 13:25:41 mai-stor2 kernel:        00000000 efd48400 ec737eec f3e75aa0
 > 00000262 f8a1f100 ec737eec efd48400
 > Jul 14 13:25:41 mai-stor2 kernel:        f3e75aa0 edb44000 f3eb41a0 edb4a000
 > c99db164 00000000 013173f6 ec737be0
 > Jul 14 13:25:41 mai-stor2 kernel: Call Trace:
 > [usb-ohci:sohci_device_operations+781321/95136603] .LC62 [reiserfs] 0xc3
 > Jul 14 13:25:41 mai-stor2 kernel: Call Trace: [<f8a456d5>] .LC62 [reiserfs] 0xc3
 > Jul 14 13:25:41 mai-stor2 kernel: [<f8a3ad1e>] journal_mark_dirty [reiserfs] 0x13e
 > Jul 14 13:25:41 mai-stor2 kernel: [<f8a43d60>] .LC93 [reiserfs] 0x27a0
 > Jul 14 13:25:41 mai-stor2 kernel: [<f8a1f100>] reiserfs_free_block [reiserfs] 0xa0
 > Jul 14 13:25:41 mai-stor2 kernel: [<f8a34bb0>] prepare_for_delete_or_cut
 > [reiserfs] 0x760
 > Jul 14 13:25:41 mai-stor2 kernel: [<f8a22417>] free_thrown [reiserfs] 0x57
 > Jul 14 13:25:41 mai-stor2 kernel: [<f8a22689>] do_balance [reiserfs] 0xe9
 > Jul 14 13:25:41 mai-stor2 kernel: [<f8a356ca>] reiserfs_cut_from_item [reiserfs]
 > 0xba
 > Jul 14 13:25:41 mai-stor2 kernel: [<f8a49f40>] reiserfs_mounted_fs_count
 > [reiserfs] 0x0
 > Jul 14 13:25:41 mai-stor2 kernel: [<f8a35d66>] reiserfs_do_truncate [reiserfs] 0x2e6
 > Jul 14 13:25:41 mai-stor2 kernel: [<f8a35253>] reiserfs_delete_object [reiserfs]
 > 0x23
 > Jul 14 13:25:41 mai-stor2 kernel: [<f8a24a1b>] reiserfs_delete_inode [reiserfs] 0x7b
 > Jul 14 13:25:41 mai-stor2 kernel: [<f8a45457>] .LC26 [reiserfs] 0x15
 > Jul 14 13:25:41 mai-stor2 kernel: [<f8a459d6>] .LC88 [reiserfs] 0x120
 > Jul 14 13:25:41 mai-stor2 kernel: [<f8a49e60>] reiserfs_sops [reiserfs] 0x0
 > Jul 14 13:25:41 mai-stor2 kernel: [<c015cc7c>] iput_free [kernel] 0x14c
 > Jul 14 13:25:41 mai-stor2 kernel: [<c0159d3b>] dentry_iput [kernel] 0x4b
 > Jul 14 13:25:41 mai-stor2 kernel: [<c01531bb>] vfs_unlink [kernel] 0x1eb
 > Jul 14 13:25:41 mai-stor2 kernel: [<c0151c51>] lookup_hash [kernel] 0x91
 > Jul 14 13:25:41 mai-stor2 kernel: [<c015328a>] sys_unlink [kernel] 0x9a
 > Jul 14 13:25:41 mai-stor2 kernel: [<c0117f80>] do_page_fault [kernel] 0x0
 > Jul 14 13:25:41 mai-stor2 kernel: [<c01073c3>] system_call [kernel] 0x33
 > Jul 14 13:25:41 mai-stor2 kernel: Code: 0f 0b 59 5b 5b c3 8d 74 26 00 57 56 be
 > ee 56 a4 f8 53 8b 7c
 >  
 > >>EIP; f8a2e476 <[reiserfs].LC28+16/100>   <=====
 > Trace; f8a456d5 <END_OF_CODE+ac56/????>
 > Trace; f8a3ad1e <.bss.end+29f/????>
 > Trace; f8a43d60 <END_OF_CODE+92e1/????>
 > Trace; f8a1f100 <[reiserfs]leaf_item_bottle+2c0/430>
 > Trace; f8a34bb0 <[reiserfs].LC53+990/4960>
 > Trace; f8a22417 <[reiserfs]is_tree_node+47/60>
 > Trace; f8a22689 <[reiserfs]search_by_key+259/c40>
 > Trace; f8a356ca <[reiserfs].LC53+14aa/4960>
 > Trace; f8a49f40 <END_OF_CODE+f4c1/????>
 > Trace; f8a35d66 <[reiserfs].LC53+1b46/4960>
 > Trace; f8a35253 <[reiserfs].LC53+1033/4960>
 > Trace; f8a24a1b <[reiserfs]reiserfs_cut_from_item+40b/410>
 > Trace; f8a45457 <END_OF_CODE+a9d8/????>
 > Trace; f8a459d6 <END_OF_CODE+af57/????>
 > Trace; f8a49e60 <END_OF_CODE+f3e1/????>
 > Trace; c015cc7c <iput_free+14c/240>
 > Trace; c0159d3b <dentry_iput+4b/70>
 > Trace; c01531bb <vfs_unlink+1eb/220>
 > Trace; c0151c51 <lookup_hash+91/e0>
 > Trace; c015328a <sys_unlink+9a/110>
 > Trace; c0117f80 <do_page_fault+0/490>
 > Trace; c01073c3 <system_call+33/38>
 > Code;  f8a2e476 <[reiserfs].LC28+16/100>
 > 00000000 <_EIP>:
 > Code;  f8a2e476 <[reiserfs].LC28+16/100>   <=====
 >    0:   0f 0b                     ud2a      <=====
 > Code;  f8a2e478 <[reiserfs].LC28+18/100>
 >    2:   59                        pop    %ecx
 > Code;  f8a2e479 <[reiserfs].LC28+19/100>
 >    3:   5b                        pop    %ebx
 > Code;  f8a2e47a <[reiserfs].LC28+1a/100>
 >    4:   5b                        pop    %ebx
 > Code;  f8a2e47b <[reiserfs].LC28+1b/100>
 >    5:   c3                        ret
 > Code;  f8a2e47c <[reiserfs].LC28+1c/100>
 >    6:   8d 74 26 00               lea    0x0(%esi,1),%esi
 > Code;  f8a2e480 <[reiserfs].LC28+20/100>
 >    a:   57                        push   %edi
 > Code;  f8a2e481 <[reiserfs].LC28+21/100>
 >    b:   56                        push   %esi
 > Code;  f8a2e482 <[reiserfs].LC28+22/100>
 >    c:   be ee 56 a4 f8            mov    $0xf8a456ee,%esi
 > Code;  f8a2e487 <[reiserfs].LC28+27/100>
 >   11:   53                        push   %ebx
 > Code;  f8a2e488 <[reiserfs].LC28+28/100>
 >   12:   8b 7c 00 00               mov    0x0(%eax,%eax,1),%edi
 >  
 > Jul 14 13:25:41 mai-stor2 kernel:  <0>Kernel panic: not continuing
 > 
 > 
 > I just want to know if this is a known problem, if it is i belive it's already
 > fixed.
 > 
 > And if it's not, i'm dumping these redhats kernels for the stock 2.4.
 > 
 > --
 > 
 > Jure Pecar

Vladimir.
