From: Alex Zarochentsev <zam@namesys.com>
Subject: Re: reiser4 vs. apache2 bad interaction?
Date: Tue, 8 Jun 2004 20:57:33 +0400
Message-ID: <20040608165733.GW8091@backtop.namesys.com>
References: <20040607115743.GA27255@chepelov.org>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-19094-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <20040607115743.GA27255@chepelov.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Cyrille Chepelov <cyrille@chepelov.org>
Cc: reiserfs-list@namesys.com

On Mon, Jun 07, 2004 at 01:57:43PM +0200, Cyrille Chepelov wrote:
> Greetings,
> 
> I'm seeing something very strange on a system here. I'm running 2.6.5
> with the snapshot against 2.6.5-rc2 (I don't have much time to play with
> the autosnapshots, and I don't have the money to pay my lawyer for his time 
> before I play with BK).
> 
> On this system, the / partition (including /boot) is reiserfs, and
> there's a /big reiser4, which contains three directories /big/usr,
> /big/home and /big/var, to which /usr, /home and /var, respectively, are
> symlinks. Yes, not exactly pretty, but it worked good enough until I
> switched /big to reiser4.
> 
> What happens now, is that after a little while, and regardless of the
> MPM I use, apache2 sometimes spawns threads which seem to enter a busy loop 
> within the kernel. WCHAN is mute, these guys don't respond to "kill
> -9's", and attempts to attach a gdb to the errant process just sit and
> wait.

Thanks for the report.

We will try to reproduce it (I think it will take some time
to a web server test suite up).


> There is nothing in dmesg (except the usual iptables chatter).
> 
> apache2 is 2.0.49-1 as Debian sid ships it.

what kind of load apache has? serving static pages?

> 
> Needless to say, there's only so many processes this very small box can
> handle, before it bows under the loadavg. As far as I can see, apache2
> is the only process to ever enter this behaviour.
> 
> Magic-T gives me a few relevant entries, which I attach in the file
> "k.log" here. Processes 25096, 26003, 26034 and 26407 are errant, the
> others seem to be okay.
> I'm attaching k2.log as well, taken a couple minutes later, to show
> what's different and what's same between the two instants -- in case
> this helps.
> 
> I plan to move my /big partition back to reiserfs tonight, to confirm
> (or infirm) the hypothesis that it's a bad interaction between apache2
> and reiser4, or if it's not, to give me back the freedom to change
> between kernel revisions until the problem is nailed, but if this rings
> a bell among reiser4 users, and turns out to really be reiser4's fault, 
> I'm more than willing to provide whatever I can to help track & nail 
> this bug.
> 
> 	-- Cyrille
> 
> -- 

> Jun  7 13:47:13 traminer kernel: apache2       R running     0 24624      1 25037          2701 (NOTLB)
> Jun  7 13:47:13 traminer kernel: apache2       S C1D83E80     0 25037  24624         25055       (NOTLB)
> Jun  7 13:47:13 traminer kernel: c1d83e0c 00000086 0000000d c1d83e80 00000018 c4ef9018 00000282 c0e579c0 
> Jun  7 13:47:14 traminer kernel:        c0e579e0 0088c558 a88ae43a 00068106 c0832f80 00000000 7fffffff c1d83e60 
> Jun  7 13:47:14 traminer kernel:        c1d83ea0 c0123baf c680f04c 00000003 00000001 00000282 00000104 00000202 
> Jun  7 13:47:14 traminer kernel: Call Trace:
> Jun  7 13:47:14 traminer kernel:  [schedule_timeout+159/176] schedule_timeout+0x9f/0xb0
> Jun  7 13:47:14 traminer kernel:  [wait_for_packet+183/288] wait_for_packet+0xb7/0x120
> Jun  7 13:47:14 traminer kernel:  [autoremove_wake_function+0/64] autoremove_wake_function+0x0/0x40
> Jun  7 13:47:14 traminer kernel:  [scheduler_tick+30/1360] scheduler_tick+0x1e/0x550
> Jun  7 13:47:14 traminer kernel:  [autoremove_wake_function+0/64] autoremove_wake_function+0x0/0x40
> Jun  7 13:47:14 traminer kernel:  [skb_recv_datagram+146/272] skb_recv_datagram+0x92/0x110
> Jun  7 13:47:14 traminer kernel:  [pg0+106371259/1069735936] unix_accept+0x5b/0x110 [unix]
> Jun  7 13:47:14 traminer kernel:  [sys_accept+170/336] sys_accept+0xaa/0x150
> Jun  7 13:47:14 traminer kernel:  [unmap_vmas+260/592] unmap_vmas+0x104/0x250
> Jun  7 13:47:14 traminer kernel:  [unmap_region+128/208] unmap_region+0x80/0xd0
> Jun  7 13:47:14 traminer kernel:  [dput+27/576] dput+0x1b/0x240
> Jun  7 13:47:14 traminer kernel:  [sys_socketcall+202/496] sys_socketcall+0xca/0x1f0
> Jun  7 13:47:14 traminer kernel:  [sys_setuid+151/176] sys_setuid+0x97/0xb0
> Jun  7 13:47:14 traminer kernel:  [syscall_call+7/11] syscall_call+0x7/0xb
> Jun  7 13:47:14 traminer kernel: 
> Jun  7 13:47:14 traminer kernel: apache2       D 00007EBE     0 25055  24624         25096 25037 (NOTLB)
> Jun  7 13:47:14 traminer kernel: c1af7e08 00000086 00000000 00007ebe 00000000 00000002 00000002 c27486e0 
> Jun  7 13:47:15 traminer kernel:        c2748700 0072c884 8572531e 00068353 c0e8b640 c1af7e6c 00000000 c1af6000 
> Jun  7 13:47:15 traminer kernel:        c0e8b480 c0105ab9 c1af7e74 00000001 c0e8b480 c0118b40 c1af7e74 c1af7e74 
> Jun  7 13:47:15 traminer kernel: Call Trace:
> Jun  7 13:47:15 traminer kernel:  [__down+153/288] __down+0x99/0x120
> Jun  7 13:47:15 traminer kernel:  [default_wake_function+0/32] default_wake_function+0x0/0x20
> Jun  7 13:47:15 traminer kernel:  [__down_failed+8/12] __down_failed+0x8/0xc
> Jun  7 13:47:15 traminer kernel:  [.text.lock.kcond+15/81] .text.lock.kcond+0xf/0x51
> Jun  7 13:47:15 traminer kernel:  [try_commit_txnh+102/448] try_commit_txnh+0x66/0x1c0
> Jun  7 13:47:15 traminer kernel:  [rw_latch_down_write+41/96] rw_latch_down_write+0x29/0x60
> Jun  7 13:47:15 traminer kernel:  [get_exclusive_access+36/64] get_exclusive_access+0x24/0x40
> Jun  7 13:47:15 traminer kernel:  [release_unix_file+25/192] release_unix_file+0x19/0xc0
> Jun  7 13:47:15 traminer kernel:  [reiser4_release+85/96] reiser4_release+0x55/0x60
> Jun  7 13:47:15 traminer kernel:  [__fput+260/288] __fput+0x104/0x120
> Jun  7 13:47:15 traminer kernel:  [filp_close+67/112] filp_close+0x43/0x70
> Jun  7 13:47:15 traminer kernel:  [sys_close+91/144] sys_close+0x5b/0x90
> Jun  7 13:47:15 traminer kernel:  [syscall_call+7/11] syscall_call+0x7/0xb
> Jun  7 13:47:16 traminer kernel: 
> Jun  7 13:47:16 traminer kernel: apache2       R running     0 25096  24624         26407 25055 (NOTLB)
> Jun  7 13:47:16 traminer kernel: amavisd-new   S C27B2EC4     0 25311   6015               22327 (NOTLB)
> Jun  7 13:47:16 traminer kernel: c0a79f80 00000086 00000001 c27b2ec4 c27b228c c27b2ec4 c01604a7 c5f176e0 
> Jun  7 13:47:16 traminer kernel:        c5f17700 001391ba ca30d713 00068551 c0ac79e0 c0a78000 00000000 00000001 
> Jun  7 13:47:16 traminer kernel:        c0fbd6e0 c01614d3 c0a78000 c27b228c 00000000 c0ac7820 c0118b40 c27b22a8 
> Jun  7 13:47:16 traminer kernel: Call Trace:
> Jun  7 13:47:16 traminer kernel:  [flock_lock_file+375/464] flock_lock_file+0x177/0x1d0
> Jun  7 13:47:16 traminer kernel:  [sys_flock+355/400] sys_flock+0x163/0x190
> Jun  7 13:47:16 traminer kernel:  [default_wake_function+0/32] default_wake_function+0x0/0x20
> Jun  7 13:47:16 traminer kernel:  [do_IRQ+277/336] do_IRQ+0x115/0x150
> Jun  7 13:47:16 traminer kernel:  [syscall_call+7/11] syscall_call+0x7/0xb
> Jun  7 13:47:16 traminer kernel: 
> Jun  7 13:47:16 traminer kernel: apache2       R running     0 26407  24624               25096 (NOTLB)
> Jun  7 13:47:16 traminer kernel: strace        S C5F17140     0 27182  19610 26034   27351       (NOTLB)
> Jun  7 13:47:16 traminer kernel: c077df64 00000086 c161b400 c5f17140 c161b400 c59cd680 c1e81ec4 c5f176e0 
> Jun  7 13:47:16 traminer kernel:        c5f17700 00009c73 8cc77111 0006861a c161b5c0 fffffe00 c077c000 c161b4a8 
> Jun  7 13:47:16 traminer kernel:        c161b4a8 c011eb0e 00000001 00000000 c161b400 c0118b40 00000000 00000000 
> Jun  7 13:47:16 traminer kernel: Call Trace:
> Jun  7 13:47:16 traminer kernel:  [sys_wait4+398/592] sys_wait4+0x18e/0x250
> Jun  7 13:47:16 traminer kernel:  [default_wake_function+0/32] default_wake_function+0x0/0x20
> Jun  7 13:47:16 traminer kernel:  [need_resched+39/54] need_resched+0x27/0x36
> Jun  7 13:47:16 traminer kernel:  [default_wake_function+0/32] default_wake_function+0x0/0x20
> Jun  7 13:47:16 traminer kernel:  [syscall_call+7/11] syscall_call+0x7/0xb
> Jun  7 13:47:17 traminer kernel: 
> Jun  7 13:47:17 traminer kernel: apache2       R running     0 26034  27182                     (NOTLB)
> Jun  7 13:47:17 traminer kernel: gdb           T C0124848     0 27351  19610 26003         27182 (NOTLB)
> Jun  7 13:47:17 traminer kernel: c1c9bef0 00000082 c37c53a8 c0124848 00000000 56d399fd 00068716 c0059140 
> Jun  7 13:47:17 traminer kernel:        c0059160 0001f0c0 56d3b947 00068716 c0058d60 c1c9a000 00000001 00000014 
> Jun  7 13:47:17 traminer kernel:        c1c9a000 c0125dba c1c9a000 c01261c8 ffffffff c00590e4 c1c9bfc4 c00590e4 
> Jun  7 13:47:17 traminer kernel: Call Trace:
> Jun  7 13:47:17 traminer kernel:  [__dequeue_signal+200/336] __dequeue_signal+0xc8/0x150
> Jun  7 13:47:17 traminer kernel:  [finish_stop+74/144] finish_stop+0x4a/0x90
> Jun  7 13:47:17 traminer kernel:  [get_signal_to_deliver+520/864] get_signal_to_deliver+0x208/0x360
> Jun  7 13:47:17 traminer kernel:  [do_signal+77/224] do_signal+0x4d/0xe0
> Jun  7 13:47:17 traminer kernel:  [sys_wait4+434/592] sys_wait4+0x1b2/0x250
> Jun  7 13:47:17 traminer kernel:  [default_wake_function+0/32] default_wake_function+0x0/0x20
> Jun  7 13:47:17 traminer kernel:  [default_wake_function+0/32] default_wake_function+0x0/0x20
> Jun  7 13:47:17 traminer kernel:  [sys_sigreturn+170/192] sys_sigreturn+0xaa/0xc0
> Jun  7 13:47:17 traminer kernel:  [do_notify_resume+55/64] do_notify_resume+0x37/0x40
> Jun  7 13:47:17 traminer kernel:  [work_notifysig+19/21] work_notifysig+0x13/0x15
> Jun  7 13:47:17 traminer kernel: 
> Jun  7 13:47:17 traminer kernel: apache2       R running     0 26003  27351                     (NOTLB)
> Jun  7 13:47:17 traminer kernel: cron          S C0107BF8     0 27447   1387 27450               (NOTLB)
> Jun  7 13:47:17 traminer kernel: c23bfed0 00000086 00000046 c0107bf8 86557d06 c5a55740 c0833360 c0058600 
> Jun  7 13:47:17 traminer kernel:        c0058620 00049c76 02ffeae1 00068715 c0833520 c15a8968 c15a8900 c23bfef8 
> Jun  7 13:47:17 traminer kernel:        c15a8900 c0158bdb 00000000 c0833360 c011a140 c23bff04 c23bff04 c23bff60 
> Jun  7 13:47:17 traminer kernel: Call Trace:
> Jun  7 13:47:17 traminer kernel:  [common_interrupt+24/32] common_interrupt+0x18/0x20
> Jun  7 13:47:17 traminer kernel:  [pipe_wait+123/160] pipe_wait+0x7b/0xa0
> Jun  7 13:47:17 traminer kernel:  [autoremove_wake_function+0/64] autoremove_wake_function+0x0/0x40
> Jun  7 13:47:17 traminer kernel:  [cp_new_stat64+266/304] cp_new_stat64+0x10a/0x130
> Jun  7 13:47:18 traminer kernel:  [autoremove_wake_function+0/64] autoremove_wake_function+0x0/0x40
> Jun  7 13:47:18 traminer kernel:  [vma_merge+307/704] vma_merge+0x133/0x2c0
> Jun  7 13:47:18 traminer kernel:  [pipe_readv+509/752] pipe_readv+0x1fd/0x2f0
> Jun  7 13:47:18 traminer kernel:  [pipe_read+39/48] pipe_read+0x27/0x30
> Jun  7 13:47:18 traminer kernel:  [vfs_read+140/208] vfs_read+0x8c/0xd0
> Jun  7 13:47:18 traminer kernel:  [sys_read+45/80] sys_read+0x2d/0x50
> Jun  7 13:47:18 traminer kernel:  [syscall_call+7/11] syscall_call+0x7/0xb
> Jun  7 13:47:18 traminer kernel: 
> 

> Jun  7 13:52:55 traminer kernel: apache2       R running     0 24624      1 25037          2701 (NOTLB)
> Jun  7 13:52:55 traminer kernel: apache2       S C1D83E80     0 25037  24624         25055       (NOTLB)
> Jun  7 13:52:55 traminer kernel: c1d83e0c 00000086 0000000d c1d83e80 00000018 c4ef9018 00000282 c0e579c0 
> Jun  7 13:52:55 traminer kernel:        c0e579e0 0088c558 a88ae43a 00068106 c0832f80 00000000 7fffffff c1d83e60 
> Jun  7 13:52:55 traminer kernel:        c1d83ea0 c0123baf c680f04c 00000003 00000001 00000282 00000104 00000202 
> Jun  7 13:52:55 traminer kernel: Call Trace:
> Jun  7 13:52:55 traminer kernel:  [schedule_timeout+159/176] schedule_timeout+0x9f/0xb0
> Jun  7 13:52:55 traminer kernel:  [wait_for_packet+183/288] wait_for_packet+0xb7/0x120
> Jun  7 13:52:55 traminer kernel:  [autoremove_wake_function+0/64] autoremove_wake_function+0x0/0x40
> Jun  7 13:52:55 traminer kernel:  [scheduler_tick+30/1360] scheduler_tick+0x1e/0x550
> Jun  7 13:52:55 traminer kernel:  [autoremove_wake_function+0/64] autoremove_wake_function+0x0/0x40
> Jun  7 13:52:55 traminer kernel:  [skb_recv_datagram+146/272] skb_recv_datagram+0x92/0x110
> Jun  7 13:52:56 traminer kernel:  [pg0+106371259/1069735936] unix_accept+0x5b/0x110 [unix]
> Jun  7 13:52:56 traminer kernel:  [sys_accept+170/336] sys_accept+0xaa/0x150
> Jun  7 13:52:56 traminer kernel:  [unmap_vmas+260/592] unmap_vmas+0x104/0x250
> Jun  7 13:52:56 traminer kernel:  [unmap_region+128/208] unmap_region+0x80/0xd0
> Jun  7 13:52:56 traminer kernel:  [dput+27/576] dput+0x1b/0x240
> Jun  7 13:52:56 traminer kernel:  [sys_socketcall+202/496] sys_socketcall+0xca/0x1f0
> Jun  7 13:52:56 traminer kernel:  [sys_setuid+151/176] sys_setuid+0x97/0xb0
> Jun  7 13:52:56 traminer kernel:  [syscall_call+7/11] syscall_call+0x7/0xb
> Jun  7 13:52:56 traminer kernel: 
> Jun  7 13:52:56 traminer kernel: apache2       D 00007EBE     0 25055  24624         25096 25037 (NOTLB)
> Jun  7 13:52:56 traminer kernel: c1af7e08 00000086 00000000 00007ebe 00000000 00000002 00000002 c27486e0 
> Jun  7 13:52:56 traminer kernel:        c2748700 0072c884 8572531e 00068353 c0e8b640 c1af7e6c 00000000 c1af6000 
> Jun  7 13:52:56 traminer kernel:        c0e8b480 c0105ab9 c1af7e74 00000001 c0e8b480 c0118b40 c1af7e74 c1af7e74 
> Jun  7 13:52:56 traminer kernel: Call Trace:
> Jun  7 13:52:56 traminer kernel:  [__down+153/288] __down+0x99/0x120
> Jun  7 13:52:56 traminer kernel:  [default_wake_function+0/32] default_wake_function+0x0/0x20
> Jun  7 13:52:56 traminer kernel:  [__down_failed+8/12] __down_failed+0x8/0xc
> Jun  7 13:52:56 traminer kernel:  [.text.lock.kcond+15/81] .text.lock.kcond+0xf/0x51
> Jun  7 13:52:56 traminer kernel:  [try_commit_txnh+102/448] try_commit_txnh+0x66/0x1c0
> Jun  7 13:52:56 traminer kernel:  [rw_latch_down_write+41/96] rw_latch_down_write+0x29/0x60
> Jun  7 13:52:56 traminer kernel:  [get_exclusive_access+36/64] get_exclusive_access+0x24/0x40
> Jun  7 13:52:56 traminer kernel:  [release_unix_file+25/192] release_unix_file+0x19/0xc0
> Jun  7 13:52:56 traminer kernel:  [reiser4_release+85/96] reiser4_release+0x55/0x60
> Jun  7 13:52:56 traminer kernel:  [__fput+260/288] __fput+0x104/0x120
> Jun  7 13:52:56 traminer kernel:  [filp_close+67/112] filp_close+0x43/0x70
> Jun  7 13:52:56 traminer kernel:  [sys_close+91/144] sys_close+0x5b/0x90
> Jun  7 13:52:56 traminer kernel:  [syscall_call+7/11] syscall_call+0x7/0xb
> Jun  7 13:52:57 traminer kernel: 
> Jun  7 13:52:57 traminer kernel: apache2       R running     0 25096  24624         26407 25055 (NOTLB)
> Jun  7 13:52:57 traminer kernel: amavisd-new   S C27B2EC4     0 25311   6015               22327 (NOTLB)
> Jun  7 13:52:57 traminer kernel: c0a79f80 00000086 00000001 c27b2ec4 c27b228c c27b2ec4 c01604a7 c5f176e0 
> Jun  7 13:52:57 traminer kernel:        c5f17700 001391ba ca30d713 00068551 c0ac79e0 c0a78000 00000000 00000001 
> Jun  7 13:52:57 traminer kernel:        c0fbd6e0 c01614d3 c0a78000 c27b228c 00000000 c0ac7820 c0118b40 c27b22a8 
> Jun  7 13:52:57 traminer kernel: Call Trace:
> Jun  7 13:52:57 traminer kernel:  [flock_lock_file+375/464] flock_lock_file+0x177/0x1d0
> Jun  7 13:52:57 traminer kernel:  [sys_flock+355/400] sys_flock+0x163/0x190
> Jun  7 13:52:57 traminer kernel:  [default_wake_function+0/32] default_wake_function+0x0/0x20
> Jun  7 13:52:57 traminer kernel:  [do_IRQ+277/336] do_IRQ+0x115/0x150
> Jun  7 13:52:57 traminer kernel:  [syscall_call+7/11] syscall_call+0x7/0xb
> Jun  7 13:52:57 traminer kernel: 
> Jun  7 13:52:57 traminer kernel: apache2       R running     0 26407  24624               25096 (NOTLB)
> Jun  7 13:52:57 traminer kernel: strace        S C5F17140     0 27182  19610 26034   27351       (NOTLB)
> Jun  7 13:52:57 traminer kernel: c077df64 00000086 c161b400 c5f17140 c161b400 c59cd680 c1e81ec4 c5f176e0 
> Jun  7 13:52:57 traminer kernel:        c5f17700 00009c73 8cc77111 0006861a c161b5c0 fffffe00 c077c000 c161b4a8 
> Jun  7 13:52:57 traminer kernel:        c161b4a8 c011eb0e 00000001 00000000 c161b400 c0118b40 00000000 00000000 
> Jun  7 13:52:57 traminer kernel: Call Trace:
> Jun  7 13:52:57 traminer kernel:  [sys_wait4+398/592] sys_wait4+0x18e/0x250
> Jun  7 13:52:57 traminer kernel:  [default_wake_function+0/32] default_wake_function+0x0/0x20
> Jun  7 13:52:57 traminer kernel:  [need_resched+39/54] need_resched+0x27/0x36
> Jun  7 13:52:57 traminer kernel:  [default_wake_function+0/32] default_wake_function+0x0/0x20
> Jun  7 13:52:57 traminer kernel:  [syscall_call+7/11] syscall_call+0x7/0xb
> Jun  7 13:52:57 traminer kernel: 
> Jun  7 13:52:57 traminer kernel: apache2       R running     0 26034  27182                     (NOTLB)
> Jun  7 13:52:57 traminer kernel: gdb           T C0124848     0 27351  19610 26003         27182 (NOTLB)
> Jun  7 13:52:57 traminer kernel: c1c9bef0 00000082 c37c53a8 c0124848 00000000 56d399fd 00068716 c0059140 
> Jun  7 13:52:58 traminer kernel:        c0059160 0001f0c0 56d3b947 00068716 c0058d60 c1c9a000 00000001 00000014 
> Jun  7 13:52:58 traminer kernel:        c1c9a000 c0125dba c1c9a000 c01261c8 ffffffff c00590e4 c1c9bfc4 c00590e4 
> Jun  7 13:52:58 traminer kernel: Call Trace:
> Jun  7 13:52:58 traminer kernel:  [__dequeue_signal+200/336] __dequeue_signal+0xc8/0x150
> Jun  7 13:52:58 traminer kernel:  [finish_stop+74/144] finish_stop+0x4a/0x90
> Jun  7 13:52:58 traminer kernel:  [get_signal_to_deliver+520/864] get_signal_to_deliver+0x208/0x360
> Jun  7 13:52:58 traminer kernel:  [do_signal+77/224] do_signal+0x4d/0xe0
> Jun  7 13:52:58 traminer kernel:  [sys_wait4+434/592] sys_wait4+0x1b2/0x250
> Jun  7 13:52:58 traminer kernel:  [default_wake_function+0/32] default_wake_function+0x0/0x20
> Jun  7 13:52:58 traminer kernel:  [default_wake_function+0/32] default_wake_function+0x0/0x20
> Jun  7 13:52:58 traminer kernel:  [sys_sigreturn+170/192] sys_sigreturn+0xaa/0xc0
> Jun  7 13:52:58 traminer kernel:  [do_notify_resume+55/64] do_notify_resume+0x37/0x40
> Jun  7 13:52:58 traminer kernel:  [work_notifysig+19/21] work_notifysig+0x13/0x15
> Jun  7 13:52:58 traminer kernel: 
> Jun  7 13:52:59 traminer kernel: apache2       R running     0 26003  27351                     (NOTLB)
> Jun  7 13:52:59 traminer kernel: top           R running     0 27556   6290                     (NOTLB)
> Jun  7 13:52:59 traminer kernel: watchdog      Z C59AC0E0     0 27570    841                     (L-TLB)
> Jun  7 13:52:59 traminer kernel: c3337f94 00000046 c011dac4 c59ac0e0 00000011 c0bd6240 c59ac138 c5a551a0 
> Jun  7 13:52:59 traminer kernel:        c5a551c0 003ef0ba fceb7841 0006877a c59ac2a0 c5ffeaa0 c116fe80 c59ac0e0 
> Jun  7 13:52:59 traminer kernel:        00000000 c011e2a9 c59ac0e0 c3336000 00000000 401517f4 c3336000 c011e49f 
> Jun  7 13:52:59 traminer kernel: Call Trace:
> Jun  7 13:52:59 traminer kernel:  [exit_notify+548/1888] exit_notify+0x224/0x760
> Jun  7 13:52:59 traminer kernel:  [do_exit+681/1040] do_exit+0x2a9/0x410
> Jun  7 13:52:59 traminer kernel:  [do_group_exit+47/176] do_group_exit+0x2f/0xb0
> Jun  7 13:52:59 traminer kernel:  [syscall_call+7/11] syscall_call+0x7/0xb
> Jun  7 13:52:59 traminer kernel: 


-- 
Alex.
