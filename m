From: Mickael Marchand <marchand@kde.org>
Subject: 2.6.12-rc5 => OOPS
Date: Mon, 27 Jun 2005 08:26:03 +0200
Message-ID: <42BF9BFB.8070206@kde.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-24670-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

Hi,

seems one of my server (amd64/bi-opteron) running reiser4 on top of
raid6 software oops-ed this week-end,
here is the output, maybe it's usefull for you.

the config can be downloaded from
http://www-fourier.ujf-grenoble.fr/~mmarcha/config-2.6.12-rc5

tell me if you need more infos.

I will upgrade to 2.6.12 today probably.

Cheers,
Mik
(please CC me)

general protection fault: 0000 [1] SMP
CPU 0
Modules linked in: w83627hf i2c_dev lp ipv6 parport_pc parport ehci_hcd
eth1394 uhci_hcd ohci1394 ieee1394 ohci_hcd usbcore snd_intel8x0
snd_ac97_codec snd_pcm snd_timer snd snd_page_alloc i2c_amd756
i2c_amd8111 i2c_isa w83781d i2c_sensor i2c_core e1000
Pid: 4773, comm: cp Not tainted 2.6.12-rc5
RIP: 0010:[<ffffffff8021d748>] <ffffffff8021d748>{dir_readdir_init+168}
RSP: 0018:ffff810035c19ca8  EFLAGS: 00010246
RAX: ffff810024a68e00 RBX: ffff8100baa3fca0 RCX: ffff810035d8b1c0
RDX: 2b65394676347178 RSI: 00000000000000d0 RDI: ffff8100baa3fb80
RBP: ffff8100c14bcb80 R08: 0000000000000211 R09: 0000000002e976a0
R10: 0000000000001b10 R11: 0000000000000246 R12: ffff810035d8b180
R13: ffff8100baa3fb80 R14: ffff810035c19cf0 R15: ffff810035c19cf8
FS:  00002aaaab00b4a0(0000) GS:ffffffff806efbc0(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 0000000002eacd88 CR3: 000000008b4ab000 CR4: 00000000000006e0
Process cp (pid: 4773, threadinfo ffff810035c18000, task ffff8100c167a2b0)
Stack: ffff810097af1a30 ffff810035c19d48 ffff8100c14bcb80 ffff810035c19d88
       ffff810035c19cf8 ffff8100baa3fca0 ffffffff8018e930 ffffffff8021d85d
       ffff810035c19f38 ffff81007d60bbb8
Call Trace:<ffffffff8018e930>{filldir64+0}
<ffffffff8021d85d>{readdir_common+157}
       <ffffffff80184e7f>{inode_get_bytes+63}
<ffffffff801fe8a9>{reiser4_getattr+169}
       <ffffffff8018e930>{filldir64+0}
<ffffffff801feef3>{reiser4_readdir+115}
       <ffffffff8018e5f7>{vfs_readdir+119}
<ffffffff8018eaa2>{sys_getdents64+130}
       <ffffffff8018dc43>{sys_fcntl+83} <ffffffff8010e92a>{system_call+126}


Code: 48 89 0a 48 89 51 08 90 49 8d 44 24 10 4c 89 ef 49 89 06 e8
RIP <ffffffff8021d748>{dir_readdir_init+168} RSP <ffff810035c19ca8>
