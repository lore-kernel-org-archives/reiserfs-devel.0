From: "Mikhail L. Titov" <mlt@iab.ac.ru>
Subject: Re: kernel bug]
Date: Fri, 25 Feb 2005 15:59:44 +0300
Message-ID: <cvn93m$skb$1@sea.gmane.org>
References: <1109096270.7723.3.camel@sfelt>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Sender: news <news@sea.gmane.org>
List-Id: <reiserfs-devel.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

I have come across the similar bug in namei.c

ReiserFS: hdc5: warning: vs-13060: reiserfs_update_sd: stat data of object
[2 5471 0x0 SD] (nlink == 82) not found (pos 1)
ReiserFS: hdc5: warning: vs-13060: reiserfs_update_sd: stat data of object
[2 5471 0x0 SD] (nlink == 82) not found (pos 1)
------------[ cut here ]------------
kernel BUG at fs/reiserfs/namei.c:1293!
invalid operand: 0000 [#1]
PREEMPT
Modules linked in: iptable_nat ip_conntrack iptable_mangle iptable_filter
ip_tables ipv6 e100 eepro100 mii pciehp shpchp pci_hotplug ehci_hcd uhci_hcd
usbcore intel_agp agpgart parport_pc parport floppy evdev pcspkr rtc dm_mod
capability commoncap reiserfs ide_generic ide_disk piix ide_core unix font
vesafb cfbcopyarea cfbimgblt cfbfillrect
CPU:    0
EIP:    0060:[<f8907f09>]    Not tainted
EFLAGS: 00010296   (2.6.8-2-686)
EIP is at reiserfs_rename+0x289/0xb10 [reiserfs]
eax: ffffffff   ebx: f1269da0   ecx: 00000006   edx: f1269d10
esi: f1269e60   edi: f1269cc0   ebp: ef2bfccc   esp: f1269c00
ds: 007b   es: 007b   ss: 0068
Process mv (pid: 2426, threadinfo=f1268000 task=f76093e0)
Stack: f7fd8600 f1269d3c f1269e60 f1269d10 ef2bfccc 00000000 00000001
f1269d24
       00000001 f1268000 00000001 000081a4 00000000 00000000 f7b81018
00000039
       f7fd8600 00000001 00000000 0000003b 000000d4 00000000 f891feb1
f1269c5c
Call Trace:
 [<f891feb1>] search_by_key+0x821/0x11d0 [reiserfs]
 [<f8925965>] get_cnode+0x25/0x80 [reiserfs]
 [<f890b22e>] inode2sd+0xfe/0x160 [reiserfs]
 [<c0119e10>] autoremove_wake_function+0x0/0x60
 [<f890b671>] reiserfs_update_sd_size+0x171/0x220 [reiserfs]
 [<c0119e10>] autoremove_wake_function+0x0/0x60
 [<f892b3d5>] do_journal_end+0x715/0xad0 [reiserfs]
 [<f892a01a>] journal_end+0xaa/0x100 [reiserfs]
 [<f8916d85>] reiserfs_dirty_inode+0xd5/0x100 [reiserfs]
 [<c0165acb>] vfs_rename_other+0xcb/0x130
 [<c0165cce>] vfs_rename+0x19e/0x410
 [<c0166133>] sys_rename+0x1f3/0x230
 [<c015ec6b>] sys_lstat64+0x1b/0x40
 [<c010603b>] syscall_call+0x7/0xb
Code: 0f 0b 0d 05 ec 2f 93 f8 8b 84 24 60 02 00 00 8d 8c 24 80 01

I am running Debian GNU/Linux testing
localhost:~# cat /proc/version
Linux version 2.6.8-2-686 (dilinger@toaster.hq.voxel.net) (gcc version 3.3.5
(Debian 1:3.3.5-6)) #1 Mon Jan 24 03:58:38 EST 2005

--------
Mikhail


"Steve Felt" <steve@circlepix.com> wrote in message
news:1109096270.7723.3.camel@sfelt...
> I'm submitting this again. Any help is greatly appreciated!
>
> I am open to any suggestions and I DO appreciate the hard work that's
> gone into ReiserFS. I'm not above paying for the core developers' help,
> if it comes to that (yes, I've read http://www.namesys.com/support.html
and
> http://www.namesys.com/faq.html ). Also, I am open to suggestions, such as
"you need to recompile the
> kernel with..." or "why don't you read..." or "the hardware has to be
> replaced..."
>
> I'm getting the following "kernel BUG" on SuSE 9.1 Pro (and on 9.2):
>
> [first, the hw/sw details]
>   LSI 929x (7202xp) HBA (fiber channel card)
>
>   Large array of drives (1.4TB)
>
>   cat /proc/meminfo
> MemTotal:      1036148 kB
>
>   cat /proc/cpuinfo
> processor       : 0
> vendor_id       : AuthenticAMD
> cpu family      : 6
> model           : 6
> model name      : AMD Athlon(tm) MP 2000+
>
>   cat /proc/mpt/version
> mptlinux-3.01.14.23
> Fusion MPT base driver
> Fusion MPT SCSI host driver
>
>   cat /etc/SuSE-release
> SuSE Linux 9.1 (i586)
> VERSION = 9.1
>
>   dmesg | grep -i reiser | grep sda
> ReiserFS: sda1: found reiserfs format "3.6" with standard journal
> ReiserFS: sda1: using ordered data mode
> ReiserFS: sda1: journal params: device sda1, size 8192, journal first
> block 18, max trans len 1024, max batch 900, max commit age 30, max
> trans age 30
> ReiserFS: sda1: checking transaction log (sda1)
> reiserfs: disabling flush barriers on sda1
> ReiserFS: sda1: Using r5 hash to sort names
>
> Symptoms:
>    I can do an initial rsync of a large amount of data (~300MB) from
> another host, but subsequent rsync attempts fail after about 1hour (when
> files are actually being copied over/ replaced etc.) with the following:
>
>  kernel: ------------[ cut here ]------------
>  kernel: kernel BUG at fs/reiserfs/namei.c:1291!
>  kernel: invalid operand: 0000 [#1]
>  kernel: CPU: 0
>  kernel: EIP: 0060:[__crc_device_suspend+2680266/3186568] Not tainted
>  kernel: EIP: 0060:[] Not tainted
>  kernel: EFLAGS: 00010296 (2.6.5-7.111.19-default)
>  kernel: EIP is at reiserfs_rename+0x299/0x7d0 [reiserfs]
>  kernel: eax: ffffffff ebx: 00008000 ecx: e88a7cf0 edx: e88a7cf0
>  kernel: esi: 00000000 edi: e88a7ca0 ebp: e4aa5dcc esp: e88a7be8
>  kernel: ds: 007b es: 007b ss: 0068
>  kernel: Process rsync (pid: 3062, threadinfo=e88a6000 task=f13de220)
>  kernel: Stack: 00000009 00000009 00000001 00008180 f5b49018 00001000
> 00000000 00000000
>  kernel: 00000000 f5b4bb4c e4a84080 f5b4bb4c 00000000 00000000 c1a0e400
> 00000001
>  kernel: 00000000 0000003b 00002b5b 00000000 00000000 e88a7c3c e88a7c3c
> e88a7d50
>  kernel: Call Trace:
>  kernel: [__crc_device_suspend+2716835/3186568]
> reiserfs_allocate_blocks_for_region+0xf32/0x1320 [reiserfs]
>  kernel: [] reiserfs_allocate_blocks_for_region+0xf32/0x1320 [reiserfs]
>  kernel: [__crc_device_suspend+2692640/3186568] inode2sd+0x12f/0x140
> [reiserfs]
>  kernel: [] inode2sd+0x12f/0x140 [reiserfs]
>  kernel: [__crc_device_suspend+2772063/3186568] pathrelse+0x1e/0x30
> [reiserfs]
>  kernel: [] pathrelse+0x1e/0x30 [reiserfs]
>  kernel: [autoremove_wake_function+0/48]
> autoremove_wake_function+0x0/0x30
>  kernel: [] autoremove_wake_function+0x0/0x30
>  kernel: [__crc_device_suspend+2807928/3186568]
> do_journal_end+0x1f7/0xc40 [reiserfs]
>  kernel: [] do_journal_end+0x1f7/0xc40 [reiserfs]
>  kernel: [__crc_device_suspend+2812134/3186568] journal_end+0x65/0xc0
> [reiserfs]
>  kernel: [] journal_end+0x65/0xc0 [reiserfs]
>  kernel: [__crc_device_suspend+2719325/3186568]
> reiserfs_file_write+0x5cc/0x639 [reiserfs]
>  kernel: [] reiserfs_file_write+0x5cc/0x639 [reiserfs]
>  kernel: [vfs_rename_other+149/272] vfs_rename_other+0x95/0x110
>  kernel: [] vfs_rename_other+0x95/0x110
>  kernel: [vfs_rename+335/896] vfs_rename+0x14f/0x380
>  kernel: [] vfs_rename+0x14f/0x380
>  kernel: [sys_rename+575/704] sys_rename+0x23f/0x2c0
>  kernel: [] sys_rename+0x23f/0x2c0
>  kernel: [__pollwait+0/208] __pollwait+0x0/0xd0
>  kernel: [] __pollwait+0x0/0xd0
>  kernel: [sys_close+112/208] sys_close+0x70/0xd0
>  kernel: [] sys_close+0x70/0xd0
>  kernel: [sysenter_past_esp+82/121] sysenter_past_esp+0x52/0x79
>  kernel: [] sysenter_past_esp+0x52/0x79
>  kernel:
>  kernel: Code: 0f 0b 0b 05 35 d0 10 f9 8b 84 24 58 02 00 00 8b 8c c4 60
> 02
>
>
> --------------------------------------------
>
> Thanks for your help!
> ("Spasibo za pomosh'!")
>
> -steve
>
>
>



