From: Christian Kujau <lists@nerdbynature.de>
Subject: Re: Oops: Null pointer dereference in ReiserFS when under heavy
 load.
Date: Mon, 6 Jul 2009 20:57:39 -0700 (PDT)
Message-ID: <alpine.DEB.2.01.0907062053570.6439@bogon>
References: <4A50B439.3040101@free.fr>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <4A50B439.3040101@free.fr>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="utf-8"
To: =?UTF-8?Q?J=C3=A9r=C3=B4me_M=2E_Berger?= <jeberger@free.fr>
Cc: reiserfs-devel@vger.kernel.org, uleysky@gmail.com

On Sun, 5 Jul 2009, "J=C3=A9r=C3=B4me M. Berger" wrote:
> > Jun 15 23:18:02 rover kernel: BUG: unable to handle kernel NULL poi=
nter
> > dereference at 0000000000000018
> > Jun 15 23:18:02 rover kernel: IP: [<ffffffff80227a85>]
> > __ticket_spin_lock+0x5/0x20

Hm, this looks like http://bugzilla.kernel.org/show_bug.cgi?id=3D13556 =
to=20
me, maybe it's the same issue?

If so: @Michael, do you still experience these oopses or has the bug=20
somehow magically resolved for you?

Christian.

> > Jun 15 23:18:02 rover kernel: PGD adea5067 PUD b80a6067 PMD 0 Jun 1=
5
> > 23:18:02 rover kernel: Oops: 0002 [#1] PREEMPT SMP Jun 15 23:18:03 =
rover
> > kernel: last sysfs file:
> > /sys/devices/system/cpu/cpu1/cpufreq/scaling_governor
> > Jun 15 23:18:03 rover kernel: CPU 0 Jun 15 23:18:03 rover kernel: M=
odules
> > linked in: uvcvideo iwl3945 mac80211 ipv6 coretemp xt_time xt_connl=
imit
> > xt_realm iptable_raw xt_comment i915 drm i2c_algo_bit xt_policy ipt=
_ULOG
> > ipt_TTL ipt_ttl ipt_REJECT ipt_REDIRECT ipt_NETMAP ipt_MASQUERADE i=
pt_LOG
> > ipt_ECN ipt_ecn ipt_CLUSTERIP ipt_ah ipt_addrtype nf_nat_tftp
> > nf_nat_snmp_basic nf_nat_sip nf_nat_pptp nf_nat_proto_gre nf_nat_ir=
c
> > nf_nat_h323 nf_nat_ftp nf_nat_amanda ts_kmp nf_conntrack_amanda
> > nf_conntrack_sane nf_conntrack_tftp nf_conntrack_sip nf_conntrack_p=
roto_sctp
> > nf_conntrack_pptp nf_conntrack_proto_gre nf_conntrack_netlink
> > nf_conntrack_netbios_ns nf_conntrack_irc nf_conntrack_h323 nf_connt=
rack_ftp
> > xt_tcpmss xt_recent xt_pkttype xt_physdev xt_owner xt_NFQUEUE xt_NF=
LOG
> > nfnetlink_log xt_multiport xt_MARK xt_mark xt_mac xt_limit xt_lengt=
h
> > xt_iprange xt_helper xt_hashlimit xt_DSCP xt_dscp xt_dccp xt_conntr=
ack
> > xt_CONNMARK xt_connmark xt_CLASSIFY xt_tcpudp xt_state iptable_nat =
nf_nat
> > nf_conntrack_ipv4 nf_defrag_ipv4 nf_
> conntrack iptable_mangle nfnetlink iptable_filter ip_tables x_tables =
ext2
> mbcache joydev videodev v4l1_compat v4l2_compat_ioctl32 dell_laptop p=
smouse
> uhci_hcd sdhci_pci sdhci serio_raw i2c_i801 ohci1394 ieee1394 mmc_cor=
e
> ehci_hcd iTCO_wdt i2c_core dcdbas sg snd_pcsp iTCO_vendor_support wmi=
 usbcore
> video output intel_agp thermal evdev fan button battery ac cpufreq_po=
wersave
> cpufreq_ondemand acpi_cpufreq freq_table processor snd_hda_codec_real=
tek
> snd_hda_intel snd_hda_codec snd_seq_oss snd_seq_midi_event snd_seq
> snd_seq_device snd_hwdep snd_pcm_oss snd_pcm snd_timer snd_page_alloc
> snd_mixer_oss snd soundcore arc4 ecb rfkill led_class lib80211 cfg802=
11 r8169
> mii rtc_cmos rtc_core rtc_lib reiserfs sr_mod cdrom sd_mod ata_piix a=
hci
> ata_generic pata_acpi libata scsi_mod [last unloaded: uvcvideo]
> > Jun 15 23:18:03 rover kernel: Pid: 5555, comm: firefox Not tainted
> > 2.6.29-ARCH #1 Vostro1510
> > Jun 15 23:18:03 rover kernel: RIP: 0010:[<ffffffff80227a85>]
> > [<ffffffff80227a85>] __ticket_spin_lock+0x5/0x20
> > Jun 15 23:18:03 rover kernel: RSP: 0018:ffff8800b8d8da08  EFLAGS: 0=
0010002
> > Jun 15 23:18:03 rover kernel: RAX: 0000000000000100 RBX: 0000000000=
000000
> > RCX: 0000000000000000
> > Jun 15 23:18:03 rover kernel: RDX: 0000000000000000 RSI: 0000000000=
000000
> > RDI: 0000000000000018
> > Jun 15 23:18:03 rover kernel: RBP: ffffe20001effb40 R08: ffff8800bd=
963400
> > R09: 00000000008b896c
> > Jun 15 23:18:03 rover kernel: R10: 0000000000000001 R11: ffffffff80=
220330
> > R12: 0000000000000018
> > Jun 15 23:18:03 rover kernel: R13: 0000000000000000 R14: ffff8800ad=
e92b1c
> > R15: ffff8800ade92b28
> > Jun 15 23:18:03 rover kernel: FS:  00007f3ca616b910(0000)
> > GS:ffffffff8067a000(0000) knlGS:0000000000000000
> > Jun 15 23:18:03 rover kernel: CS:  0010 DS: 0000 ES: 0000 CR0:
> > 0000000080050033
> > Jun 15 23:18:03 rover kernel: CR2: 0000000000000018 CR3: 00000000ad=
ea3000
> > CR4: 00000000000006e0
> > Jun 15 23:18:03 rover kernel: DR0: 0000000000000000 DR1: 0000000000=
000000
> > DR2: 0000000000000000
> > Jun 15 23:18:03 rover kernel: DR3: 0000000000000000 DR6: 00000000ff=
ff0ff0
> > DR7: 0000000000000400
> > Jun 15 23:18:03 rover kernel: Process firefox (pid: 5555, threadinf=
o
> > ffff8800b8d8c000, task ffff8800bdf4b000)
> > Jun 15 23:18:03 rover kernel: Stack:
> > Jun 15 23:18:03 rover kernel: ffffffff804b4a8d ffffffff802f0a2d
> > ffff8800ade92b00 ffff8800ade92b00
> > Jun 15 23:18:03 rover kernel: ffff8800bd963400 0000000000000000
> > ffffc20010495638 ffffffffa00b7c6a
> > Jun 15 23:18:03 rover kernel: 2222222222222222 0000000000000381
> > ffffc20000000000 0000000122222222
> > Jun 15 23:18:03 rover kernel: Call Trace:
> > Jun 15 23:18:03 rover kernel: [<ffffffff804b4a8d>] ?
> > _spin_lock_irq+0x1d/0x20
> > Jun 15 23:18:03 rover kernel: [<ffffffff802f0a2d>] ?
> > __set_page_dirty+0x2d/0x150
> > Jun 15 23:18:03 rover kernel: [<ffffffffa00b7c6a>] ?
> > flush_commit_list+0x70a/0x710 [reiserfs]
> > Jun 15 23:18:03 rover kernel: [<ffffffff804b4bc5>] ? _spin_lock+0x1=
5/0x20
> > Jun 15 23:18:03 rover kernel: [<ffffffffa00b8856>] ?
> > flush_journal_list+0x176/0x6b0 [reiserfs]
> > Jun 15 23:18:03 rover kernel: [<ffffffffa00b8e5f>] ?
> > flush_used_journal_lists+0xcf/0xe0 [reiserfs]
> > Jun 15 23:18:03 rover kernel: [<ffffffffa00b9a1b>] ?
> > do_journal_end+0xbab/0xf00 [reiserfs]
> > Jun 15 23:18:03 rover kernel: [<ffffffffa00bc4c7>] ?
> > do_journal_begin_r+0x267/0x350 [reiserfs]
> > Jun 15 23:18:03 rover kernel: [<ffffffffa00bc635>] ?
> > journal_begin+0x85/0x160 [reiserfs]
> > Jun 15 23:18:03 rover kernel: [<ffffffffa00b5434>] ?
> > reiserfs_do_truncate+0x314/0x5a0 [reiserfs]
> > Jun 15 23:18:03 rover kernel: [<ffffffff804b4a02>] ? _read_lock+0x2=
/0x20
> > Jun 15 23:18:03 rover kernel: [<ffffffff804b4a5e>] ?
> > _spin_lock_irqsave+0x3e/0x50
> > Jun 15 23:18:03 rover kernel: [<ffffffffa00b56e4>] ?
> > reiserfs_delete_object+0x24/0x70 [reiserfs]
> > Jun 15 23:18:03 rover kernel: [<ffffffffa00a3370>] ?
> > reiserfs_delete_inode+0x0/0x160 [reiserfs]
> > Jun 15 23:18:03 rover kernel: [<ffffffffa00a3370>] ?
> > reiserfs_delete_inode+0x0/0x160 [reiserfs]
> > Jun 15 23:18:03 rover kernel: [<ffffffffa00a344f>] ?
> > reiserfs_delete_inode+0xdf/0x160 [reiserfs]
> > Jun 15 23:18:03 rover kernel: [<ffffffff804b4bc5>] ? _spin_lock+0x1=
5/0x20
> > Jun 15 23:18:03 rover kernel: [<ffffffffa00a3370>] ?
> > reiserfs_delete_inode+0x0/0x160 [reiserfs]
> > Jun 15 23:18:03 rover kernel: [<ffffffff802e0dca>] ?
> > generic_delete_inode+0xca/0x1b0
> > Jun 15 23:18:03 rover kernel: [<ffffffff802d7772>] ? do_unlinkat+0x=
122/0x1c0
> > Jun 15 23:18:03 rover kernel: [<ffffffff802c869b>] ? filp_close+0x5=
b/0x90
> > Jun 15 23:18:03 rover kernel: [<ffffffff8020c6aa>] ?
> > system_call_fastpath+0x16/0x1b
> > Jun 15 23:18:03 rover kernel: Code: ff 0f 1f 44 00 00 48 c7 c2 de 7=
8 22 80
> > 48 c7 c1 e1 78 22 80 e9 dd fe ff ff 90 90 90 90 90 90 90 90 90 90 9=
0 90 90
> > b8 00 01 00 00 <f0> 66 0f c1 07 38 e0 74 06 f3 90 8a 07 eb f6 c3 66=
 66 2e 0f
> > 1f Jun 15 23:18:03 rover kernel: RIP  [<ffffffff80227a85>]
> > __ticket_spin_lock+0x5/0x20
> > Jun 15 23:18:03 rover kernel: RSP <ffff8800b8d8da08>
> > Jun 15 23:18:03 rover kernel: CR2: 0000000000000018
> > Jun 15 23:18:03 rover kernel: ---[ end trace 4ce96b3c5deed594 ]---
> > Jun 15 23:18:03 rover kernel: ------------[ cut here ]------------
> > Jun 15 23:18:03 rover kernel: WARNING: at kernel/exit.c:983
> > do_exit+0x90c/0x920()
> > Jun 15 23:18:03 rover kernel: Hardware name: Vostro1510
> > Jun 15 23:18:03 rover kernel: Modules linked in: uvcvideo iwl3945 m=
ac80211
> > ipv6 coretemp xt_time xt_connlimit xt_realm iptable_raw xt_comment =
i915 drm
> > i2c_algo_bit xt_policy ipt_ULOG ipt_TTL ipt_ttl ipt_REJECT ipt_REDI=
RECT
> > ipt_NETMAP ipt_MASQUERADE ipt_LOG ipt_ECN ipt_ecn ipt_CLUSTERIP ipt=
_ah
> > ipt_addrtype nf_nat_tftp nf_nat_snmp_basic nf_nat_sip nf_nat_pptp
> > nf_nat_proto_gre nf_nat_irc nf_nat_h323 nf_nat_ftp nf_nat_amanda ts=
_kmp
> > nf_conntrack_amanda nf_conntrack_sane nf_conntrack_tftp nf_conntrac=
k_sip
> > nf_conntrack_proto_sctp nf_conntrack_pptp nf_conntrack_proto_gre
> > nf_conntrack_netlink nf_conntrack_netbios_ns nf_conntrack_irc
> > nf_conntrack_h323 nf_conntrack_ftp xt_tcpmss xt_recent xt_pkttype x=
t_physdev
> > xt_owner xt_NFQUEUE xt_NFLOG nfnetlink_log xt_multiport xt_MARK xt_=
mark
> > xt_mac xt_limit xt_length xt_iprange xt_helper xt_hashlimit xt_DSCP=
 xt_dscp
> > xt_dccp xt_conntrack xt_CONNMARK xt_connmark xt_CLASSIFY xt_tcpudp =
xt_state
> > iptable_nat nf_nat nf_conntrack_ipv4 nf_defrag_ipv4 nf_
> conntrack iptable_mangle nfnetlink iptable_filter ip_tables x_tables =
ext2
> mbcache joydev videodev v4l1_compat v4l2_compat_ioctl32 dell_laptop p=
smouse
> uhci_hcd sdhci_pci sdhci serio_raw i2c_i801 ohci1394 ieee1394 mmc_cor=
e
> ehci_hcd iTCO_wdt i2c_core dcdbas sg snd_pcsp iTCO_vendor_support wmi=
 usbcore
> video output intel_agp thermal evdev fan button battery ac cpufreq_po=
wersave
> cpufreq_ondemand acpi_cpufreq freq_table processor snd_hda_codec_real=
tek
> snd_hda_intel snd_hda_codec snd_seq_oss snd_seq_midi_event snd_seq
> snd_seq_device snd_hwdep snd_pcm_oss snd_pcm snd_timer snd_page_alloc
> snd_mixer_oss snd soundcore arc4 ecb rfkill led_class lib80211 cfg802=
11 r8169
> mii rtc_cmos rtc_core rtc_lib reiserfs sr_mod cdrom sd_mod ata_piix a=
hci
> ata_generic pata_acpi libata scsi_mod [last unloaded: uvcvideo]
> > Jun 15 23:18:03 rover kernel: Pid: 5555, comm: firefox Tainted: G  =
    D
> > 2.6.29-ARCH #1
> > Jun 15 23:18:03 rover kernel: Call Trace:
> > Jun 15 23:18:03 rover kernel: [<ffffffff8024169f>] warn_slowpath+0x=
df/0x140
> > Jun 15 23:18:03 rover kernel: [<ffffffff80227b75>]
> > default_spin_lock_flags+0x5/0x10
> > Jun 15 23:18:03 rover kernel: [<ffffffff804b4a5e>]
> > _spin_lock_irqsave+0x3e/0x50
> > Jun 15 23:18:03 rover kernel: [<ffffffff804b50a9>] _spin_trylock+0x=
19/0x60
> > Jun 15 23:18:03 rover kernel: [<ffffffff803d3eac>]
> > vt_console_print+0x7c/0x330
> > Jun 15 23:18:03 rover kernel: [<ffffffff804b4a5e>]
> > _spin_lock_irqsave+0x3e/0x50
> > Jun 15 23:18:03 rover kernel: [<ffffffff804b4a5e>]
> > _spin_lock_irqsave+0x3e/0x50
> > Jun 15 23:18:03 rover kernel: [<ffffffff8025d95d>] up+0xd/0x40
> > Jun 15 23:18:03 rover kernel: [<ffffffff804b4a5e>]
> > _spin_lock_irqsave+0x3e/0x50
> > Jun 15 23:18:03 rover kernel: [<ffffffff80241f39>]
> > release_console_sem+0x1c9/0x220
> > Jun 15 23:18:03 rover kernel: [<ffffffff80245bcc>] do_exit+0x90c/0x=
920
> > Jun 15 23:18:03 rover kernel: [<ffffffff804b184d>] printk+0x40/0x4b
> > Jun 15 23:18:03 rover kernel: [<ffffffff80241f39>]
> > release_console_sem+0x1c9/0x220
> > Jun 15 23:18:03 rover kernel: [<ffffffff80210da9>] oops_end+0xa9/0x=
f0
> > Jun 15 23:18:03 rover kernel: [<ffffffff8022d76c>] do_page_fault+0x=
43c/0xb30
> > Jun 15 23:18:03 rover kernel: [<ffffffff80213917>] nommu_map_sg+0x7=
7/0x120
> > Jun 15 23:18:03 rover kernel: [<ffffffff8020ac05>] __switch_to+0x33=
5/0x500
> > Jun 15 23:18:03 rover kernel: [<ffffffff804b4e79>] _spin_unlock_irq=
+0x9/0x40
> > Jun 15 23:18:03 rover kernel: [<ffffffff8023b02a>]
> > finish_task_switch+0x2a/0xd0
> > Jun 15 23:18:03 rover kernel: [<ffffffff804b5100>]
> > __reacquire_kernel_lock+0x10/0x70
> > Jun 15 23:18:03 rover kernel: [<ffffffff804b24e5>] thread_return+0x=
59a/0x6f5
> > Jun 15 23:18:03 rover kernel: [<ffffffff8026221b>] getnstimeofday+0=
x4b/0xe0
> > Jun 15 23:18:03 rover kernel: [<ffffffff80227b75>]
> > default_spin_lock_flags+0x5/0x10
> > Jun 15 23:18:03 rover kernel: [<ffffffff804b4a5e>]
> > _spin_lock_irqsave+0x3e/0x50
> > Jun 15 23:18:03 rover kernel: [<ffffffff8028c38b>] delayacct_end+0x=
8b/0xb0
> > Jun 15 23:18:03 rover kernel: [<ffffffff804b53d5>] page_fault+0x25/=
0x30
> > Jun 15 23:18:03 rover kernel: [<ffffffff80220330>] lapic_next_event=
+0x0/0x20
> > Jun 15 23:18:03 rover kernel: [<ffffffff80227a85>]
> > __ticket_spin_lock+0x5/0x20
> > Jun 15 23:18:03 rover kernel: [<ffffffff804b4a8d>] _spin_lock_irq+0=
x1d/0x20
> > Jun 15 23:18:03 rover kernel: [<ffffffff802f0a2d>]
> > __set_page_dirty+0x2d/0x150
> > Jun 15 23:18:03 rover kernel: [<ffffffffa00b7c6a>]
> > flush_commit_list+0x70a/0x710 [reiserfs]
> > Jun 15 23:18:03 rover kernel: [<ffffffff804b4bc5>] _spin_lock+0x15/=
0x20
> > Jun 15 23:18:03 rover kernel: [<ffffffffa00b8856>]
> > flush_journal_list+0x176/0x6b0 [reiserfs]
> > Jun 15 23:18:03 rover kernel: [<ffffffffa00b8e5f>]
> > flush_used_journal_lists+0xcf/0xe0 [reiserfs]
> > Jun 15 23:18:03 rover kernel: [<ffffffffa00b9a1b>]
> > do_journal_end+0xbab/0xf00 [reiserfs]
> > Jun 15 23:18:03 rover kernel: [<ffffffffa00bc4c7>]
> > do_journal_begin_r+0x267/0x350 [reiserfs]
> > Jun 15 23:18:03 rover kernel: [<ffffffffa00bc635>] journal_begin+0x=
85/0x160
> > [reiserfs]
> > Jun 15 23:18:03 rover kernel: [<ffffffffa00b5434>]
> > reiserfs_do_truncate+0x314/0x5a0 [reiserfs]
> > Jun 15 23:18:03 rover kernel: [<ffffffff804b4a02>] _read_lock+0x2/0=
x20
> > Jun 15 23:18:03 rover kernel: [<ffffffff804b4a5e>]
> > _spin_lock_irqsave+0x3e/0x50
> > Jun 15 23:18:03 rover kernel: [<ffffffffa00b56e4>]
> > reiserfs_delete_object+0x24/0x70 [reiserfs]
> > Jun 15 23:18:03 rover kernel: [<ffffffffa00a3370>]
> > reiserfs_delete_inode+0x0/0x160 [reiserfs]
> > Jun 15 23:18:03 rover kernel: [<ffffffffa00a3370>]
> > reiserfs_delete_inode+0x0/0x160 [reiserfs]
> > Jun 15 23:18:03 rover kernel: [<ffffffffa00a344f>]
> > reiserfs_delete_inode+0xdf/0x160 [reiserfs]
> > Jun 15 23:18:03 rover kernel: [<ffffffff804b4bc5>] _spin_lock+0x15/=
0x20
> > Jun 15 23:18:03 rover kernel: [<ffffffffa00a3370>]
> > reiserfs_delete_inode+0x0/0x160 [reiserfs]
> > Jun 15 23:18:03 rover kernel: [<ffffffff802e0dca>]
> > generic_delete_inode+0xca/0x1b0
> > Jun 15 23:18:03 rover kernel: [<ffffffff802d7772>] do_unlinkat+0x12=
2/0x1c0
> > Jun 15 23:18:03 rover kernel: [<ffffffff802c869b>] filp_close+0x5b/=
0x90
> > Jun 15 23:18:03 rover kernel: [<ffffffff8020c6aa>]
> > system_call_fastpath+0x16/0x1b
> > Jun 15 23:18:03 rover kernel: ---[ end trace 4ce96b3c5deed595 ]---
> > Jun 15 23:18:03 rover kernel: note: firefox[5555] exited with preem=
pt_count
> > 2
>=20
>=20
> [6.] A small shell script or example program which triggers the
>      problem (if possible)
>=20
> Compiling llvm always triggers the problem.
>=20
>=20
> [7.] Environment
> [7.1.] Software (add the output of the ver_linux script here)
>=20
> Up to date Arch Linux distribution. Here's the output of ver_linux:
> > Linux rover 2.6.30-ARCH #1 SMP PREEMPT Fri Jun 19 20:44:03 UTC 2009=
 x86_64
> > Intel(R) Core(TM)2 Duo CPU T5670 @ 1.80GHz GenuineIntel GNU/Linux
> >  Gnu C                  4.4.0
> > Gnu make               3.81
> > binutils               2.19.1.20090418
> > util-linux             2.14.2
> > mount                  support
> > module-init-tools      3.8
> > e2fsprogs              1.41.6
> > jfsutils               1.1.14
> > reiserfsprogs          3.6.21
> > xfsprogs               3.0.1
> > pcmciautils            015
> > PPP                    2.4.4
> > Linux C Library        2.10.1
> > Dynamic linker (ldd)   2.10.1
> > Linux C++ Library      6.0.12
> > Procps                 3.2.8
> > Net-tools              1.60
> > Kbd                    1.15
> > Sh-utils               7.4
> > wireless-tools         29
> > Modules Loaded         ipv6 coretemp xt_time xt_connlimit i915 xt_r=
ealm drm
> > i2c_algo_bit iptable_raw xt_comment xt_policy ipt_ULOG ipt_REJECT
> > ipt_REDIRECT ipt_NETMAP ipt_MASQUERADE ipt_LOG ipt_ECN ipt_ecn ipt_=
CLUSTERIP
> > ipt_ah ipt_addrtype nf_nat_tftp nf_nat_snmp_basic nf_nat_sip nf_nat=
_pptp
> > nf_nat_proto_gre nf_nat_irc nf_nat_h323 nf_nat_ftp nf_nat_amanda ts=
_kmp
> > nf_conntrack_amanda nf_conntrack_sane nf_conntrack_tftp nf_conntrac=
k_sip
> > nf_conntrack_proto_sctp nf_conntrack_pptp nf_conntrack_proto_gre
> > nf_conntrack_netlink nf_conntrack_netbios_ns nf_conntrack_irc
> > nf_conntrack_h323 nf_conntrack_ftp xt_tcpmss xt_recent xt_pkttype x=
t_physdev
> > xt_owner xt_NFQUEUE xt_NFLOG nfnetlink_log xt_multiport xt_MARK xt_=
mark
> > xt_mac xt_limit xt_length xt_iprange xt_helper xt_hashlimit xt_DSCP=
 xt_dscp
> > xt_dccp xt_conntrack xt_CONNMARK xt_connmark xt_CLASSIFY xt_tcpudp =
xt_state
> > iptable_nat nf_nat nf_conntrack_ipv4 nf_defrag_ipv4 nf_conntrack
> > iptable_mangle nfnetlink iptable_filter ip_tables x_tables
> ext2 mbcache usbhid hid wacom joydev uvcvideo videodev v4l1_compat
> v4l2_compat_ioctl32 ohci1394 sdhci_pci sdhci mmc_core ieee1394 sg i2c=
_i801
> uhci_hcd pcspkr iTCO_wdt psmouse dell_laptop dcdbas wmi i2c_core
> iTCO_vendor_support serio_raw ehci_hcd usbcore video output intel_agp=
 thermal
> fan button battery ac cpufreq_powersave cpufreq_ondemand acpi_cpufreq
> freq_table evdev processor snd_hda_codec_realtek snd_seq_dummy snd_hd=
a_intel
> snd_seq_oss snd_hda_codec snd_seq_midi_event snd_seq snd_seq_device s=
nd_hwdep
> snd_pcm_oss snd_pcm snd_timer snd_page_alloc snd_mixer_oss snd soundc=
ore arc4
> ecb iwl3945 iwlcore rfkill mac80211 led_class cfg80211 r8169 mii rtc_=
cmos
> rtc_core rtc_lib reiserfs sr_mod sd_mod cdrom ata_piix ahci ata_gener=
ic
> pata_acpi libata scsi_mod
>=20
>=20
> [7.2.] Processor information (from /proc/cpuinfo):
>=20
> > processor	: 0
> > vendor_id	: GenuineIntel
> > cpu family	: 6
> > model		: 15
> > model name	: Intel(R) Core(TM)2 Duo CPU     T5670  @ 1.80GHz
> > stepping	: 13
> > cpu MHz		: 800.000
> > cache size	: 2048 KB
> > physical id	: 0
> > siblings	: 2
> > core id		: 0
> > cpu cores	: 2
> > apicid		: 0
> > initial apicid	: 0
> > fpu		: yes
> > fpu_exception	: yes
> > cpuid level	: 10
> > wp		: yes
> > flags		: fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca
> > cmov pat pse36 clflush dts acpi mmx fxsr sse sse2 ss ht tm pbe sysc=
all nx lm
> > constant_tsc arch_perfmon pebs bts rep_good pni dtes64 monitor ds_c=
pl est
> > tm2 ssse3 cx16 xtpr pdcm lahf_lm ida
> > bogomips	: 3592.17
> > clflush size	: 64
> > cache_alignment	: 64
> > address sizes	: 36 bits physical, 48 bits virtual
> > power management:
> >=20
> > processor	: 1
> > vendor_id	: GenuineIntel
> > cpu family	: 6
> > model		: 15
> > model name	: Intel(R) Core(TM)2 Duo CPU     T5670  @ 1.80GHz
> > stepping	: 13
> > cpu MHz		: 800.000
> > cache size	: 2048 KB
> > physical id	: 0
> > siblings	: 2
> > core id		: 1
> > cpu cores	: 2
> > apicid		: 1
> > initial apicid	: 1
> > fpu		: yes
> > fpu_exception	: yes
> > cpuid level	: 10
> > wp		: yes
> > flags		: fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca
> > cmov pat pse36 clflush dts acpi mmx fxsr sse sse2 ss ht tm pbe sysc=
all nx lm
> > constant_tsc arch_perfmon pebs bts rep_good pni dtes64 monitor ds_c=
pl est
> > tm2 ssse3 cx16 xtpr pdcm lahf_lm ida
> > bogomips	: 3592.96
> > clflush size	: 64
> > cache_alignment	: 64
> > address sizes	: 36 bits physical, 48 bits virtual
> > power management:
>=20
>=20
> [7.3.] Module information (from /proc/modules):
>=20
> > ipv6 336000 12 - Live 0xffffffffa0661000
> > coretemp 7664 0 - Live 0xffffffffa0077000
> > xt_time 3152 0 - Live 0xffffffffa01f2000
> > xt_connlimit 5080 0 - Live 0xffffffffa01bf000
> > i915 206216 2 - Live 0xffffffffa062c000
> > xt_realm 1840 0 - Live 0xffffffffa0106000
> > drm 189728 3 i915, Live 0xffffffffa05fb000
> > i2c_algo_bit 7028 1 i915, Live 0xffffffffa0093000
> > iptable_raw 2576 0 - Live 0xffffffffa0060000
> > xt_comment 1872 18 - Live 0xffffffffa05f8000
> > xt_policy 3536 0 - Live 0xffffffffa05f2000
> > ipt_ULOG 10504 0 - Live 0xffffffffa05ea000
> > ipt_REJECT 3664 2 - Live 0xffffffffa05e4000
> > ipt_REDIRECT 2288 0 - Live 0xffffffffa05de000
> > ipt_NETMAP 2096 0 - Live 0xffffffffa05d8000
> > ipt_MASQUERADE 3472 0 - Live 0xffffffffa05d2000
> > ipt_LOG 6612 4 - Live 0xffffffffa05cb000
> > ipt_ECN 2960 0 - Live 0xffffffffa05c5000
> > ipt_ecn 2384 0 - Live 0xffffffffa05bf000
> > ipt_CLUSTERIP 8440 0 - Live 0xffffffffa05b7000
> > ipt_ah 2064 0 - Live 0xffffffffa05b1000
> > ipt_addrtype 2992 4 - Live 0xffffffffa05ab000
> > nf_nat_tftp 1904 0 - Live 0xffffffffa05a5000
> > nf_nat_snmp_basic 11288 0 - Live 0xffffffffa059d000
> > nf_nat_sip 7760 0 - Live 0xffffffffa0596000
> > nf_nat_pptp 3536 0 - Live 0xffffffffa0590000
> > nf_nat_proto_gre 2772 1 nf_nat_pptp, Live 0xffffffffa058a000
> > nf_nat_irc 2672 0 - Live 0xffffffffa0584000
> > nf_nat_h323 7792 0 - Live 0xffffffffa057d000
> > nf_nat_ftp 3696 0 - Live 0xffffffffa0577000
> > nf_nat_amanda 2288 0 - Live 0xffffffffa0571000
> > ts_kmp 2832 5 - Live 0xffffffffa056b000
> > nf_conntrack_amanda 4688 1 nf_nat_amanda, Live 0xffffffffa0564000
> > nf_conntrack_sane 5940 0 - Live 0xffffffffa055d000
> > nf_conntrack_tftp 5444 1 nf_nat_tftp, Live 0xffffffffa0556000
> > nf_conntrack_sip 21380 1 nf_nat_sip, Live 0xffffffffa054b000
> > nf_conntrack_proto_sctp 10044 0 - Live 0xffffffffa0543000
> > nf_conntrack_pptp 7316 1 nf_nat_pptp, Live 0xffffffffa053c000
> > nf_conntrack_proto_gre 7284 1 nf_conntrack_pptp, Live 0xffffffffa05=
35000
> > nf_conntrack_netlink 21008 0 - Live 0xffffffffa052a000
> > nf_conntrack_netbios_ns 3184 0 - Live 0xffffffffa0524000
> > nf_conntrack_irc 6536 1 nf_nat_irc, Live 0xffffffffa051d000
> > nf_conntrack_h323 56624 1 nf_nat_h323, Live 0xffffffffa050a000
> > nf_conntrack_ftp 9256 1 nf_nat_ftp, Live 0xffffffffa0502000
> > xt_tcpmss 2416 0 - Live 0xffffffffa04fc000
> > xt_recent 12384 0 - Live 0xffffffffa04f3000
> > xt_pkttype 2000 0 - Live 0xffffffffa04ed000
> > xt_physdev 2656 0 - Live 0xffffffffa04e7000
> > xt_owner 3216 0 - Live 0xffffffffa04e1000
> > xt_NFQUEUE 2160 0 - Live 0xffffffffa04db000
> > xt_NFLOG 2064 0 - Live 0xffffffffa04d5000
> > nfnetlink_log 11524 1 xt_NFLOG, Live 0xffffffffa04cd000
> > xt_multiport 3728 4 - Live 0xffffffffa04c7000
> > xt_MARK 3408 0 - Live 0xffffffffa04c1000
> > xt_mark 2704 0 - Live 0xffffffffa04bb000
> > xt_mac 1936 0 - Live 0xffffffffa04b5000
> > xt_limit 3604 0 - Live 0xffffffffa0334000
> > xt_length 2192 0 - Live 0xffffffffa0323000
> > xt_iprange 2864 0 - Live 0xffffffffa0313000
> > xt_helper 2576 0 - Live 0xffffffffa02fe000
> > xt_hashlimit 12880 0 - Live 0xffffffffa04af000
> > xt_DSCP 4016 0 - Live 0xffffffffa02d9000
> > xt_dscp 3120 0 - Live 0xffffffffa028a000
> > xt_dccp 3584 0 - Live 0xffffffffa0258000
> > xt_conntrack 4912 0 - Live 0xffffffffa023b000
> > xt_CONNMARK 3984 0 - Live 0xffffffffa022b000
> > xt_connmark 3248 0 - Live 0xffffffffa01fe000
> > xt_CLASSIFY 1904 0 - Live 0xffffffffa01ea000
> > xt_tcpudp 3696 12 - Live 0xffffffffa01c7000
> > xt_state 2544 8 - Live 0xffffffffa01b3000
> > iptable_nat 6512 0 - Live 0xffffffffa0170000
> > nf_nat 22244 12
> > ipt_REDIRECT,ipt_NETMAP,ipt_MASQUERADE,nf_nat_tftp,nf_nat_sip,nf_na=
t_pptp,nf_nat_proto_gre,nf_nat_irc,nf_nat_h323,nf_nat_ftp,nf_nat_amanda=
,iptable_nat,
> > Live 0xffffffffa04a7000
> > nf_conntrack_ipv4 17928 11 iptable_nat,nf_nat, Live 0xffffffffa04a0=
000
> > nf_defrag_ipv4 2256 1 nf_conntrack_ipv4, Live 0xffffffffa00aa000
> > nf_conntrack 75104 31
> > xt_connlimit,ipt_MASQUERADE,ipt_CLUSTERIP,nf_nat_tftp,nf_nat_snmp_b=
asic,nf_nat_sip,nf_nat_pptp,nf_nat_irc,nf_nat_h323,nf_nat_ftp,nf_nat_am=
anda,nf_conntrack_amanda,nf_conntrack_sane,nf_conntrack_tftp,nf_conntra=
ck_sip,nf_conntrack_proto_sctp,nf_conntrack_pptp,nf_conntrack_proto_gre=
,nf_conntrack_netlink,nf_conntrack_netbios_ns,nf_conntrack_irc,nf_connt=
rack_h323,nf_conntrack_ftp,xt_helper,xt_conntrack,xt_CONNMARK,xt_connma=
rk,xt_state,iptable_nat,nf_nat,nf_conntrack_ipv4,
> > Live 0xffffffffa048b000
> > iptable_mangle 3440 1 - Live 0xffffffffa0067000
> > nfnetlink 5288 2 nf_conntrack_netlink,nfnetlink_log, Live 0xfffffff=
fa0058000
> > iptable_filter 3344 1 - Live 0xffffffffa0306000
> > ip_tables 19936 4 iptable_raw,iptable_nat,iptable_mangle,iptable_fi=
lter,
> > Live 0xffffffffa0484000
> > x_tables 23576 43
> > xt_time,xt_connlimit,xt_realm,xt_comment,xt_policy,ipt_ULOG,ipt_REJ=
ECT,ipt_REDIRECT,ipt_NETMAP,ipt_MASQUERADE,ipt_LOG,ipt_ECN,ipt_ecn,ipt_=
CLUSTERIP,ipt_ah,ipt_addrtype,xt_tcpmss,xt_recent,xt_pkttype,xt_physdev=
,xt_owner,xt_NFQUEUE,xt_NFLOG,xt_multiport,xt_MARK,xt_mark,xt_mac,xt_li=
mit,xt_length,xt_iprange,xt_helper,xt_hashlimit,xt_DSCP,xt_dscp,xt_dccp=
,xt_conntrack,xt_CONNMARK,xt_connmark,xt_CLASSIFY,xt_tcpudp,xt_state,ip=
table_nat,ip_tables,
> > Live 0xffffffffa047c000
> > ext2 78112 1 - Live 0xffffffffa0466000
> > mbcache 8980 1 ext2, Live 0xffffffffa0461000
> > usbhid 47584 0 - Live 0xffffffffa0453000
> > hid 52512 1 usbhid, Live 0xffffffffa0444000
> > wacom 24824 0 - Live 0xffffffffa043b000
> > joydev 13312 0 - Live 0xffffffffa0435000
> > uvcvideo 68316 0 - Live 0xffffffffa0422000
> > videodev 42080 1 uvcvideo, Live 0xffffffffa0415000
> > v4l1_compat 18228 2 uvcvideo,videodev, Live 0xffffffffa040e000
> > v4l2_compat_ioctl32 10992 1 videodev, Live 0xffffffffa0409000
> > ohci1394 34084 0 - Live 0xffffffffa03fe000
> > sdhci_pci 9200 0 - Live 0xffffffffa03f9000
> > sdhci 20084 1 sdhci_pci, Live 0xffffffffa03f2000
> > mmc_core 61856 1 sdhci, Live 0xffffffffa03e0000
> > ieee1394 98944 1 ohci1394, Live 0xffffffffa03c5000
> > sg 33792 0 - Live 0xffffffffa03ba000
> > i2c_i801 11632 0 - Live 0xffffffffa03b5000
> > uhci_hcd 27056 0 - Live 0xffffffffa03ac000
> > pcspkr 3120 0 - Live 0xffffffffa01b9000
> > iTCO_wdt 13648 0 - Live 0xffffffffa03a6000
> > psmouse 60404 0 - Live 0xffffffffa0395000
> > dell_laptop 5000 0 - Live 0xffffffffa0137000
> > dcdbas 9824 1 dell_laptop, Live 0xffffffffa0390000
> > wmi 7968 0 - Live 0xffffffffa00fd000
> > i2c_core 26816 4 i915,drm,i2c_algo_bit,i2c_i801, Live 0xffffffffa03=
87000
> > iTCO_vendor_support 3828 1 iTCO_wdt, Live 0xffffffffa00a0000
> > serio_raw 7188 0 - Live 0xffffffffa0083000
> > ehci_hcd 40668 0 - Live 0xffffffffa037b000
> > usbcore 179024 6 usbhid,wacom,uvcvideo,uhci_hcd,ehci_hcd, Live
> > 0xffffffffa034d000
> > video 24236 1 i915, Live 0xffffffffa0345000
> > output 3792 1 video, Live 0xffffffffa0023000
> > intel_agp 33104 1 - Live 0xffffffffa0337000
> > thermal 17712 0 - Live 0xffffffffa032d000
> > fan 5656 0 - Live 0xffffffffa0326000
> > button 7216 0 - Live 0xffffffffa031f000
> > battery 14072 0 - Live 0xffffffffa0316000
> > ac 5720 0 - Live 0xffffffffa030f000
> > cpufreq_powersave 1872 0 - Live 0xffffffffa0309000
> > cpufreq_ondemand 9224 2 - Live 0xffffffffa0301000
> > acpi_cpufreq 10272 0 - Live 0xffffffffa02f9000
> > freq_table 4528 2 cpufreq_ondemand,acpi_cpufreq, Live 0xffffffffa02=
f5000
> > evdev 12928 14 - Live 0xffffffffa02ec000
> > processor 42032 3 acpi_cpufreq, Live 0xffffffffa02dc000
> > snd_hda_codec_realtek 278132 1 - Live 0xffffffffa0293000
> > snd_seq_dummy 3540 0 - Live 0xffffffffa028d000
> > snd_hda_intel 31208 0 - Live 0xffffffffa0280000
> > snd_seq_oss 36224 0 - Live 0xffffffffa0272000
> > snd_hda_codec 82000 2 snd_hda_codec_realtek,snd_hda_intel, Live
> > 0xffffffffa025b000
> > snd_seq_midi_event 8592 1 snd_seq_oss, Live 0xffffffffa0253000
> > snd_seq 64640 5 snd_seq_dummy,snd_seq_oss,snd_seq_midi_event, Live
> > 0xffffffffa023e000
> > snd_seq_device 8324 3 snd_seq_dummy,snd_seq_oss,snd_seq, Live
> > 0xffffffffa0236000
> > snd_hwdep 9944 1 snd_hda_codec, Live 0xffffffffa022e000
> > snd_pcm_oss 47328 0 - Live 0xffffffffa021d000
> > snd_pcm 90808 3 snd_hda_intel,snd_hda_codec,snd_pcm_oss, Live
> > 0xffffffffa0201000
> > snd_timer 25344 2 snd_seq,snd_pcm, Live 0xffffffffa01f5000
> > snd_page_alloc 10784 2 snd_hda_intel,snd_pcm, Live 0xffffffffa01ed0=
00
> > snd_mixer_oss 20976 1 snd_pcm_oss, Live 0xffffffffa01e2000
> > snd 76712 11
> > snd_hda_codec_realtek,snd_hda_intel,snd_seq_oss,snd_hda_codec,snd_s=
eq,snd_seq_device,snd_hwdep,snd_pcm_oss,snd_pcm,snd_timer,snd_mixer_oss=
,
> > Live 0xffffffffa01ca000
> > soundcore 8576 1 snd, Live 0xffffffffa01c2000
> > arc4 2192 2 - Live 0xffffffffa01bc000
> > ecb 3536 2 - Live 0xffffffffa01b6000
> > iwl3945 94196 0 - Live 0xffffffffa019a000
> > iwlcore 112976 1 iwl3945, Live 0xffffffffa017c000
> > rfkill 13108 4 dell_laptop,iwlcore, Live 0xffffffffa0173000
> > mac80211 211168 2 iwl3945,iwlcore, Live 0xffffffffa013a000
> > led_class 5112 3 sdhci,iwl3945,iwlcore, Live 0xffffffffa0133000
> > cfg80211 78024 3 iwl3945,iwlcore,mac80211, Live 0xffffffffa011d000
> > r8169 41364 0 - Live 0xffffffffa010d000
> > mii 5680 1 r8169, Live 0xffffffffa0109000
> > rtc_cmos 13592 0 - Live 0xffffffffa0100000
> > rtc_core 22212 1 rtc_cmos, Live 0xffffffffa00f5000
> > rtc_lib 3120 1 rtc_core, Live 0xffffffffa00f2000
> > reiserfs 259176 2 - Live 0xffffffffa00ad000
> > sr_mod 19460 0 - Live 0xffffffffa00a3000
> > sd_mod 30696 5 - Live 0xffffffffa0096000
> > cdrom 41320 1 sr_mod, Live 0xffffffffa0086000
> > ata_piix 27604 0 - Live 0xffffffffa007a000
> > ahci 40992 4 - Live 0xffffffffa006a000
> > ata_generic 6164 0 - Live 0xffffffffa0063000
> > pata_acpi 5744 0 - Live 0xffffffffa005c000
> > libata 192044 4 ata_piix,ahci,ata_generic,pata_acpi, Live 0xfffffff=
fa0027000
> > scsi_mod 131512 4 sg,sr_mod,sd_mod,libata, Live 0xffffffffa0000000
>=20
>=20
> [7.4.] Loaded driver and hardware information (/proc/ioports,
> /proc/iomem)
>=20
> /proc/ioports
> > 0000-001f : dma1
> > 0020-0021 : pic1
> > 0040-0043 : timer0
> > 0050-0053 : timer1
> > 0060-0060 : keyboard
> > 0064-0064 : keyboard
> > 0070-0077 : rtc0
> > 0080-008f : dma page reg
> > 00a0-00a1 : pic2
> > 00c0-00df : dma2
> > 00f0-00ff : fpu
> > 0170-0177 : 0000:00:1f.1
> >   0170-0177 : ata_piix
> > 01f0-01f7 : 0000:00:1f.1
> >   01f0-01f7 : ata_piix
> > 0376-0376 : 0000:00:1f.1
> >   0376-0376 : ata_piix
> > 03c0-03df : vga+
> > 03f6-03f6 : 0000:00:1f.1
> >   03f6-03f6 : ata_piix
> > 0680-069f : pnp 00:06
> > 0800-080f : pnp 00:06
> > 0cf8-0cff : PCI conf1
> > 1000-107f : 0000:00:1f.0
> >   1000-107f : pnp 00:06
> >     1000-1003 : ACPI PM1a_EVT_BLK
> >     1004-1005 : ACPI PM1a_CNT_BLK
> >     1008-100b : ACPI PM_TMR
> >     1010-1015 : ACPI CPU throttle
> >     1020-1020 : ACPI PM2_CNT_BLK
> >     1028-102f : ACPI GPE0_BLK
> >     1030-1033 : iTCO_wdt
> >     1060-107f : iTCO_wdt
> > 1180-11bf : 0000:00:1f.0
> >   1180-11bf : pnp 00:06
> > 1800-1807 : 0000:00:02.0
> > 1810-181f : 0000:00:1f.1
> >   1810-181f : ata_piix
> > 1820-183f : 0000:00:1a.0
> >   1820-183f : uhci_hcd
> > 1840-185f : 0000:00:1a.1
> >   1840-185f : uhci_hcd
> > 1860-187f : 0000:00:1d.0
> >   1860-187f : uhci_hcd
> > 1880-189f : 0000:00:1d.1
> >   1880-189f : uhci_hcd
> > 18a0-18bf : 0000:00:1d.2
> >   18a0-18bf : uhci_hcd
> > 18d0-18d3 : 0000:00:1f.2
> >   18d0-18d3 : ahci
> > 18d4-18d7 : 0000:00:1f.2
> >   18d4-18d7 : ahci
> > 18d8-18df : 0000:00:1f.2
> >   18d8-18df : ahci
> > 18e0-18ff : 0000:00:1f.2
> >   18e0-18ff : ahci
> > 1c00-1c07 : 0000:00:1f.2
> >   1c00-1c07 : ahci
> > 1c20-1c3f : 0000:00:1f.3
> >   1c20-1c3f : i801_smbus
> > 2000-2fff : PCI Bus 0000:02
> > 3000-3fff : PCI Bus 0000:03
> > 4000-4fff : PCI Bus 0000:06
> > 5000-5fff : PCI Bus 0000:07
> >   5000-50ff : 0000:07:00.0
> >     5000-50ff : r8169
> > fe00-fe00 : pnp 00:06
> > ff00-ff7f : pnp 00:06
>=20
> /proc/iomem
> > 00000000-00000fff : System RAM
> > 00001000-00005fff : reserved
> > 00006000-0009f7ff : System RAM
> > 0009f800-0009ffff : reserved
> > 000dc000-000fffff : reserved
> > 00100000-bf6cffff : System RAM
> >   00200000-00553ba9 : Kernel code
> >   00553baa-0068955f : Kernel data
> >   00732000-0082c10f : Kernel bss
> > bf6d0000-bf6e2fff : ACPI Non-volatile Storage
> > bf6e3000-bfffffff : reserved
> > c2000000-c20fffff : PCI Bus 0000:07
> > c2100000-c21000ff : 0000:00:1f.3
> > c2101000-c2101fff : Intel Flush Page
> > c4000000-c7ffffff : PCI Bus 0000:02
> > cc000000-cdffffff : PCI Bus 0000:02
> > d0000000-dfffffff : 0000:00:02.0
> > e0000000-efffffff : PCI MMCONFIG 0 [00-ff]
> >   e0000000-efffffff : reserved
> >     e0000000-efffffff : pnp 00:01
> > f0000000-f3ffffff : PCI Bus 0000:03
> > f4000000-f7ffffff : PCI Bus 0000:06
> >   f4000000-f4000fff : 0000:06:00.0
> >     f4000000-f4000fff : iwl3945
> > f8000000-f80fffff : 0000:00:02.0
> > f8100000-f81fffff : 0000:00:02.1
> > f8200000-f82fffff : PCI Bus 0000:08
> >   f8200000-f8200fff : 0000:08:05.0
> >     f8200000-f82007ff : ohci1394
> >   f8201000-f8201fff : 0000:08:05.3
> >   f8202000-f82027ff : 0000:08:05.0
> >   f8202800-f82028ff : 0000:08:05.2
> >     f8202800-f82028ff : mmc0
> > f8500000-f8503fff : 0000:00:1b.0
> >   f8500000-f8503fff : ICH HD audio
> > f8504000-f85047ff : 0000:00:1f.2
> >   f8504000-f85047ff : ahci
> > f8504800-f8504bff : 0000:00:1a.7
> >   f8504800-f8504bff : ehci_hcd
> > f8504c00-f8504fff : 0000:00:1d.7
> >   f8504c00-f8504fff : ehci_hcd
> > f8600000-f86fffff : PCI Bus 0000:07
> >   f8600000-f860ffff : 0000:07:00.0
> >     f8600000-f860ffff : r8169
> >   f8610000-f8610fff : 0000:07:00.0
> >     f8610000-f8610fff : r8169
> >   f8620000-f862ffff : 0000:07:00.0
> > fa000000-fbffffff : PCI Bus 0000:03
> > fc000000-fdffffff : PCI Bus 0000:06
> > fec00000-fec0ffff : reserved
> >   fec00000-fec00fff : IOAPIC 0
> > fed00000-fed003ff : HPET 0
> >   fed00000-fed003ff : reserved
> >     fed00000-fed003ff : pnp 00:04
> > fed14000-fed19fff : reserved
> >   fed14000-fed17fff : pnp 00:01
> >   fed18000-fed18fff : pnp 00:01
> >   fed19000-fed19fff : pnp 00:01
> > fed1c000-fed8ffff : reserved
> >   fed1c000-fed1ffff : pnp 00:01
> >   fed20000-fed3ffff : pnp 00:01
> >   fed40000-fed44fff : pnp 00:01
> >   fed45000-fed8ffff : pnp 00:01
> > fee00000-fee00fff : Local APIC
> >   fee00000-fee00fff : reserved
> > ff000000-ffffffff : reserved
>=20
>=20
> [7.5.] PCI information ('lspci -vvv' as root)
>=20
> This is the output of 'lspci -v'. Adding more 'v' generates hundreds =
of
> "Unknown small resource type 00" messages
> > 00:00.0 Host bridge: Intel Corporation Mobile PM965/GM965/GL960 Mem=
ory
> > Controller Hub (rev 0c)
> > 	Subsystem: Dell Device 0273
> > 	Flags: bus master, fast devsel, latency 0
> > 	Capabilities: [e0] Vendor Specific Information <?>
> > 	Kernel driver in use: agpgart-intel
> > 	Kernel modules: intel-agp
> >=20
> > 00:02.0 VGA compatible controller: Intel Corporation Mobile GM965/G=
L960
> > Integrated Graphics Controller (rev 0c) (prog-if 00 [VGA controller=
])
> > 	Subsystem: Dell Device 0273
> > 	Flags: bus master, fast devsel, latency 0, IRQ 31
> > 	Memory at f8000000 (64-bit, non-prefetchable) [size=3D1M]
> > 	Memory at d0000000 (64-bit, prefetchable) [size=3D256M]
> > 	I/O ports at 1800 [size=3D8]
> > 	Expansion ROM at <unassigned> [disabled]
> > 	Capabilities: [90] MSI: Mask- 64bit- Count=3D1/1 Enable+
> > 	Capabilities: [d0] Power Management version 3
> > 	Kernel modules: intelfb
> >=20
> > 00:02.1 Display controller: Intel Corporation Mobile GM965/GL960 In=
tegrated
> > Graphics Controller (rev 0c)
> > 	Subsystem: Dell Device 0273
> > 	Flags: bus master, fast devsel, latency 0
> > 	Memory at f8100000 (64-bit, non-prefetchable) [size=3D1M]
> > 	Capabilities: [d0] Power Management version 3
> >=20
> > 00:1a.0 USB Controller: Intel Corporation 82801H (ICH8 Family) USB =
UHCI
> > Controller #4 (rev 03) (prog-if 00 [UHCI])
> > 	Subsystem: Dell Device 0273
> > 	Flags: bus master, medium devsel, latency 0, IRQ 16
> > 	I/O ports at 1820 [size=3D32]
> > 	Kernel driver in use: uhci_hcd
> > 	Kernel modules: uhci-hcd
> >=20
> > 00:1a.1 USB Controller: Intel Corporation 82801H (ICH8 Family) USB =
UHCI
> > Controller #5 (rev 03) (prog-if 00 [UHCI])
> > 	Subsystem: Dell Device 0273
> > 	Flags: bus master, medium devsel, latency 0, IRQ 21
> > 	I/O ports at 1840 [size=3D32]
> > 	Kernel driver in use: uhci_hcd
> > 	Kernel modules: uhci-hcd
> >=20
> > 00:1a.7 USB Controller: Intel Corporation 82801H (ICH8 Family) USB2=
 EHCI
> > Controller #2 (rev 03) (prog-if 20 [EHCI])
> > 	Subsystem: Dell Device 0273
> > 	Flags: bus master, medium devsel, latency 0, IRQ 18
> > 	Memory at f8504800 (32-bit, non-prefetchable) [size=3D1K]
> > 	Capabilities: [50] Power Management version 2
> > 	Capabilities: [58] Debug port: BAR=3D1 offset=3D00a0
> > 	Kernel driver in use: ehci_hcd
> > 	Kernel modules: ehci-hcd
> >=20
> > 00:1b.0 Audio device: Intel Corporation 82801H (ICH8 Family) HD Aud=
io
> > Controller (rev 03)
> > 	Subsystem: Dell Device 0273
> > 	Flags: bus master, fast devsel, latency 0, IRQ 22
> > 	Memory at f8500000 (64-bit, non-prefetchable) [size=3D16K]
> > 	Capabilities: [50] Power Management version 2
> > 	Capabilities: [60] MSI: Mask- 64bit+ Count=3D1/1 Enable-
> > 	Capabilities: [70] Express Root Complex Integrated Endpoint, MSI 0=
0
> > 	Capabilities: [100] Virtual Channel <?>
> > 	Capabilities: [130] Root Complex Link <?>
> > 	Kernel driver in use: HDA Intel
> > 	Kernel modules: snd-hda-intel
> >=20
> > 00:1c.0 PCI bridge: Intel Corporation 82801H (ICH8 Family) PCI Expr=
ess Port
> > 1 (rev 03) (prog-if 00 [Normal decode])
> > 	Flags: bus master, fast devsel, latency 0
> > 	Bus: primary=3D00, secondary=3D02, subordinate=3D02, sec-latency=3D=
0
> > 	I/O behind bridge: 00002000-00002fff
> > 	Memory behind bridge: c4000000-c7ffffff
> > 	Prefetchable memory behind bridge: 00000000cc000000-00000000cdffff=
ff
> > 	Capabilities: [40] Express Root Port (Slot+), MSI 00
> > 	Capabilities: [80] MSI: Mask- 64bit- Count=3D1/1 Enable+
> > 	Capabilities: [90] Subsystem: Dell Device 0273
> > 	Capabilities: [a0] Power Management version 2
> > 	Capabilities: [100] Virtual Channel <?>
> > 	Capabilities: [180] Root Complex Link <?>
> > 	Kernel driver in use: pcieport-driver
> > 	Kernel modules: shpchp
> >=20
> > 00:1c.1 PCI bridge: Intel Corporation 82801H (ICH8 Family) PCI Expr=
ess Port
> > 2 (rev 03) (prog-if 00 [Normal decode])
> > 	Flags: bus master, fast devsel, latency 0
> > 	Bus: primary=3D00, secondary=3D03, subordinate=3D03, sec-latency=3D=
0
> > 	I/O behind bridge: 00003000-00003fff
> > 	Memory behind bridge: f0000000-f3ffffff
> > 	Prefetchable memory behind bridge: 00000000fa000000-00000000fbffff=
ff
> > 	Capabilities: [40] Express Root Port (Slot+), MSI 00
> > 	Capabilities: [80] MSI: Mask- 64bit- Count=3D1/1 Enable+
> > 	Capabilities: [90] Subsystem: Dell Device 0273
> > 	Capabilities: [a0] Power Management version 2
> > 	Capabilities: [100] Virtual Channel <?>
> > 	Capabilities: [180] Root Complex Link <?>
> > 	Kernel driver in use: pcieport-driver
> > 	Kernel modules: shpchp
> >=20
> > 00:1c.3 PCI bridge: Intel Corporation 82801H (ICH8 Family) PCI Expr=
ess Port
> > 4 (rev 03) (prog-if 00 [Normal decode])
> > 	Flags: bus master, fast devsel, latency 0
> > 	Bus: primary=3D00, secondary=3D06, subordinate=3D06, sec-latency=3D=
0
> > 	I/O behind bridge: 00004000-00004fff
> > 	Memory behind bridge: f4000000-f7ffffff
> > 	Prefetchable memory behind bridge: 00000000fc000000-00000000fdffff=
ff
> > 	Capabilities: [40] Express Root Port (Slot+), MSI 00
> > 	Capabilities: [80] MSI: Mask- 64bit- Count=3D1/1 Enable+
> > 	Capabilities: [90] Subsystem: Dell Device 0273
> > 	Capabilities: [a0] Power Management version 2
> > 	Capabilities: [100] Virtual Channel <?>
> > 	Capabilities: [180] Root Complex Link <?>
> > 	Kernel driver in use: pcieport-driver
> > 	Kernel modules: shpchp
> >=20
> > 00:1c.4 PCI bridge: Intel Corporation 82801H (ICH8 Family) PCI Expr=
ess Port
> > 5 (rev 03) (prog-if 00 [Normal decode])
> > 	Flags: bus master, fast devsel, latency 0
> > 	Bus: primary=3D00, secondary=3D07, subordinate=3D07, sec-latency=3D=
0
> > 	I/O behind bridge: 00005000-00005fff
> > 	Memory behind bridge: c2000000-c20fffff
> > 	Prefetchable memory behind bridge: 00000000f8600000-00000000f86fff=
ff
> > 	Capabilities: [40] Express Root Port (Slot+), MSI 00
> > 	Capabilities: [80] MSI: Mask- 64bit- Count=3D1/1 Enable+
> > 	Capabilities: [90] Subsystem: Dell Device 0273
> > 	Capabilities: [a0] Power Management version 2
> > 	Capabilities: [100] Virtual Channel <?>
> > 	Capabilities: [180] Root Complex Link <?>
> > 	Kernel driver in use: pcieport-driver
> > 	Kernel modules: shpchp
> >=20
> > 00:1d.0 USB Controller: Intel Corporation 82801H (ICH8 Family) USB =
UHCI
> > Controller #1 (rev 03) (prog-if 00 [UHCI])
> > 	Subsystem: Dell Device 0273
> > 	Flags: bus master, medium devsel, latency 0, IRQ 23
> > 	I/O ports at 1860 [size=3D32]
> > 	Kernel driver in use: uhci_hcd
> > 	Kernel modules: uhci-hcd
> >=20
> > 00:1d.1 USB Controller: Intel Corporation 82801H (ICH8 Family) USB =
UHCI
> > Controller #2 (rev 03) (prog-if 00 [UHCI])
> > 	Subsystem: Dell Device 0273
> > 	Flags: bus master, medium devsel, latency 0, IRQ 19
> > 	I/O ports at 1880 [size=3D32]
> > 	Kernel driver in use: uhci_hcd
> > 	Kernel modules: uhci-hcd
> >=20
> > 00:1d.2 USB Controller: Intel Corporation 82801H (ICH8 Family) USB =
UHCI
> > Controller #3 (rev 03) (prog-if 00 [UHCI])
> > 	Subsystem: Dell Device 0273
> > 	Flags: bus master, medium devsel, latency 0, IRQ 18
> > 	I/O ports at 18a0 [size=3D32]
> > 	Kernel driver in use: uhci_hcd
> > 	Kernel modules: uhci-hcd
> >=20
> > 00:1d.7 USB Controller: Intel Corporation 82801H (ICH8 Family) USB2=
 EHCI
> > Controller #1 (rev 03) (prog-if 20 [EHCI])
> > 	Subsystem: Dell Device 0273
> > 	Flags: bus master, medium devsel, latency 0, IRQ 23
> > 	Memory at f8504c00 (32-bit, non-prefetchable) [size=3D1K]
> > 	Capabilities: [50] Power Management version 2
> > 	Capabilities: [58] Debug port: BAR=3D1 offset=3D00a0
> > 	Kernel driver in use: ehci_hcd
> > 	Kernel modules: ehci-hcd
> >=20
> > 00:1e.0 PCI bridge: Intel Corporation 82801 Mobile PCI Bridge (rev =
f3)
> > (prog-if 01 [Subtractive decode])
> > 	Flags: bus master, fast devsel, latency 0
> > 	Bus: primary=3D00, secondary=3D08, subordinate=3D08, sec-latency=3D=
32
> > 	Memory behind bridge: f8200000-f82fffff
> > 	Capabilities: [50] Subsystem: Dell Device 0273
> >=20
> > 00:1f.0 ISA bridge: Intel Corporation 82801HEM (ICH8M) LPC Interfac=
e
> > Controller (rev 03)
> > 	Subsystem: Dell Device 0273
> > 	Flags: bus master, medium devsel, latency 0
> > 	Capabilities: [e0] Vendor Specific Information <?>
> > 	Kernel modules: iTCO_wdt
> >=20
> > 00:1f.1 IDE interface: Intel Corporation 82801HBM/HEM (ICH8M/ICH8M-=
E) IDE
> > Controller (rev 03) (prog-if 8a [Master SecP PriP])
> > 	Subsystem: Dell Device 0273
> > 	Flags: bus master, medium devsel, latency 0, IRQ 18
> > 	I/O ports at 01f0 [size=3D8]
> > 	I/O ports at 03f4 [size=3D1]
> > 	I/O ports at 0170 [size=3D8]
> > 	I/O ports at 0374 [size=3D1]
> > 	I/O ports at 1810 [size=3D16]
> > 	Kernel driver in use: ata_piix
> > 	Kernel modules: ata_generic, pata_acpi, ata_piix, ide-pci-generic,
> > piix
> >=20
> > 00:1f.2 SATA controller: Intel Corporation 82801HBM/HEM (ICH8M/ICH8=
M-E) SATA
> > AHCI Controller (rev 03) (prog-if 01 [AHCI 1.0])
> > 	Subsystem: Dell Device 0273
> > 	Flags: bus master, 66MHz, medium devsel, latency 0, IRQ 28
> > 	I/O ports at 1c00 [size=3D8]
> > 	I/O ports at 18d4 [size=3D4]
> > 	I/O ports at 18d8 [size=3D8]
> > 	I/O ports at 18d0 [size=3D4]
> > 	I/O ports at 18e0 [size=3D32]
> > 	Memory at f8504000 (32-bit, non-prefetchable) [size=3D2K]
> > 	Capabilities: [80] MSI: Mask- 64bit- Count=3D1/4 Enable+
> > 	Capabilities: [70] Power Management version 3
> > 	Capabilities: [a8] SATA HBA <?>
> > 	Kernel driver in use: ahci
> > 	Kernel modules: ahci
> >=20
> > 00:1f.3 SMBus: Intel Corporation 82801H (ICH8 Family) SMBus Control=
ler (rev
> > 03)
> > 	Subsystem: Dell Device 0273
> > 	Flags: medium devsel, IRQ 18
> > 	Memory at c2100000 (32-bit, non-prefetchable) [size=3D256]
> > 	I/O ports at 1c20 [size=3D32]
> > 	Kernel driver in use: i801_smbus
> > 	Kernel modules: i2c-i801
> >=20
> > 06:00.0 Network controller: Intel Corporation PRO/Wireless 3945ABG =
[Golan]
> > Network Connection (rev 02)
> > 	Subsystem: Intel Corporation Device 1021
> > 	Flags: bus master, fast devsel, latency 0, IRQ 30
> > 	Memory at f4000000 (32-bit, non-prefetchable) [size=3D4K]
> > 	Capabilities: [c8] Power Management version 2
> > 	Capabilities: [d0] MSI: Mask- 64bit+ Count=3D1/1 Enable+
> > 	Capabilities: [e0] Express Legacy Endpoint, MSI 00
> > 	Capabilities: [100] Advanced Error Reporting
> > 	Capabilities: [140] Device Serial Number 96-50-75-ff-ff-3c-1f-00
> > 	Kernel driver in use: iwl3945
> > 	Kernel modules: iwl3945
> >=20
> > 07:00.0 Ethernet controller: Realtek Semiconductor Co., Ltd. RTL811=
1/8168B
> > PCI Express Gigabit Ethernet controller (rev 02)
> > 	Subsystem: Dell Device 0273
> > 	Flags: bus master, fast devsel, latency 0, IRQ 29
> > 	I/O ports at 5000 [size=3D256]
> > 	Memory at f8610000 (64-bit, prefetchable) [size=3D4K]
> > 	Memory at f8600000 (64-bit, prefetchable) [size=3D64K]
> > 	[virtual] Expansion ROM at f8620000 [disabled] [size=3D64K]
> > 	Capabilities: [40] Power Management version 3
> > 	Capabilities: [50] MSI: Mask- 64bit+ Count=3D1/2 Enable+
> > 	Capabilities: [70] Express Endpoint, MSI 01
> > 	Capabilities: [b0] MSI-X: Enable- Mask- TabSize=3D2
> > 	Capabilities: [d0] Vital Product Data
> > 	Capabilities: [100] Advanced Error Reporting
> > 	Capabilities: [140] Virtual Channel <?>
> > 	Capabilities: [160] Device Serial Number 00-00-00-00-00-00-00-00
> > 	Kernel driver in use: r8169
> > 	Kernel modules: r8169
> >=20
> > 08:05.0 FireWire (IEEE 1394): O2 Micro, Inc. Firewire (IEEE 1394) (=
rev 02)
> > (prog-if 10 [OHCI])
> > 	Subsystem: Dell Device 0273
> > 	Flags: bus master, medium devsel, latency 64, IRQ 22
> > 	Memory at f8200000 (32-bit, non-prefetchable) [size=3D4K]
> > 	Memory at f8202000 (32-bit, non-prefetchable) [size=3D2K]
> > 	Capabilities: [60] Power Management version 2
> > 	Kernel driver in use: ohci1394
> > 	Kernel modules: ohci1394
> >=20
> > 08:05.2 SD Host controller: O2 Micro, Inc. Integrated MMC/SD Contro=
ller (rev
> > 02) (prog-if 01)
> > 	Subsystem: Dell Device 0273
> > 	Flags: bus master, slow devsel, latency 32, IRQ 22
> > 	Memory at f8202800 (32-bit, non-prefetchable) [size=3D256]
> > 	Capabilities: [a0] Power Management version 2
> > 	Kernel driver in use: sdhci-pci
> > 	Kernel modules: sdhci-pci
> >=20
> > 08:05.3 Mass storage controller: O2 Micro, Inc. Integrated MS/xD Co=
ntroller
> > (rev 01)
> > 	Subsystem: Dell Device 0273
> > 	Flags: slow devsel, IRQ 10
> > 	Memory at f8201000 (32-bit, non-prefetchable) [size=3D4K]
> > 	Capabilities: [a0] Power Management version 2
> >=20
>=20
>=20
> [7.6.] SCSI information (from /proc/scsi/scsi)
>=20
> > Attached devices:
> > Host: scsi0 Channel: 00 Id: 00 Lun: 00
> >   Vendor: ATA      Model: ST9160827AS      Rev: 3.AD
> >   Type:   Direct-Access                    ANSI  SCSI revision: 05
> > Host: scsi3 Channel: 00 Id: 00 Lun: 00
> >   Vendor: Optiarc  Model: DVD+-RW AD-7640A Rev: JD05
> >   Type:   CD-ROM                           ANSI  SCSI revision: 05
>=20
>=20
> [7.7.] Other information that might be relevant to the problem
>        (please look in /proc and include all information that you
>        think to be relevant):
>=20
> Here's the contents of my /etc/fstab:
> > none                   /dev/pts      devpts    defaults            =
0      0
> > none                   /dev/shm      tmpfs     defaults            =
0      0
> >=20
> > /dev/sda3   /boot   ext2        defaults        0 1
> > /dev/sda5   /       reiserfs    data=3Djournal    0 1
> > /dev/sda6   swap    swap        defaults        0 0
> > /dev/sda7   /home   reiserfs    data=3Djournal    0 1
> >=20
> > /dev/cdrom          /mnt/cdrom  auto    ro,user,noauto  0 0
> > /dev/usbkey/part1   /mnt/key    vfat
> > user,noauto,async,iocharset=3Dutf8,shortname=3Dwin95,umask=3D0133,d=
mask=3D0022    0
> > 0
> > /dev/usbcard/cf1    /mnt/cf     vfat
> > user,noauto,async,iocharset=3Dutf8,shortname=3Dwin95,umask=3D0133,d=
mask=3D0022    0
> > 0
> > /dev/usbcard/xd1    /mnt/xd     vfat
> > user,noauto,async,iocharset=3Dutf8,shortname=3Dwin95,umask=3D0133,d=
mask=3D0022    0
> > 0
>=20
>=20
> --=20
> mailto:jeberger@free.fr
> http://jeberger.free.fr
> Jabber: jeberger@jabber.fr
>=20
> --
> To unsubscribe from this list: send the line "unsubscribe reiserfs-de=
vel" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>=20
>=20

--=20
BOFH excuse #440:

Cache miss - please take better aim next time
--
To unsubscribe from this list: send the line "unsubscribe reiserfs-deve=
l" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
