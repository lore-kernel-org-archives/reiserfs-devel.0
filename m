From: "Vladimir V. Saveliev" <vs@namesys.com>
Subject: Re: Reiser4 problems on gentoo & 2.6.14-rc1-mm1
Date: Wed, 12 Oct 2005 15:17:13 +0400
Message-ID: <434CF0B9.7030406@namesys.com>
References: <200510121243.55956.ax@natur.cuni.cz>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-26505-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200510121243.55956.ax@natur.cuni.cz>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-9"
To: ax@natur.cuni.cz
Cc: reiserfs-list@namesys.com

Hello

I believe it is fixed in 2.6.14-rc2-mm2. Please use it.

PS: if it still does not work - try to set REISER4_USE_EFLUSH macro (it is =
in
file fs/reiser4/reiser4.h) to 1.
If that does not help - please report.

V=E1clav H=F9la wrote:
> Hi,
>   i'm getting frequent lockups in my testing chrooted environment
> (Athlon XP, gcc version 3.4.4 (Gentoo 3.4.4-r1, ssp-3.4.4-1.0,
> pie-8.7.8)) during emerge. When this occurs, further operations
> on the reiser4 partitions are impossible, and following can be found in
> /var/log/messages. Rest of the system (on reiser v3 partition) works fine.
>=20
> Oct  7 12:28:12 cit2 kernel: ------------[ cut here ]------------
> Oct  7 12:28:12 cit2 kernel: Modules linked in: usbnet it87 hwmon_vid i2c=
_isa i2c_viapro ipt_state ipt_MASQUERADE ipt_LOG iptable_nat ip_conntrack i=
ptable_mangle iptable_filter ip_tables snd_pcm_oss snd_mixe
> r_oss snd_seq_oss snd_seq_midi_event snd_seq snd_cmipci snd_opl3_lib snd_=
hwdep snd_via82xx snd_ac97_codec snd_ac97_bus snd_pcm snd_timer snd_page_al=
loc snd_mpu401_uart snd_rawmidi snd_seq_device snd soundcor
> e sd_mod vfat fat usbhid usb_storage ehci_hcd via_agp agpgart wacom radeo=
nfb i2c_algo_bit cfbcopyarea cfbimgblt cfbfillrect i2c_core softcursor
> Oct  7 12:28:12 cit2 kernel: CPU:    0
> Oct  7 12:28:12 cit2 kernel: EIP:    0060:[<c01cdc0b>]    Not tainted VLI
> Oct  7 12:28:12 cit2 kernel: EFLAGS: 00010297   (2.6.14-rc1-mm1)
> Oct  7 12:28:12 cit2 kernel: EIP is at sub_from_ctx_grabbed+0x3b/0x50
> Oct  7 12:28:12 cit2 kernel: eax: 00000000   ebx: 00000000   ecx: 0000000=
1   edx: 00000000
> Oct  7 12:28:12 cit2 kernel: esi: cc7ce940   edi: d1e04000   ebp: c2629c6=
0   esp: c07f3d44
> Oct  7 12:28:12 cit2 kernel: ds: 007b   es: 007b   ss: 0068
> Oct  7 12:28:12 cit2 kernel: Process ld (pid: 31883, threadinfo=3Dc07f200=
0 task=3Dccaa2580)
> Oct  7 12:28:12 cit2 kernel: Stack: 00000001 00000000 c01cec2f cc7ce940 0=
0000001 00000000 d485fec0 d485fec0
> Oct  7 12:28:12 cit2 kernel:        cc2876c0 c01d0b4d cc2876c0 00000001 0=
0000000 d485fec0 d485fec0 c2629d0c
> Oct  7 12:28:12 cit2 kernel:        c01d0bac d485fec0 cc2876c0 00000000 c=
01d0bde d485fec0 c07f3e2c 00000000
> Oct  7 12:28:12 cit2 kernel: Call Trace:
> Oct  7 12:28:12 cit2 kernel:  [<c01cec2f>] grabbed2flush_reserved_nolock+=
0x3f/0x80
> Oct  7 12:28:12 cit2 kernel:  [<c01d0b4d>] do_jnode_make_dirty+0x11d/0x150
> Oct  7 12:28:12 cit2 kernel:  [<c01d0bac>] jnode_make_dirty_locked+0x2c/0=
x40
> Oct  7 12:28:12 cit2 kernel:  [<c01d0bde>] znode_make_dirty+0x1e/0x90
> Oct  7 12:28:12 cit2 kernel:  [<c01e9a72>] update_sd_at+0xd2/0x220
> Oct  7 12:28:12 cit2 kernel:  [<c01e9949>] locate_inode_sd+0xa9/0x100
> Oct  7 12:28:12 cit2 kernel:  [<c01e9c3b>] update_sd+0x7b/0xa0
> Oct  7 12:28:12 cit2 kernel:  [<c01dc920>] reiser4_dirty_inode+0x0/0xa0
> Oct  7 12:28:12 cit2 kernel:  [<c01e8ba0>] write_sd_by_inode_common+0xb0/=
0xc0
> Oct  7 12:28:12 cit2 kernel:  [<c01c34ec>] jrelse_tail+0x3c/0x50
> Oct  7 12:28:12 cit2 kernel:  [<c01e0638>] reiser4_update_sd+0x28/0x40
> Oct  7 12:28:12 cit2 kernel:  [<c01dc920>] reiser4_dirty_inode+0x0/0xa0
> Oct  7 12:28:12 cit2 kernel:  [<c01dc94c>] reiser4_dirty_inode+0x2c/0xa0
> Oct  7 12:28:12 cit2 kernel:  [<c01dc920>] reiser4_dirty_inode+0x0/0xa0
> Oct  7 12:28:12 cit2 kernel:  [<c017849b>] __mark_inode_dirty+0xdb/0x190
> Oct  7 12:28:12 cit2 kernel:  [<c011a13d>] current_fs_time+0x4d/0x60
> Oct  7 12:28:12 cit2 kernel:  [<c016fc46>] update_atime+0x66/0xa0
> Oct  7 12:28:12 cit2 kernel:  [<c01ec884>] read_unix_file+0x394/0x400
> Oct  7 12:28:12 cit2 kernel:  [<c01547ac>] vfs_read+0x1ac/0x1c0
> Oct  7 12:28:12 cit2 kernel:  [<c0154b11>] sys_read+0x51/0x80
> Oct  7 12:28:12 cit2 kernel:  [<c0102d5f>] sysenter_past_esp+0x54/0x75
> Oct  7 12:28:12 cit2 kernel: Code: 24 14 8b 4c 24 10 8b 56 60 8b 46 5c 39=
 da 76 15 29 c8 19 da 89 46 5c 89 56 60 8b 1c 24 8b 74 24 04 83 c4 08 c3 72=
 04 39 c8 73 e5 <0f> 0b 95 00 f8 e7 37 c0 eb db 8d 74 26 00
>  8d bc 27 00 00 00 00
> Oct  7 12:28:12 cit2 kernel:  <4>reiser4[ld(31883)]: release_unix_file (f=
s/reiser4/plugin/file/file.c:2683)[vs-44]:
> Oct  7 12:28:12 cit2 kernel: WARNING: out of memory?
> Oct  7 12:28:12 cit2 kernel: reiser4[ld(31883)]: release_unix_file (fs/re=
iser4/plugin/file/file.c:2683)[vs-44]:
> Oct  7 12:28:12 cit2 kernel: WARNING: out of memory?
> Oct  7 12:28:12 cit2 kernel: reiser4[ld(31883)]: release_unix_file (fs/re=
iser4/plugin/file/file.c:2683)[vs-44]:
> Oct  7 12:28:12 cit2 kernel: WARNING: out of memory?
>=20
> Ax

