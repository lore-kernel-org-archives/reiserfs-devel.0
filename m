From: Grant Miner <mine0057@mrs.umn.edu>
Subject: Re: Autoconf error
Date: Wed, 30 Jul 2003 13:45:49 -0500
Message-ID: <3F28125D.8040802@mrs.umn.edu>
References: <3F255543.8010409@mrs.umn.edu>	<3F255920.3070804@mrs.umn.edu>	<1059455220.7235.13.camel@haron.namesys.com>	<1059459151.14479.5.camel@localhost>	<1059459291.27547.3.camel@haron.namesys.com>	<1059460212.1881.1.camel@localhost>	<1059460229.10291.0.camel@haron.namesys.com>	<3F26C062.4070409@mrs.umn.edu>	<1059542267.14095.11.camel@haron.namesys.com> <16168.4042.555742.436499@laputa.namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-15115-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <16168.4042.555742.436499@laputa.namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Nikita Danilov <Nikita@namesys.com>, reiserfs-list@namesys.com


> Very interesting. Is there anything in the logs (/var/log/messages), or
> on the console?
> 
> Can you compile with  Kernel-Hacking/Magic-Sysrq turned on, press
> sysrq-T on lock up and send us its output?
The first time I try that, I get an oops (see below).  And init goes 
into runlevel 5 for some reason.  Second time, cat freezes up.

  Unable to handle kernel NULL pointer dereference at virtual address
00000000
printing eip:
c021c724
*pde = 00000000
Oops: 0002 [#1]
CPU:    0
EIP:    0060:[<c021c724>]    Not tainted
EFLAGS: 00010202
EIP is at reiser4_setattr+0x64/0xf0
eax: 00000000   ebx: 00000000   ecx: deee5c00   edx: 00000000
esi: de4cc108   edi: d30e9980   ebp: cf6dfd88   esp: cf6dfd80
ds: 007b   es: 007b   ss: 0068
Process bash (pid: 1569, threadinfo=cf6de000 task=d594f380)
Stack: de4cc108 cf6dfe48 00000000 00000000 00000000 00000000 00000000
00000000
00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
Jul 30 11:37:14 uber login(pam_unix)[1030]: session closed for user root
00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
Call Trace:
[<c016ebe1>] notify_change+0x201/0x260
[<c02387f0>] update_ugid+0x90/0xb0
[<c024a7b4>] vsscanf+0x274/0x4a0
[<c024a9ff>] sscanf+0x1f/0x24
[<c023886d>] get_uid+0x5d/0x70
[<c023c689>] write_pseudo+0x69/0xb0
[<c02063ba>] init_context+0x9a/0xd0
[<c021d1dd>] reiser4_write+0x8d/0x100
[<c021d150>] reiser4_write+0x0/0x100
[<c0152d3c>] vfs_write+0xdc/0x150
[<c0152e62>] sys_write+0x42/0x70
[<c010accb>] syscall_call+0x7/0xb
Code: 83 08 04 89 2c 24 e8 61 9d fe ff 89 d8 8b b4 24 8c 00 00 00


