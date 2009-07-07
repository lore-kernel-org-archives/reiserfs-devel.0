From: Michael Uleysky <uleysky@gmail.com>
Subject: Re: Oops: Null pointer dereference in ReiserFS when under heavy load.
Date: Tue, 7 Jul 2009 17:46:20 +1100
Message-ID: <b1fc7e270907062346x307a6cd7k7102eeb34e89d7a4@mail.gmail.com>
References: <4A50B439.3040101@free.fr>
	 <alpine.DEB.2.01.0907062053570.6439@bogon>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :date:message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=OKFn7mvORiflsCuE01iO67JkQrLQF3N7ap0OrTojIMY=;
        b=xSzpsM9g3eD/qElzm67Pm4QNlWAgMXPZKIMw0aHXIPY8euMYh3vs2wOrTRGjF2l37o
         U+F4oV55q7xCtKFltUVkXNBf8+HI1+2RSlM3haACwHCUF19pPdn9wXYplGpnhxNpe4hR
         TaSd0vKzIQV0/CDqTINp4IjlCbHVh836N4UsU=
In-Reply-To: <alpine.DEB.2.01.0907062053570.6439@bogon>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Christian Kujau <lists@nerdbynature.de>
Cc: =?ISO-8859-1?Q?J=E9r=F4me_M=2E_Berger?= <jeberger@free.fr>, reiserfs-devel@vger.kernel.org

2009/7/7, Christian Kujau <lists@nerdbynature.de>:
> On Sun, 5 Jul 2009, "J=E9r=F4me M. Berger" wrote:
>  > > Jun 15 23:18:02 rover kernel: BUG: unable to handle kernel NULL =
pointer
>  > > dereference at 0000000000000018
>  > > Jun 15 23:18:02 rover kernel: IP: [<ffffffff80227a85>]
>  > > __ticket_spin_lock+0x5/0x20
>
>  Hm, this looks like http://bugzilla.kernel.org/show_bug.cgi?id=3D135=
56 to
>  me, maybe it's the same issue?
>
>  If so: @Michael, do you still experience these oopses or has the bug
>  somehow magically resolved for you?
Bug is rock stable :(. Below the latest oops from kernel 2.6.30.1.
Configuration is same as in my report.


BUG: unable to handle kernel NULL pointer dereference at 00000000000000=
18
IP: [<ffffffff805c456a>] _spin_lock_irq+0xa/0x20
PGD 7a939067 PUD 7a8a1067 PMD 0
Oops: 0002 [#1] SMP
last sysfs file: /sys/kernel/uevent_seqnum
CPU 0
Pid: 1551, comm: reiserfs/0 Not tainted 2.6.30.1-netconsole #1 EP45T-DS=
3
RIP: 0010:[<ffffffff805c456a>]  [<ffffffff805c456a>] _spin_lock_irq+0xa=
/0x20
RSP: 0018:ffff88007e157d30  EFLAGS: 00010082
RAX: 0000000000000100 RBX: ffffe200016e00f8 RCX: 0000000000000001
RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000000000018
RBP: ffff88007e157d30 R08: ffff88007f986c00 R09: 000000000afd1261
R10: 0000000000000000 R11: 0000000000000000 R12: 0000000000000000
R13: 0000000000000000 R14: 0000000000000018 R15: ffff88007f986c00
=46S:  0000000000000000(0000) GS:ffff880001010000(0000) knlGS:000000000=
0000000
CS:  0010 DS: 0018 ES: 0018 CR0: 000000008005003b
CR2: 0000000000000018 CR3: 000000007f9f6000 CR4: 00000000000406e0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000ffff0ff0 DR7: 0000000000000400
Process reiserfs/0 (pid: 1551, threadinfo ffff88007e156000, task
ffff88007ed49bd0)
Stack:
 ffff88007e157d60 ffffffff802c19a0 ffff880067922930 0000000000000000
 ffff88007d318180 0000000000000000 ffff88007e157d80 ffffffff802c1a96
 0000000000000000 ffffc200098d94c0 ffff88007e157e00 ffffffff80316a03
Call Trace:
 [<ffffffff802c19a0>] __set_page_dirty+0x30/0xd0
 [<ffffffff802c1a96>] mark_buffer_dirty+0x56/0xa0
 [<ffffffff80316a03>] flush_commit_list+0x713/0x720
 [<ffffffff805c2231>] ? thread_return+0x3e/0x66d
 [<ffffffff803165ee>] flush_commit_list+0x2fe/0x720
 [<ffffffff80316b24>] flush_async_commits+0x54/0x70
 [<ffffffff80316ad0>] ? flush_async_commits+0x0/0x70
 [<ffffffff8024b6cc>] worker_thread+0x11c/0x1f0
 [<ffffffff8024fa20>] ? autoremove_wake_function+0x0/0x40
 [<ffffffff8024b5b0>] ? worker_thread+0x0/0x1f0
 [<ffffffff8024b5b0>] ? worker_thread+0x0/0x1f0
 [<ffffffff8024f616>] kthread+0x56/0x90
 [<ffffffff8020c2ba>] child_rip+0xa/0x20
 [<ffffffff8024f5c0>] ? kthread+0x0/0x90
 [<ffffffff8020c2b0>] ? child_rip+0x0/0x20
Code: 90 55 48 89 e5 9c 58 fa ba 00 01 00 00 f0 66 0f c1 17 38 f2 74
06 f3 90 8a 17 eb f6 c9 c3 66 66 90 55 48 89 e5 fa b8 00 01 00 00 <f0>
66 0f c1 07 38 e0 74 06 f3 90 8a 07 eb f6 c9 c3 66 66 90 66
RIP  [<ffffffff805c456a>] _spin_lock_irq+0xa/0x20
 RSP <ffff88007e157d30>
CR2: 0000000000000018
---[ end trace 0c4afebe89587152 ]---
------------[ cut here ]------------
WARNING: at kernel/exit.c:896 do_exit+0x601/0x730()
Hardware name: EP45T-DS3
Pid: 1551, comm: reiserfs/0 Tainted: G      D    2.6.30.1-netconsole #1
Call Trace:
 [<ffffffff8023d811>] ? do_exit+0x601/0x730
 [<ffffffff80239b43>] warn_slowpath_common+0x73/0xc0
 [<ffffffff80239b9f>] warn_slowpath_null+0xf/0x20
 [<ffffffff8023d811>] do_exit+0x601/0x730
 [<ffffffff8020f5db>] oops_end+0x9b/0xa0
 [<ffffffff80226c48>] no_context+0xe8/0x260
 [<ffffffff8023017a>] ? dequeue_task_fair+0x4a/0x1d0
 [<ffffffff80226f05>] __bad_area_nosemaphore+0x145/0x1e0
 [<ffffffff805c2261>] ? thread_return+0x6e/0x66d
 [<ffffffff803c108e>] ? cfq_insert_request+0x37e/0x3a0
 [<ffffffff80226fae>] bad_area_nosemaphore+0xe/0x10
 [<ffffffff80227337>] do_page_fault+0x1c7/0x280
 [<ffffffff805c4a7f>] page_fault+0x1f/0x30
 [<ffffffff805c456a>] ? _spin_lock_irq+0xa/0x20
 [<ffffffff802c19a0>] __set_page_dirty+0x30/0xd0
 [<ffffffff802c1a96>] mark_buffer_dirty+0x56/0xa0
 [<ffffffff80316a03>] flush_commit_list+0x713/0x720
 [<ffffffff805c2231>] ? thread_return+0x3e/0x66d
 [<ffffffff803165ee>] flush_commit_list+0x2fe/0x720
 [<ffffffff80316b24>] flush_async_commits+0x54/0x70
 [<ffffffff80316ad0>] ? flush_async_commits+0x0/0x70
 [<ffffffff8024b6cc>] worker_thread+0x11c/0x1f0
 [<ffffffff8024fa20>] ? autoremove_wake_function+0x0/0x40
 [<ffffffff8024b5b0>] ? worker_thread+0x0/0x1f0
 [<ffffffff8024b5b0>] ? worker_thread+0x0/0x1f0
 [<ffffffff8024f616>] kthread+0x56/0x90
 [<ffffffff8020c2ba>] child_rip+0xa/0x20
 [<ffffffff8024f5c0>] ? kthread+0x0/0x90
 [<ffffffff8020c2b0>] ? child_rip+0x0/0x20
---[ end trace 0c4afebe89587153 ]---

Michael Uleysky
--
To unsubscribe from this list: send the line "unsubscribe reiserfs-deve=
l" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
