From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: bug report: reiser4 + kde4
Date: Mon, 17 Dec 2007 05:05:54 +0300
Message-ID: <4765D982.9010603@gmail.com>
References: <20071122101615.178410@gmx.net> <200712151827.02309.volker.armin.hemmann@tu-clausthal.de> <200712152015.32737.volker.armin.hemmann@tu-clausthal.de>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <200712152015.32737.volker.armin.hemmann@tu-clausthal.de>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: "Hemmann, Volker Armin" <volker.armin.hemmann@tu-clausthal.de>
Cc: reiserfs-devel@vger.kernel.org

I have some progress in installing kde4 on my box ;)
Hope I'll able to reproduce it.

Thanks,
Edward.

Hemmann, Volker Armin wrote:

>here some more usefull output:
>
>[   86.385269] Unable to handle kernel NULL pointer dereference at=20
>00000000000000f9 RIP:
>[   86.385273]  [<ffffffff802ebf2a>] reiser4_tree_by_inode+0x0/0xc
>[   86.385279] PGD 779ce067 PUD 779cf067 PMD 0
>[   86.385281] Oops: 0000 [1] SMP
>[   86.385283] CPU 1
>[   86.385285] Modules linked in: k8temp w83627ehf hwmon_vid hwmon i2c=
_core=20
>snd_seq_midi snd_emu10k1_synth snd_emux_synth snd_seq_virmidi=20
>snd_seq_midi_emul snd_pcm_oss snd_mixer_oss snd_seq_oss snd_seq_midi_e=
vent=20
>snd_seq snd_emu10k1 snd_rawmidi snd_ac97_codec ac97_bus snd_pcm=20
>snd_seq_device snd_timer snd_page_alloc snd_util_mem snd_hwdep snd r81=
69
>[   86.385297] Pid: 4080, comm: kded4 Not tainted 2.6.23.9reiser4 #4
>[   86.385299] RIP: 0010:[<ffffffff802ebf2a>]  [<ffffffff802ebf2a>]=20
>reiser4_tree_by_inode+0x0/0xc
>[   86.385302] RSP: 0018:ffff8100779d7b90  EFLAGS: 00010292
>[   86.385303] RAX: 0000000000000001 RBX: 0000000000000000 RCX:=20
>ffff8100779d7d78
>[   86.385305] RDX: 0000000000000000 RSI: 0000000000000000 RDI:=20
>0000000000000001
>[   86.385306] RBP: 0000000000000000 R08: 0000000000000003 R09:=20
>ffff8100774387b0
>[   86.385308] R10: c0000000000000fa R11: ffffffff802f26e6 R12:=20
>ffff810077438738
>[   86.385310] R13: ffff8100774386c0 R14: 00000000006d6090 R15:=20
>0000000000000000
>[   86.385311] FS:  00002acd1b378330(0000) GS:ffff81007ff3bec0(0000)=20
>knlGS:0000000000000000
>[   86.385313] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
>[   86.385314] CR2: 00000000000000f9 CR3: 00000000779cd000 CR4:=20
>00000000000006e0
>[   86.385316] DR0: 0000000000000000 DR1: 0000000000000000 DR2:=20
>0000000000000000
>[   86.385318] DR3: 0000000000000000 DR6: 00000000ffff0ff0 DR7:=20
>0000000000000400
>[   86.385320] Process kded4 (pid: 4080, threadinfo ffff8100779d6000, =
task=20
>ffff81007d6ed8a0)
>[   86.385321] Stack:  ffffffff80308779 ffff810000000001 ffff8100779d7=
d78=20
>00000000006d6090
>[   86.385324]  ffff8100779d7c68 ffff8100779d7c48 0000000000000001=20
>ffff81007b7f6ef8
>[   86.385327]  ffffffff802e0522 ffff810077438738 0000000100000001=20
>0000017500000000
>[   86.385329] Call Trace:
>[   86.385332]  [<ffffffff80308779>] reiser4_write_extent+0x36/0x577
>[   86.385336]  [<ffffffff802e0522>] reiser4_txn_end+0x49a/0x4e9
>[   86.385343]  [<ffffffff802f4fbd>] setattr_unix_file+0x174/0x32e
>[   86.385348]  [<ffffffff802dca2d>] _reiser4_init_context+0x72/0xa3
>[   86.385351]  [<ffffffff802f76cc>] reiser4_setattr_careful+0x100/0x1=
25
>[   86.385354]  [<ffffffff802895ed>] notify_change+0x122/0x235
>[   86.385358]  [<ffffffff80276502>] do_truncate+0x5e/0x79
>[   86.385360]  [<ffffffff8027ede2>] getname+0x14c/0x18d
>[   86.385363]  [<ffffffff8027675f>] sys_truncate+0x144/0x166
>[   86.385365]  [<ffffffff80268e8c>] do_mmap_pgoff+0x29d/0x2fd
>[   86.385370]  [<ffffffff8044273d>] error_exit+0x0/0x84
>[   86.385373]  [<ffffffff8020b66e>] system_call+0x7e/0x83
>[   86.385375]
>[   86.385376]
>[   86.385377] Code: 48 8b bf f8 00 00 00 e9 5a d8 ff ff 48 b8 ff ff f=
f ff ff=20
>ff
>[   86.385382] RIP  [<ffffffff802ebf2a>] reiser4_tree_by_inode+0x0/0xc
>[   86.385385]  RSP <ffff8100779d7b90>
>[   86.385386] CR2: 00000000000000f9
>[   86.385902] reiser4[kded4(4080)]: release_unix_file=20
>(fs/reiser4/plugin/file/file.c:2373)[vs-44]:
>[   86.385904] WARNING: out of memory?
>[   86.385914] reiser4[kded4(4080)]: release_unix_file=20
>(fs/reiser4/plugin/file/file.c:2373)[vs-44]:
>[   86.385915] WARNING: out of memory?
>[   86.385922] reiser4[kded4(4080)]: release_unix_file=20
>(fs/reiser4/plugin/file/file.c:2373)[vs-44]:
>[   86.385923] WARNING: out of memory?
>[   86.385930] reiser4[kded4(4080)]: release_unix_file=20
>(fs/reiser4/plugin/file/file.c:2373)[vs-44]:
>[   86.385931] WARNING: out of memory?
>[   86.385938] reiser4[kded4(4080)]: release_unix_file=20
>(fs/reiser4/plugin/file/file.c:2373)[vs-44]:
>[   86.385940] WARNING: out of memory?
>[   86.385947] reiser4[kded4(4080)]: release_unix_file=20
>(fs/reiser4/plugin/file/file.c:2373)[vs-44]:
>[   86.385948] WARNING: out of memory?
>[   86.385955] reiser4[kded4(4080)]: release_unix_file=20
>(fs/reiser4/plugin/file/file.c:2373)[vs-44]:
>[   86.385956] WARNING: out of memory?
>[   86.385963] reiser4[kded4(4080)]: release_unix_file=20
>(fs/reiser4/plugin/file/file.c:2373)[vs-44]:
>[   86.385964] WARNING: out of memory?
>[   86.385971] reiser4[kded4(4080)]: release_unix_file=20
>(fs/reiser4/plugin/file/file.c:2373)[vs-44]:
>[   86.385972] WARNING: out of memory?
>[   86.385979] reiser4[kded4(4080)]: release_unix_file=20
>(fs/reiser4/plugin/file/file.c:2373)[vs-44]:
>[   86.385981] WARNING: out of memory?
>[   86.385987] reiser4[kded4(4080)]: release_unix_file=20
>(fs/reiser4/plugin/file/file.c:2373)[vs-44]:
>[   86.385989] WARNING: out of memory?
>[   86.385996] reiser4[kded4(4080)]: release_unix_file=20
>(fs/reiser4/plugin/file/file.c:2373)[vs-44]:
>[   86.385997] WARNING: out of memory?
>[   86.386362] reiser4[kded4(4080)]: release_unix_file=20
>(fs/reiser4/plugin/file/file.c:2373)[vs-44]:
>[   86.386363] WARNING: out of memory?
>
>also, with reiser4 debugging turned on, kernel panics when starting KD=
E4.
>
>Gl=FCck Auf
>Volker
>-
>To unsubscribe from this list: send the line "unsubscribe reiserfs-dev=
el" in
>the body of a message to majordomo@vger.kernel.org
>More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
> =20
>

-
To unsubscribe from this list: send the line "unsubscribe reiserfs-deve=
l" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
