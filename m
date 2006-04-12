From: Ard van Breemen <ard@kwaak.net>
Subject: Re: Bug report: reiserfsck --rebuild-tree not progressing
Date: Wed, 12 Apr 2006 17:35:57 +0200
Message-ID: <20060412153557.GP1427@kwaak.net>
References: <b19177749f9fd8399d24c21c4f355efd@pandora.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-28488-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <b19177749f9fd8399d24c21c4f355efd@pandora.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: System Administrators <sysadmin@pandora.com>
Cc: reiserfs-list@namesys.com

Hi,
On Mon, Apr 10, 2006 at 05:34:58PM -0700, Tyler Phelps wrote:
> The following are syslog messages from the kernel.  The filesystem 
> trouble began at about 2:50am which matches the following log entries:
> 
> Apr  6 02:50:03 gwar kernel: ReiserFS: dm-12: warning: vs-13060: 
> reiserfs_update_sd: stat data of object [124 983 0x0 SD] (nlink == 1) 
> not found (pos 1)

Have you been able to determine why it happened?
We also have opterons and got this:
ReiserFS: sdb9: warning: vs-13060: reiserfs_update_sd: stat data of object [2 12 0x0 SD] (nlink == 3) not found (pos 1)
ReiserFS: sdb9: warning: vs-13060: reiserfs_update_sd: stat data of object [2 12 0x0 SD] (nlink == 3) not found (pos 1)
ReiserFS: sdb9: warning: vs-13060: reiserfs_update_sd: stat data of object [2 12 0x0 SD] (nlink == 3) not found (pos 1)

And then finally some sort of kernel panic.
And it is repeatable.
Kernel: 2.6.16.1 for AMD64
Kernel: 2.6.17rc1 for AMD64 (Yes, tried both)
Compiled with gcc-3.3 on an AMD64 platform
userspace is 32 bits debian
Hardware:
tyan s2891 (gt24 system) with nforce4 and 4 sata 1 drives.

success:
Run a lot of bonnie++'s

consistent failure:
(Tried as 4 seperate disks of 0.4T and as one raid5 partition of 1.1T)
After 2 hours of pumping a few million files onto the machine
reiserfs starts putting out these warnings (a few thousands):
^MReiserFS: sdb9: warning: vs-13060: reiserfs_update_sd: stat data of object [2 12 0x0 SD] (nlink == 3) not found (pos 1)

And then the panic for a 2.6.16.1 kernel:

NMI Watchdog detected LOCKUP on CPU 1
CPU 1 
Modules linked in: ipv6 tg3 nfsd exportfs nfs lockd sunrpc
Pid: 15215, comm: tar Not tainted 2.6.16.1-tyan-s2891 #1
RIP: 0010:[<ffffffff8037903d>] <ffffffff8037903d>{.text.lock.spinlock+22}
RSP: 0000:ffff81012fc9fc48  EFLAGS: 00000086
RAX: ffff8100cbcfec78 RBX: ffff8100cbcfec70 RCX: 0000000000000000
RDX: 0000000000000001 RSI: 0000000000000001 RDI: ffff8100cbcfec70
RBP: ffff81012fc9fc88 R08: 00000000000200a3 R09: 0000000000000640
R10: 0000000000010c0c R11: 00000000000005b4 R12: 0000000000000000
R13: 0000000000000001 R14: 0000000000000000 R15: 0000000000000001
FS:  0000000000000000(0000) GS:ffff81012fc5fbc0(0063) knlGS:00000000f7e88080
CS:  0010 DS: 002b ES: 002b CR0: 000000008005003b
CR2: 00000000f7f7dfbc CR3: 0000000042d8e000 CR4: 00000000000006e0
Process tar (pid: 15215, threadinfo ffff81002891c000, task ffff81007e2860c0)
Stack: 0000000000000296 ffffffff801280ed 0000000100000000 ffff810116728700 
       ffff81002ff90780 00000000ffffffff 0000000000000000 ffff81003d8de834 
       ffff810116728700 ffffffff80315604 
Call Trace: <IRQ> <ffffffff801280ed>{__wake_up+45} <ffffffff80315604>{sock_def_readable+52}
       <ffffffff80349cce>{tcp_data_queue+894} <ffffffff8034b236>{tcp_rcv_established+1638}
       <ffffffff80352883>{tcp_v4_do_rcv+35} <ffffffff80352ef7>{tcp_v4_rcv+1431}
       <ffffffff8031c69f>{dev_queue_xmit+559} <ffffffff80337872>{ip_local_deliver+402}
       <ffffffff80337e3c>{ip_rcv+1244} <ffffffff8031cb8c>{netif_receive_skb+508}
       <ffffffff880b9109>{:tg3:tg3_rx+905} <ffffffff880b927c>{:tg3:tg3_poll+140}
       <ffffffff8031cd84>{net_rx_action+132} <ffffffff80133c21>{__do_softirq+97}
       <ffffffff8010bef2>{call_softirq+30} <ffffffff8010dc11>{do_softirq+49}
       <ffffffff8010dbc7>{do_IRQ+71} <ffffffff8010b250>{ret_from_intr+0} <EOI>
       <ffffffff8021f9b1>{memmove+49} <ffffffff801ce065>{leaf_paste_entries+245}
       <ffffffff801cc0ab>{leaf_copy_dir_entries+619} <ffffffff801cc48a>{leaf_copy_boundary_item+970}
       <ffffffff80143ad8>{wake_up_bit+24} <ffffffff801cce3e>{leaf_copy_items+78}
       <ffffffff801cd150>{leaf_move_items+80} <ffffffff801cd1de>{leaf_shift_left+62}
       <ffffffff801b85a1>{balance_leaf_when_delete+865} <ffffffff801b865d>{balance_leaf+93}
       <ffffffff80143ad8>{wake_up_bit+24} <ffffffff801d8dd8>{reiserfs_prepare_for_journal+88}
       <ffffffff801babed>{do_balance+141} <ffffffff801c75be>{fix_nodes+590}
       <ffffffff801d2113>{reiserfs_cut_from_item+915} <ffffffff801bc174>{reiserfs_unlink+308}
       <ffffffff801934c4>{mntput_no_expire+36} <ffffffff8018803e>{vfs_unlink+110}
       <ffffffff8018812f>{do_unlinkat+175} <ffffffff8011de5e>{ia32_sysret+0}

Code: 83 3f 00 7e f9 e9 92 fd ff ff f3 90 83 3f 00 7e f9 e9 9e fd 
console shuts up ...
 Badness in do_exit at kernel/exit.c:802

Call Trace: <NMI> <ffffffff80131434>{do_exit+68} <ffffffff8010c7eb>{die_nmi+123}
       <ffffffff80117b16>{nmi_watchdog_tick+230} <ffffffff8010d2c6>{default_do_nmi+134}
       <ffffffff80117c15>{do_nmi+69} <ffffffff803792f3>{nmi+127}
       <ffffffff8037903d>{.text.lock.spinlock+22} <EOE> <IRQ>
       <ffffffff801280ed>{__wake_up+45} <ffffffff80315604>{sock_def_readable+52}
       <ffffffff80349cce>{tcp_data_queue+894} <ffffffff8034b236>{tcp_rcv_established+1638}
       <ffffffff80352883>{tcp_v4_do_rcv+35} <ffffffff80352ef7>{tcp_v4_rcv+1431}
       <ffffffff8031c69f>{dev_queue_xmit+559} <ffffffff80337872>{ip_local_deliver+402}
       <ffffffff80337e3c>{ip_rcv+1244} <ffffffff8031cb8c>{netif_receive_skb+508}
       <ffffffff880b9109>{:tg3:tg3_rx+905} <ffffffff880b927c>{:tg3:tg3_poll+140}
       <ffffffff8031cd84>{net_rx_action+132} <ffffffff80133c21>{__do_softirq+97}
       <ffffffff8010bef2>{call_softirq+30} <ffffffff8010dc11>{do_softirq+49}
       <ffffffff8010dbc7>{do_IRQ+71} <ffffffff8010b250>{ret_from_intr+0} <EOI>
       <ffffffff8021f9b1>{memmove+49} <ffffffff801ce065>{leaf_paste_entries+245}
       <ffffffff801cc0ab>{leaf_copy_dir_entries+619} <ffffffff801cc48a>{leaf_copy_boundary_item+970}
       <ffffffff80143ad8>{wake_up_bit+24} <ffffffff801cce3e>{leaf_copy_items+78}
       <ffffffff801cd150>{leaf_move_items+80} <ffffffff801cd1de>{leaf_shift_left+62}
       <ffffffff801b85a1>{balance_leaf_when_delete+865} <ffffffff801b865d>{balance_leaf+93}
       <ffffffff80143ad8>{wake_up_bit+24} <ffffffff801d8dd8>{reiserfs_prepare_for_journal+88}
       <ffffffff801babed>{do_balance+141} <ffffffff801c75be>{fix_nodes+590}
       <ffffffff801d2113>{reiserfs_cut_from_item+915} <ffffffff801bc174>{reiserfs_unlink+308}
       <ffffffff801934c4>{mntput_no_expire+36} <ffffffff8018803e>{vfs_unlink+110}
       <ffffffff8018812f>{do_unlinkat+175} <ffffffff8011de5e>{ia32_sysret+0}
Kernel panic - not syncing: Aiee, killing interrupt handler!


I've seen in git that there is a memory leak in tg3, but I guess
(looking at the graphs) that it was not memory related.

Anyway, off to put another 2 of those at testing...

Regards,
Ard van Breemen
