From: Jan Engelhardt <jengelh@linux01.gwdg.de>
Subject: Reiser4 pokes into R3
Date: Wed, 6 Apr 2005 19:47:37 +0200 (MEST)
Message-ID: <Pine.LNX.4.61.0504061941430.26625@yvahk01.tjqt.qr>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-23788-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

[please Cc, i'm not subscribed atm]

Hello list,


after I started using a loop-mounted reiser4 fs, I was getting

ReiserFS: hda1: warning: clm-2100: nesting info a different FS

randomly. (BTW, there's a spelling mistake: info -> into.)
Below clm-2100, I added a printk in the sources to see what's going on...:
(fs/reiserfs/journal.c)

            reiserfs_warning(p_s_sb, "clm-2100: nesting info a different FS");
+            printk(KERN_INFO "clm-2100+1: p_s_sb=%s (%p), t_super=%s (%p)\n",
+              reiserfs_bdevname(p_s_sb), p_s_sb,
+              reiserfs_bdevname(cur_th->t_super), cur_th->t_super
+            );

After I booted the newly compiled kernel with this printk, I even got a 
oops-or-similar when entering this branch, which "should never
** really happen...". Wonder why? Well, the paging request for "4b1b5e4b"
looks out-of-kernelspace, so I suppose _something_ in R4 pokes heavily in 
memory and upsets the R3 code.

I am using the 2.6.11.4 (SUSE KOTD from March 29 2005.)




Jan Engelhardt
-- 
No TOFU for me, please.


This paging request must be due the printk, or the arguments I pass it.
So, I suppose t_super has a fundamental wrong value (4b...).

Apr  6 19:34:18 eax kernel: ReiserFS: hda1: warning: clm-2100: nesting info a different FS
Apr  6 19:34:18 eax kernel: Unable to handle kernel paging request at virtual address 4b1b5e4b
Apr  6 19:34:18 eax kernel:  printing eip:
Apr  6 19:34:18 eax kernel: c01c7e44
Apr  6 19:34:18 eax kernel: *pde = 00000000
Apr  6 19:34:18 eax kernel: Oops: 0000 [#1]
Apr  6 19:34:18 eax kernel: Modules linked in: isofs zlib_inflate nfsd exportfs lockd nfsacl sunrpc snd_cs46xx snd_rawmidi snd_ac97_codec snd_pcm snd_timer snd soundcore snd_page_alloc vmnet parport_pc lp parport vmmon ipt_TCPMSS ipt_MASQUERADE ipt_multiport ipt_REJECT ipt_state ip_conntrack_irc ip_conntrack_ftp iptable_mangle iptable_nat ip_conntrack iptable_filter ip_tables hisax crc_ccitt isdn slhc rpldev psmouse nvidia sis900 8139too mii crc32 uhci_hcd ohci_hcd ehci_hcd usb_storage usbcore sg sr_mod nls_utf8 nls_cp437 vfat fat nls_base reiser4 loop sd_mod scsi_mod ide_cd cdrom
Apr  6 19:34:18 eax kernel: CPU:    0
Apr  6 19:34:18 eax kernel: EIP:    0060:[<c01c7e44>]    Tainted: P     U VLI
Apr  6 19:34:18 eax kernel: EFLAGS: 00010097   (2.6.11-AS13) 
Apr  6 19:34:18 eax kernel: EIP is at vsnprintf+0x2b4/0x4f0
Apr  6 19:34:18 eax kernel: eax: 4b1b5e4b   ebx: 0000000a   ecx: 4b1b5e4b   edx: fffffffe
Apr  6 19:34:18 eax kernel: esi: c038348d   edi: 00000000   ebp: c038385f   esp: c9bf1a3c
Apr  6 19:34:18 eax kernel: ds: 007b   es: 007b   ss: 0068
Apr  6 19:34:18 eax kernel: Process cp (pid: 17227, threadinfo=c9bf0000 task=cc1f1020)
Apr  6 19:34:18 eax kernel: Stack: c038347a c038385f cfef9600 00000000 00000010 00000008 00000007 00000001 
Apr  6 19:34:18 eax kernel:        ffffffff ffffffff ffffffff 00000400 00000246 c9bf1af4 cfef9600 c01c80a8 
Apr  6 19:34:18 eax kernel:        c0383460 00000400 c02ba57a c9bf1ad0 c0383460 c01162f0 c0383460 00000400 
Apr  6 19:34:18 eax kernel: Call Trace:
Apr  6 19:34:18 eax kernel:  [<c01c80a8>] vscnprintf+0x28/0x40
Apr  6 19:34:18 eax kernel:  [<c01162f0>] vprintk+0x40/0x130
Apr  6 19:34:18 eax kernel:  [<c01162a7>] printk+0x17/0x20
Apr  6 19:34:18 eax kernel:  [<c01b3586>] journal_begin+0x86/0x160
Apr  6 19:34:18 eax kernel:  [<c01a2891>] reiserfs_dquot_drop+0x31/0x70
Apr  6 19:34:18 eax kernel:  [<c01500f1>] invalidate_inode_buffers+0x11/0x50
Apr  6 19:34:18 eax kernel:  [<c01671e4>] clear_inode+0x134/0x140
Apr  6 19:34:18 eax kernel:  [<c016720d>] dispose_list+0x1d/0xa0
Apr  6 19:34:18 eax kernel:  [<c0167632>] prune_icache+0x162/0x1e0
Apr  6 19:34:18 eax kernel:  [<c01676cf>] shrink_icache_memory+0x1f/0x50
Apr  6 19:34:18 eax kernel:  [<c0139ec2>] shrink_slab+0x132/0x190
Apr  6 19:34:18 eax kernel:  [<c013af39>] try_to_free_pages+0xd9/0x190
Apr  6 19:34:18 eax kernel:  [<c0134464>] __alloc_pages+0x264/0x4e0
Apr  6 19:34:18 eax kernel:  [<c012fa05>] find_or_create_page+0x65/0xd0
Apr  6 19:34:18 eax kernel:  [<d09c7d1a>] jnode_get_page_locked+0xba/0xf0 [reiser4]
Apr  6 19:34:18 eax kernel:  [<d0a041ac>] extent_write_flow+0x18c/0x5e0 [reiser4]
Apr  6 19:34:18 eax kernel:  [<d0a04790>] write_extent+0x0/0x50 [reiser4]
Apr  6 19:34:18 eax kernel:  [<d0a14f46>] append_and_or_overwrite+0x1a6/0x3b0 [reiser4]
Apr  6 19:34:18 eax kernel:  [<d0a151df>] write_flow+0x8f/0xa0 [reiser4]
Apr  6 19:34:18 eax kernel:  [<d0a154dc>] write_file+0x9c/0xd0 [reiser4]
Apr  6 19:34:18 eax kernel:  [<d0a1572a>] write_unix_file+0x21a/0x480 [reiser4]
Apr  6 19:34:18 eax kernel:  [<d09d0cc5>] init_context+0x75/0xc0 [reiser4]
Apr  6 19:34:18 eax kernel:  [<d09e717f>] reiser4_write+0x8f/0x100 [reiser4]
Apr  6 19:34:18 eax kernel:  [<c0157821>] sys_fstat64+0x31/0x40
Apr  6 19:34:18 eax kernel:  [<c014dfa6>] vfs_write+0xc6/0x190
Apr  6 19:34:18 eax kernel:  [<c014e141>] sys_write+0x51/0x80
Apr  6 19:34:18 eax kernel:  [<c0102be3>] syscall_call+0x7/0xb
Apr  6 19:34:18 eax kernel: Code: e8 62 bb f3 ff e9 1d fe ff ff 8b 44 24 4c 83 44 24 4c 04 8b 54 24 24 8b 08 b8 2f b6 2b c0 81 f9 ff 0f 00 00 0f 46 c8 89 c8 eb 06 <80> 38 00 74 07 40 4a 83 fa ff 75 f4 29 c8 83 e7 10 89 c3 75 20 
