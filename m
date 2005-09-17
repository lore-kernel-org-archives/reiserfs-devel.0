From: "Dr.Dre" <pharon@gmail.com>
Subject: Kernel bug 2.6.14-rc1-mm1 4Kstacks preempt smp
Date: Sat, 17 Sep 2005 04:59:40 +0300
Message-ID: <5d8b7b9050916185945e83609@mail.gmail.com>
Reply-To: pharon@gmail.com
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-26011-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

I have a bug report for reiser4 in 2.6.14-rc1-mm1 with 4k stacks,
preempt and smp.
firefox has triggerred the bug twice and I had to fsck the filesystem
with --fix --build-fs



------------[ cut here ]------------
kernel BUG at <bad filename>:59883!
invalid operand: 0000 [#1]
PREEMPT SMP
last sysfs file: /class/sound/seq/dev
Modules linked in: snd_seq_instr snd_seq_midi_emul snd_seq_midi
snd_seq_midi_event snd_seq firmware_class nls_utf8 nls_cp864 vfat fat
nls_base af_packet joydev tsdev ohci_hcd ehci_hcd yealink usbhid
mousedev nvidia snd_pcm_oss snd_mixer_oss video via_rhine uhci_hcd
usbcore tpm_nsc tpm_infineon tpm_atmel tpm thermal speedstep_lib
snd_cmipci gameport snd_pcm snd_page_alloc snd_opl3_lib snd_timer
snd_hwdep snd_mpu401_uart snd_rawmidi snd_seq_device snd soundcore
shpchp pci_hotplug rtc processor loop intel_agp agpgart i2c_i801
i2c_core fan cpufreq_userspace cpufreq_stats freq_table
cpufreq_powersave cpufreq_ondemand cpufreq_conservative container
button battery
CPU:    0
EIP:    0060:[<c01d56fb>]    Tainted: P      VLI
EFLAGS: 00010297   (2.6.14-rc1-mm1)
EIP is at sub_from_ctx_grabbed+0x2b/0x30
eax: 00000000   ebx: 00000000   ecx: 00000001   edx: 00000000
esi: d24deec0   edi: df69e800   ebp: d50fc9e0   esp: cea25d8c
ds: 007b   es: 007b   ss: 0068
Process firefox-bin (pid: 10393, threadinfo=3Dcea25000 task=3Dde659050)
Stack: 00000001 00000000 c01d63c0 d24deec0 00000001 00000000 de202680 d50fc=
9e0
       d50fc9e0 ce6cb8d4 c01d8594 d50fc9e0 00000001 00000000 de202680 d50fc=
9e0
       de2026b4 c01d85e7 de202680 d50fc9e0 00000000 de202680 c01d861e de202=
680
Call Trace:
 [<c01d63c0>] grabbed2flush_reserved_nolock+0x30/0x70
 [<c01d8594>] do_jnode_make_dirty+0xf4/0x120
 [<c01d85e7>] jnode_make_dirty_locked+0x27/0x40
 [<c01d861e>] znode_make_dirty+0x1e/0x90
 [<c01ef1b5>] update_sd_at+0xc5/0x1f0
 [<c01ef32d>] update_sd+0x4d/0x70
 [<c01ee5fb>] write_sd_by_inode_common+0x8b/0x90
 [<c01e37c8>] reiser4_dirty_inode+0x18/0x70
 [<c0180883>] __mark_inode_dirty+0xb3/0x190
 [<c01784c4>] update_atime+0x54/0x80
 [<c01f1aee>] read_unix_file+0x35e/0x3c0
 [<c015d316>] vfs_read+0xa6/0x140
 [<c015d64d>] sys_read+0x3d/0x70
 [<c0102d7b>] sysenter_past_esp+0x54/0x79
Code: 56 53 8b 74 24 0c 8b 5c 24 14 8b 4c 24 10 8b 56 78 8b 46 74 39
da 76 0d 29 c8 19 da 89 46 74 89 56 78 5b 5e c3 72 04 39 c8 73 ed <0f>
0b eb e9 90 8b 4c 24 04 8b 41 74 8b 51 78 03 44 24 08 13 54
 <6>note: firefox-bin[10393] exited with preempt_count 3


Please request any extra info you need.

Thanks and keep up the good work.
