From: Sergey Alirzaev <zl29ah@gmail.com>
Subject: reiser4 oops when mounting ext3 image
Date: Thu, 23 Dec 2010 20:34:14 +0300
Message-ID: <AANLkTin8ommGqkW2hR1ZFKbDr_koYNs+nYLP1JEx0PQ8@mail.gmail.com>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:mime-version:received:from:date
         :message-id:subject:to:content-type;
        bh=Ov64MH0I5rvkuMVFfn9QSmx26HkchMGmDPdydzPAwSg=;
        b=Rz+LwZnQIzpZ1SC4C7Y2VKC3VbgvZDlzHWy323A0UF9bFxIQfsaD7/Oe3wcEWmeIip
         2+dUE4AmvGjgf585aAwtXZgDK90MihoeQ6ee5yw78zVYplVSvlTCWMI1mGbjXjhvC0/+
         iqtYnOTHMCHumlw8g9oeRDViEaYRbpMI50Fm0=
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-devel@vger.kernel.org

I am trying to mount an ext3 image with -o loop. mount hangs and dmesg
says the following:

[  355.666272] EXT3-fs: barriers not enabled
[  355.666439] EXT3-fs (loop0): warning: maximal mount count reached,
running e2fsck is recommended
[  355.666456] ------------[ cut here ]------------
[  355.666459] kernel BUG at fs/reiser4/plugin/file/file_conversion.c:657!
[  355.666461] invalid opcode: 0000 [#1] PREEMPT SMP
[  355.666464] last sysfs file: /sys/devices/virtual/block/loop0/dev
[  355.666467] CPU 1
[  355.666468] Modules linked in: oss_usb oss_hdaudio osscore cifs
pl2303 usbserial
[  355.666474]
[  355.666477] Pid: 2115, comm: loop0 Not tainted 2.6.35.1+ #10
G31M-ES2L/G31M-ES2L
[  355.666479] RIP: 0010:[<ffffffff8113b0df>]  [<ffffffff8113b0df>]
reiser4_write_begin_careful+0x29/0x1b3
[  355.666488] RSP: 0018:ffff880037f87cd0  EFLAGS: 00010246
[  355.666490] RAX: ffff88003841f300 RBX: ffff880037fe06c0 RCX: 0000000000000400
[  355.666492] RDX: 0000000000000400 RSI: ffff880038f91e20 RDI: ffff880038f91e20
[  355.666494] RBP: ffff880038f91d08 R08: 0000000000000000 R09: ffff880037f87d78
[  355.666496] R10: ffff880037ed7000 R11: dead000000200200 R12: ffff88003e148000
[  355.666499] R13: 0000000000000400 R14: ffff880037e73d28 R15: 0000000000000400
[  355.666501] FS:  0000000000000000(0000) GS:ffff880001880000(0000)
knlGS:0000000000000000
[  355.666504] CS:  0010 DS: 0000 ES: 0000 CR0: 000000008005003b
[  355.666506] CR2: 00007fff8e261540 CR3: 0000000037f97000 CR4: 00000000000006e0
[  355.666508] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
[  355.666510] DR3: 0000000000000000 DR6: 00000000ffff0ff0 DR7: 0000000000000400
[  355.666513] Process loop0 (pid: 2115, threadinfo ffff880037f86000,
task ffff88003b432a70)
[  355.666515] Stack:
[  355.666516]  ffff880037f87de0 ffffffff810ddf3f ffff880037f87de0
00000400811d6eb6
[  355.666520] <0> ffffffff81046ec7 ffff880038f91e20 0000000000000400
ffff88003e148000
[  355.666524] <0> 0000000000000400 ffff880037e73d28 0000000000000400
ffffffff812aa2aa
[  355.666528] Call Trace:
[  355.666533]  [<ffffffff810ddf3f>] ? splice_from_pipe_feed+0x81/0xcb
[  355.666537]  [<ffffffff81046ec7>] ? online_cpus+0x13/0x1c
[  355.666541]  [<ffffffff812aa2aa>] ? do_lo_send_aops+0x98/0x175
[  355.666544]  [<ffffffff81046c32>] ? finish_task_switch.clone.38+0x30/0x85
[  355.666547]  [<ffffffff812aa46a>] ? do_bio_filebacked+0xe3/0x21c
[  355.666550]  [<ffffffff812aa212>] ? do_lo_send_aops+0x0/0x175
[  355.666555]  [<ffffffff81483ca5>] ? _raw_spin_lock_irqsave+0x9/0x2e
[  355.666557]  [<ffffffff812aa7a0>] ? loop_thread+0x1fd/0x237
[  355.666561]  [<ffffffff8105fc9b>] ? autoremove_wake_function+0x0/0x2a
[  355.666564]  [<ffffffff812aa5a3>] ? loop_thread+0x0/0x237
[  355.666567]  [<ffffffff8105f891>] ? kthread+0x75/0x7d
[  355.666570]  [<ffffffff81022654>] ? kernel_thread_helper+0x4/0x10
[  355.666573]  [<ffffffff8105f81c>] ? kthread+0x0/0x7d
[  355.666576]  [<ffffffff81022650>] ? kernel_thread_helper+0x0/0x10
[  355.666578] Code: 5e c3 41 57 49 89 d7 41 56 41 55 41 54 55 53 48
89 fb 48 83 ec 28 48 89 f7 48 8b 43 18 89 4c 24 1c 48 8b 68 10 41 f6
c0 01 75 02 <0f> 0b 44 89 c2 4c 89 4c 24 08 83 e2 04 4c 89 fe 41 bc f4
ff ff
[  355.666607] RIP  [<ffffffff8113b0df>] reiser4_write_begin_careful+0x29/0x1b3
[  355.666611]  RSP <ffff880037f87cd0>
[  355.666613] ---[ end trace c57bc9a07b4d0bcf ]---
[  355.666626] kjournald starting.  Commit interval 5 seconds

fsck said the reiser4 fs is clear. I tried to create another r4
partition and move everything there with tar, but that didn't fix the
issue. The image mounts fine on another pc with plain ubuntu kernel
and ext3 on /.

$ uname -srv
Linux 2.6.35.1+ #10 ZEN SMP PREEMPT Thu Dec 23 18:14:45 MSK 2010
$ file disk
disk: Linux rev 1.0 ext3 filesystem data
$ fsck.reiser4 --version
fsck.reiser4 1.0.7
Copyright (C) 2001-2005 by Hans Reiser, licensing governed by
reiser4progs/COPYING.
