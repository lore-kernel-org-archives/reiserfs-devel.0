From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: Reproducible multithreaded reiser4 bug amd64
Date: Thu, 09 Sep 2010 21:21:03 +0200
Message-ID: <4C89339F.9090603@gmail.com>
References: <AANLkTi=R-+sduBs-VApyoZXSat0pmAN8N4_tk5MRNcMf@mail.gmail.com> <AANLkTi=LRQVJMJchHcirk5EquWqURqgCq=6+AwUuTBQ2@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from
         :user-agent:mime-version:to:cc:subject:references:in-reply-to
         :content-type:content-transfer-encoding;
        bh=Ksu8/7/3VWPIY+W7jQRH3iq4h8zuUVuvWsm+gZXiRAo=;
        b=mW7kzOfxeylEt6I9oQrYEO11r4GA1UszKvOJse+iXJeVcb2P9oCHHgeLVjzP1WJdaf
         avCsBY24q2nlv9wm90oGnUj/fJJcy9J/yyawD16xbjFg9WefNrvqMuXHqmwVq2YTKm9n
         sno2Jnxg62mf8YdEyEfqmq980dUsE+SpKbBpQ=
In-Reply-To: <AANLkTi=LRQVJMJchHcirk5EquWqURqgCq=6+AwUuTBQ2@mail.gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: =?UTF-8?B?0K7RgNC40Lkg0JfQsNC40LrQuNC9?= <yzaikin@gmail.com>
Cc: reiserfs-devel@vger.kernel.org

Hello.

Yes, I know about this problem.

I think this is because a new address space operation ->write_end()
is implemented incorrectly in reiser4 (for both file plugins, unix_file
and cryptcompress). This aop should update file size in some cases
(when write position + amount to write > file size), while reiser4 does=
n't
bother with this. In particular, this leads to improper capture of page=
s
by transaction manager.

I'll prepare the fixup at the end of my vacations (after Sep 25).
In the 2.6.34-based stuff this problem is not so annoying for mysteriou=
s
reasons, so please, downgrade your kernel for now if possible..

Thanks for the report.
Edward.


=D0=AE=D1=80=D0=B8=D0=B9 =D0=97=D0=B0=D0=B8=D0=BA=D0=B8=D0=BD wrote:
> Hi,
> I'm running helium-sources patchset
> (http://hirakendu.mooo.com/helium-sources/2.6.35-helium0) on amd64
> Gentoo Linux stable on AMD Phenom II X3 cpu. Every time I try to comp=
ile
> openoffice in 3 threads using reiser 4 partition I get the following
> kernel error and always in the same place, specifically where some ja=
va
> part of openoffice is being compiled (kernel config, full dmesg
> attached):
>
> [ 3820.957906] BUG: unable to handle kernel NULL pointer dereference =
at
> 0000000000000050
> [ 3820.957910] IP: [<ffffffff814af285>] _raw_spin_lock+0x5/0x20
> [ 3820.957916] PGD 4ae65067 PUD 0
> [ 3820.957919] Oops: 0002 [#1] SMP
> [ 3820.957921] last sysfs
> file: /sys/devices/pci0000:00/0000:00:11.0/host0/target0:0:0/0:0:0:0/=
block/sda/uevent
> [ 3820.957923] CPU 0
> [ 3820.957924] Modules linked in: it87 hwmon_vid snd_pcm_oss
> snd_mixer_oss 8250_pnp firewire_ohci 8250 firewire_core serial_core
> k10temp hwmon
> [ 3820.957931]
> [ 3820.957934] Pid: 11617, comm: java Not tainted 2.6.35-helium #1
> GA-MA790X-UD4/GA-MA790X-UD4
> [ 3820.957936] RIP: 0010:[<ffffffff814af285>]  [<ffffffff814af285>]
> _raw_spin_lock+0x5/0x20
> [ 3820.957939] RSP: 0018:ffff8800ac8edaf0  EFLAGS: 00010292
> [ 3820.957941] RAX: 0000000000000100 RBX: ffff8800ac8edbc8 RCX:
> 0000000000000010
> [ 3820.957942] RDX: 000000000000006e RSI: ffff88006ba37508 RDI:
> 0000000000000050
> [ 3820.957944] RBP: ffff88006ba37508 R08: 0000000000000026 R09:
> 0000000000000026
> [ 3820.957945] R10: ffff880048c810d0 R11: 0000000000000026 R12:
> 0000000000000000
> [ 3820.957947] R13: ffff88006ba37508 R14: ffff8800ac8edbc8 R15:
> 0000000000000000
> [ 3820.957949] FS:  00002ab1018b3710(0000) GS:ffff880028200000(0000)
> knlGS:00000000f6160700
> [ 3820.957950] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [ 3820.957952] CR2: 0000000000000050 CR3: 00000000ba04b000 CR4:
> 00000000000006f0
> [ 3820.957953] DR0: 0000000000000000 DR1: 0000000000000000 DR2:
> 0000000000000000
> [ 3820.957955] DR3: 0000000000000000 DR6: 00000000ffff0ff0 DR7:
> 0000000000000400
> [ 3820.957957] Process java (pid: 11617, threadinfo ffff8800ac8ec000,
> task ffff88010af5dbe0)
> [ 3820.957958] Stack:
> [ 3820.957959]  ffffffff81157336 0000000000000000 ffffffff81146070
> ffff880048c810c0
> [ 3820.957962] <0> ffff8800ac8edbc8 ffff88006ba37508 ffffea0003c19040
> ffff88006ba37508
> [ 3820.957964] <0> ffff8800ac8edbc8 0000000000000000 ffffffff8115aa34
> 0000000000000000
> [ 3820.957967] Call Trace:
> [ 3820.957971]  [<ffffffff81157336>] ? checkin_logical_cluster
> +0x36/0x210
> [ 3820.957975]  [<ffffffff81146070>] ? reiser4_get_file_fsdata+0x60/0=
xb0
> [ 3820.957977]  [<ffffffff8115aa34>] ? capture_page_cluster+0x84/0x15=
0
> [ 3820.957981]  [<ffffffff8112b6c9>] ? reiser4_preempt_point+0x9/0x30
> [ 3820.957983]  [<ffffffff8115ac00>] ? write_end_cryptcompress
> +0x100/0x2a0
> [ 3820.957985]  [<ffffffff81155d42>] ? reiser4_write_end_careful
> +0xb2/0x1f0
> [ 3820.957989]  [<ffffffff810f6122>] ? pipe_to_file+0x162/0x1a0
> [ 3820.957992]  [<ffffffff81042c8e>] ? current_fs_time+0x1e/0x30
> [ 3820.957994]  [<ffffffff810f5fc0>] ? pipe_to_file+0x0/0x1a0
> [ 3820.957996]  [<ffffffff810f4a90>] ? splice_from_pipe_feed+0x60/0xf=
0
> [ 3820.957998]  [<ffffffff810f5f3a>] ? generic_file_splice_write
> +0xfa/0x180
> [ 3820.958001]  [<ffffffff810f5d6b>] ? direct_splice_actor+0x1b/0x20
> [ 3820.958003]  [<ffffffff810f5578>] ? splice_direct_to_actor+0xc8/0x=
1b0
> [ 3820.958003]  [<ffffffff810f5d50>] ? direct_splice_actor+0x0/0x20
> [ 3820.958003]  [<ffffffff810f56d5>] ? do_splice_direct+0x75/0x90
> [ 3820.958003]  [<ffffffff810d3f9e>] ? do_sendfile+0x19e/0x200
> [ 3820.958003]  [<ffffffff810d4089>] ? sys_sendfile64+0x89/0xb0
> [ 3820.958003]  [<ffffffff810023ab>] ? system_call_fastpath+0x16/0x1b
> [ 3820.958003] Code: 00 75 05 f0 66 0f b1 17 0f 94 c2 0f b6 c2 85 c0 =
0f
> 95 c0 0f b6 c0 c3 66 66 66 66 66 66 2e 0f 1f 84 00 00 00 00 00 b8 00 =
01
> 00 00 <f0> 66 0f c1 07 38 e0 74 06 f3 90 8a 07 eb f6 c3 66 66 2e 0f 1=
f
> [ 3820.958003] RIP  [<ffffffff814af285>] _raw_spin_lock+0x5/0x20
> [ 3820.958003]  RSP <ffff8800ac8edaf0>
> [ 3820.958003] CR2: 0000000000000050
> [ 3820.958048] ---[ end trace 854f280adc0057e0 ]---
>
>
> And I did fsck --fix between runs.
>
> Thanks,
> Yurii
>  =20

--
To unsubscribe from this list: send the line "unsubscribe reiserfs-deve=
l" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
